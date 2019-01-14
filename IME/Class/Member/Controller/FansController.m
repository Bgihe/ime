//
//  FansController.m
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import "FansController.h"
#import "SpotLightController.h"
#import "NetHttpsModel.h"
#import "LoginModel.h"
#import <SVProgressHUD.h>
@interface FansController ()<NetHttpsModelDelegate>

@end

@implementation FansController
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    DLog(@"數字:%ld",_btnTag)
    _fansView = [[FansView alloc] init];
    _fansView.delegate = self;
    _fansView.btnTag = _btnTag;
    _fansView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_fansView.view];
    
    [SVProgressHUD showWithStatus:@"loadding"];
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    LoginModel * loginModel = [LoginModel instance];
    paramDict[@"token"] = loginModel.token;
   
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    if (_btnTag == 300) {
        [netHttpsModel POSTWithUrl:URL_get_fans_data paramDict:paramDict];
        self.title = @"我的粉絲";
    }else{
        [netHttpsModel POSTWithUrl:URL_get_trace_data paramDict:paramDict];
        self.title = @"我追蹤者的主播";
    }
    
    
}

- (void) addSpotLightView : (NSMutableArray *) userData {
//    SpotLightController * spotLightController = [[SpotLightController alloc] init];
//    self.navigationController.navigationBarHidden = YES;
//    self.tabBarController.tabBar.hidden = YES;
//    [self.navigationController pushViewController: spotLightController animated:NO];
    
    
    
    
    
    //[_spotLightView refreshUI:<#(UIImage *)#> :<#(NSString *)#> :<#(NSString *)#>]
    
}
- (void) reloadFansTableView : (NSMutableArray*) fansList{
    _fansView.dataArr = fansList;
    [_fansView.tableView reloadData];
    [SVProgressHUD dismiss];
}
- (void) httpResult: (NSDictionary*) responseObject :(NSString *) url {
    if ([url isEqualToString:URL_get_fans_data]) {
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            NSLog(@"URL_get_fans_data");
            NSLog(@"%@",responseObject);
            [self reloadFansTableView:[[responseObject objectForKey:@"data"]objectForKey:@"data"]];
        }
    }else if([url isEqualToString:URL_get_trace_data]){
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            NSLog(@"URL_get_trace_data");
            NSLog(@"%@",responseObject);
            [self reloadFansTableView:[[responseObject objectForKey:@"data"]objectForKey:@"data"]];
        }
    }
}
@end
