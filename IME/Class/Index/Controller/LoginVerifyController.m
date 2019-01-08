//
//  LoginVerifyController.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LoginVerifyController.h"
#import "AFNetworking.h"
#import "LoginModel.h"
#import "PermissionsModel.h"
#import "MJExtension.h"
@interface LoginVerifyController ()

@end

@implementation LoginVerifyController

- (void)viewWillAppear:(BOOL)animated{
    _countdownTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(authCodeTimeGo) userInfo:nil repeats:YES];
    [_loginVerifyView refreshPhoneLabel:_phoneNo];
    NSLog(@"我又進來了");
    _isViewLive = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"我又出去了");
    _isViewLive = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loginVerifyView = [[LoginVerifyView alloc] init];
    _loginVerifyView.delegate = self;
    _loginVerifyView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_loginVerifyView.view];
    
    [_loginVerifyView.backBtn addTarget:self action:@selector(clickBackBtnBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_loginVerifyView.nextBtn addTarget:self action:@selector(clickNextBtn:) forControlEvents:UIControlEventTouchUpInside];
}


-(void)authCodeTimeGo{
    NSLog(@"ping");
    [_loginVerifyView refreshMsgLabel:_countdownTime];
    if (_countdownTime <= 0) {
        NSLog(@"Out");
        [_countdownTimer invalidate];
        _countdownTimer = nil;
        if (_isViewLive) {
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"訊息"
                                          message:@"已超過輸入認證碼的期限，請重新認證"
                                          preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
    }
    _countdownTime = _countdownTime - 1;
}

- (IBAction)clickBackBtnBtn:(id)sender {
    [_countdownTimer invalidate];
    _countdownTimer = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickNextBtn:(id)sender {
    
    
    if (_loginVerifyView.verifyTextField.text.length >= 6) {
        NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
        paramDict[@"phone_no"] = [[NSString alloc] initWithFormat:@"886%@",_phoneNo];
        paramDict[@"code"] = _loginVerifyView.verifyTextField.text;
        [self postPhoneLogin:paramDict];
 
    }else{
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"訊息"
                                      message:@"認證碼格式錯誤"
                                      preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
    
//    MainController * mainController = [[MainController alloc] init];
//    [self presentViewController:mainController animated:YES completion:NULL];
}
- (void) postPhoneLogin : (NSMutableDictionary*) paramDict{
    if (![self isExistenceNetwork])
    {
        DLog(@"請檢查網路");
    }
    else
    {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager POST:[URL_main stringByAppendingString:URL_phone_login] parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            DLog(@"Http Success!!");
            DLog(@"%@",responseObject);
            NSLog(@"%@",[[responseObject objectForKey:@"data"] objectForKey:@"new"]);
            if ([responseObject objectForKey:@"success"]) {
                [self->_countdownTimer invalidate];
                self->_countdownTimer = nil;
                
                //---- member
                LoginModel * loginModel = [LoginModel instance];
                NSDictionary *loginDict = [responseObject objectForKey:@"data"];
                for(NSString *key in [loginDict allKeys]) {
                    NSString *value = [loginDict objectForKey:key];
                    if([value isKindOfClass:[NSNumber class]]){
                        value = [NSString stringWithFormat:@"%@",value];
                        DLog(@"Value:%@",value);
                    }else if([value isKindOfClass:[NSNull class]])
                        value = @"";
                    @try {
                        [loginModel setValue:value forKey:key];
                    }
                    @catch (NSException *exception) {
                        DLog(@"试图添加不存在的key:%@到实例:%@中.",key,NSStringFromClass([self class]));
                    }
                }
                
                
                //---- Permissions
                PermissionsModel * permissionsModel = [PermissionsModel instance];
                NSDictionary *permissionsDict = [[responseObject objectForKey:@"data"] objectForKey:@"permissions"];
                
                for(NSString *key in [permissionsDict allKeys]) {
                    NSString *value = [permissionsDict objectForKey:key];
                    if([value isKindOfClass:[NSNumber class]]){
                        value = [NSString stringWithFormat:@"%@",value];
                        DLog(@"Value%@",value);
                    }else if([value isKindOfClass:[NSNull class]])
                        value = @"";
                    @try {
                        [permissionsModel setValue:value forKey:key];
                    }
                    @catch (NSException *exception) {
                        DLog(@"试图添加不存在的key:%@到实例:%@中.",key,NSStringFromClass([self class]));
                    }
                }
                
                if ([[responseObject objectForKey:@"data"] objectForKey:@"new"]) { 
                    SignupController * signupController = [[SignupController alloc] init];
                    [self presentViewController:signupController animated:YES completion:NULL];
                    
                }else {
                    KPostNotification(KNotificationLoginStateChange, @YES);
                }
            }else{
        
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
