//
//  SettingController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SettingController.h"
#import "MainController.h"
#import "LoginMainController.h"

#import "AFNetworking.h"
#import "LoginModel.h"
#import "NetHttpsManager.h"
@interface SettingController ()

@end

@implementation SettingController



- (void)viewDidLoad {
    [super viewDidLoad];
    _settingView = [[SettingView alloc] init];
    _settingView.delegate = self;
    _settingView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_settingView.view];

    [_settingView.backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_settingView.saveBtn addTarget:self action:@selector(clickSaveBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)clickBackBtn:(id)sender {
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController popViewControllerAnimated:YES];

    /*
    MainController * mainController = [[MainController alloc] init];
    self.navigationController.navigationBarHidden=YES;
    [self.navigationController pushViewController: mainController animated:YES];*/
}
- (IBAction)clickSaveBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) postLogout : (NSMutableDictionary*) paramDict{
    NetHttpsManager * netHttpsManager = [[NetHttpsManager alloc] init];
    if (![netHttpsManager isExistenceNetwork])
    {
        DLog(@"請檢查網路");
    }
    else
    {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager POST:[URL_main stringByAppendingString:URL_logout] parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            DLog(@"Http Success!!");
            if ([responseObject objectForKey:@"success"]) {
                LoginMainController * loginMainController = [[LoginMainController alloc] init];
                [self presentViewController:loginMainController animated:YES completion:NULL];
            }else{
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
- (void) memberLogout{
    LoginModel * loginModel = [LoginModel instance];
    
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    paramDict[@"token"] = loginModel.token;
    [self postLogout:paramDict];

}
@end
