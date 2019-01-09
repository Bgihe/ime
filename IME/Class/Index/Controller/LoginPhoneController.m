//
//  LoginPhoneController.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LoginPhoneController.h"
#import "AFNetworking.h"

@interface LoginPhoneController ()

@end

@implementation LoginPhoneController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loginPhoneView = [[LoginPhoneView alloc] init];
    _loginPhoneView.delegate = self;
    _loginPhoneView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_loginPhoneView.view];
    
    [_loginPhoneView.backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_loginPhoneView.nextBtn addTarget:self action:@selector(clickNextBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)clickBackBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickNextBtn:(id)sender {
 
    
    NSString *phoneNumber = _loginPhoneView.phoneTextField.text;
    NSString *phoneRegex = [[NSString alloc] init];
    if (phoneNumber.length == 10) {
        phoneRegex = @"^[09]{2}[0-9]{8}$";
        //[str substringFromIndex:n];
        
    }else if(phoneNumber.length == 9){
        phoneRegex = @"^[9]{1}[0-9]{8}$";
    }else{
        
    }
 
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    BOOL matches = [predicate evaluateWithObject:phoneNumber];
    if (matches) {
        if (phoneNumber.length == 10) {
            phoneNumber = [phoneNumber substringFromIndex:1];
        }
        NSLog(@"%@",phoneNumber);
        
        NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
        //paramDict[@"phone_no"] = @"886932106246";
        paramDict[@"phone_no"] = [[NSString alloc] initWithFormat:@"886%@",phoneNumber];
        [self postSendAuthCode:paramDict :phoneNumber];
    }else{
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"訊息"
                                      message:@"請輸入正確的手機號碼"
                                      preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
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
- (void) postSendAuthCode : (NSMutableDictionary*) paramDict :(NSString*) phone{
    
    if (![self isExistenceNetwork])
    {
        DLog(@"請檢查網路");
    }
    else
    {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager POST:[URL_main stringByAppendingString:URL_send_auth_code] parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            DLog(@"Http Success!!");
            NSLog(@"%@",responseObject);
            NSLog(@"%@",[[responseObject objectForKey:@"data"] objectForKey:@"valid_seconds"]);
            if ([[[responseObject objectForKey:@"success"] stringValue]isEqualToString:@"1"]) {
                
                [self->_loginPhoneView removeFromSuperview];
                
                
                LoginVerifyController * loginVerifyController = [[LoginVerifyController alloc] init];
                loginVerifyController.countdownTime = [[[responseObject objectForKey:@"data"] objectForKey:@"valid_seconds"] integerValue];
                loginVerifyController.phoneNo = phone;
                [self presentViewController:loginVerifyController animated:YES completion:NULL];
            }else{
                NSLog(@"Success Fail!!");
            }
 
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            DLog(@"Http Fail!!");
        }];
    }
}
@end
