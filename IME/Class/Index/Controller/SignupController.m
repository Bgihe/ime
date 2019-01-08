//
//  SignupController.m
//  IME
//
//  Created by apple on 2019/1/8.
//  Copyright © 2019 apple. All rights reserved.
//

#import "SignupController.h"
#import "AFNetworking.h"
#import "LoginModel.h"

@interface SignupController ()

@end

@implementation SignupController

- (void)viewDidLoad {
    [super viewDidLoad];
    _signupView = [[SignupView alloc] init];
    _signupView.delegate = self;
    _signupView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_signupView.view];
    
    [_signupView.maleBtn addTarget:self action:@selector(clickGenderBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_signupView.femaleBtn addTarget:self action:@selector(clickGenderBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_signupView.nextBtn addTarget:self action:@selector(clickNextBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_signupView.logoutBtn addTarget:self action:@selector(clickLogoutBtn:) forControlEvents:UIControlEventTouchUpInside];

}
- (IBAction)clickLogoutBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickGenderBtn:(UIButton *)sender {
    if (sender.tag == 100) {
        _genderStr = @"F";
        [_signupView refreshSexLabel:YES];
    }else{
        _genderStr = @"M";
        [_signupView refreshSexLabel:NO];
    }
}

- (IBAction)clickNextBtn:(UIButton *)sender {
    
    
    NSString *phoneNumber = _signupView.nameTextField.text;
    NSString *phoneRegex =  @"^[A-Za-z-0-9_./]+$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    BOOL matches = [predicate evaluateWithObject:phoneNumber];
    if (matches) {
        NSLog(@"T");
    }else{
        NSLog(@"F");
    }
    
    
    if (!_genderStr || [_genderStr isEqualToString:@""]) {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"訊息"
                                      message:@"請選擇性別"
                                      preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }else if(!_signupView.nameTextField.text || [_signupView.nameTextField.text isEqualToString:@""]){
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"訊息"
                                      message:@"請填寫姓名"
                                      preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }else if(!matches){
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"訊息"
                                      message:@"請勿使用英文字母、數字或.及_以外的特殊字元表請"
                                      preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    
    }else{
        LoginModel * loginModel = [LoginModel instance];
        NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
        paramDict[@"token"] = loginModel.token;
        paramDict[@"gender"] = _genderStr;
        paramDict[@"account"] = _signupView.nameTextField.text;
        [self postSetAccount:paramDict];
    }

}

- (void) postSetAccount : (NSMutableDictionary*) paramDict{
    if (![self isExistenceNetwork])
    {
        DLog(@"請檢查網路");
    }
    else
    {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager POST:[URL_main stringByAppendingString:URL_set_account] parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            DLog(@"Http Success!!");
            DLog(@"%@",responseObject);
            if ([responseObject objectForKey:@"success"]) {
                KPostNotification(KNotificationLoginStateChange, @YES);
            }else if(![responseObject objectForKey:@"success"]){
                UIAlertController * alert=   [UIAlertController
                                              alertControllerWithTitle:@"訊息"
                                              message:[responseObject objectForKey:@"error"]
                                              preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:nil]];
                [self presentViewController:alert animated:YES completion:nil];
            }

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            DLog(@"Http Fail!!");
        }];
    }
}

#pragma mark 判断当前网络状态
- (BOOL)isExistenceNetwork
{
    BOOL isExistenceNetwork = YES;
    switch ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus)
    {
        case AFNetworkReachabilityStatusUnknown:
            isExistenceNetwork = YES;
            break;
        case AFNetworkReachabilityStatusNotReachable:
            isExistenceNetwork = NO;
            break;
        case AFNetworkReachabilityStatusReachableViaWWAN:
            isExistenceNetwork = YES;
            break;
        case AFNetworkReachabilityStatusReachableViaWiFi:
            isExistenceNetwork = YES;
            break;
            
        default:
            break;
    }
    
    return isExistenceNetwork;
}
@end
