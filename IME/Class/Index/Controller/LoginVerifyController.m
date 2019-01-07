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
#import "MJExtension.h"
@interface LoginVerifyController ()

@end

@implementation LoginVerifyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loginVerifyView = [[LoginVerifyView alloc] init];
    _loginVerifyView.delegate = self;
    _loginVerifyView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_loginVerifyView.view];
    
    [_loginVerifyView.backBtn addTarget:self action:@selector(clickBackBtnBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_loginVerifyView.nextBtn addTarget:self action:@selector(clickNextBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated{
    _countdownTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(authCodeTimeGo) userInfo:nil repeats:YES];
}
-(void)authCodeTimeGo{
    NSLog(@"ping");
    [_loginVerifyView refreshMsgLabel:_countdownTime];
    if (_countdownTime <= 0) {
        NSLog(@"Out");
        [_countdownTimer invalidate];
        _countdownTimer = nil;
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"提示"
                                      message:@"已超過認證時，請重新認證"
                                      preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    _countdownTime = _countdownTime - 1;
}

- (IBAction)clickBackBtnBtn:(id)sender {
    [_countdownTimer invalidate];
    _countdownTimer = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickNextBtn:(id)sender {
    [_countdownTimer invalidate];
    _countdownTimer = nil;
    
    
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    paramDict[@"phone_no"] = @"886932106246";
    paramDict[@"code"] = @"123456";
    
    //KPostNotification(KNotificationLoginStateChange, @YES);
    [self postPhoneLogin:paramDict];
    
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
            NSLog(@"%@",responseObject);
            NSLog(@"%@",[[responseObject objectForKey:@"data"] objectForKey:@"valid_seconds"]);
            if ([[[responseObject objectForKey:@"success"] stringValue]isEqualToString:@"1"]) {
                KPostNotification(KNotificationLoginStateChange, @YES);
            }else{
              
            }
            
            
            
            LoginModel * model = [LoginModel mj_objectWithKeyValues:[responseObject objectForKey:@"data"]];
            
            NSLog(@"%@",model.phone_no);
            
            /*
            for (NSDictionary * bankerDic in responseObject)
            {
                NSLog(@"%@",bankerDic);
                LoginModel * model = [LoginModel mj_objectWithKeyValues:bankerDic];
                //model.isSelect = NO;
                
            }*/
            
            
//            LoginModel * loginModel = [LoginModel instance];
//            loginModel.success = [[NSString alloc] init];
//            loginModel.success = [responseObject objectForKey:@"success"];
//            loginModel.msg = [responseObject objectForKey:@"msg"];
            
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
