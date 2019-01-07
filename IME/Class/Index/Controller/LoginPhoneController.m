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
    
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    paramDict[@"phone_no"] = @"886932106246";

    [self postSendAuthCode:paramDict];
    

    
    
    /*
    LoginVerifyController * loginVerifyController = [[LoginVerifyController alloc] init];
    [self presentViewController:loginVerifyController animated:YES completion:NULL];
  */
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
- (void) postSendAuthCode : (NSMutableDictionary*) paramDict{
    
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
                LoginVerifyController * loginVerifyController = [[LoginVerifyController alloc] init];
                loginVerifyController.countdownTime = [[[responseObject objectForKey:@"data"] objectForKey:@"valid_seconds"] integerValue];
                [self presentViewController:loginVerifyController animated:YES completion:NULL];
            }else{
                NSLog(@"Success Fail!!");
            }
            LoginModel * loginModel = [LoginModel instance];
            loginModel.success = [[NSString alloc] init];
            loginModel.success = [responseObject objectForKey:@"success"];
            loginModel.msg = [responseObject objectForKey:@"msg"];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            DLog(@"Http Fail!!");
        }];
    }
}
@end
