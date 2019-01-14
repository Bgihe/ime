//
//  MemberMenuController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MemberMenuController.h"
#import "SettingController.h"
#import "LoginModel.h"
#import "PermissionsModel.h"
#import "NetHttpsModel.h"
@interface MemberMenuController ()<NetHttpsModelDelegate>

@end

@implementation MemberMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    _memberMenuView = [[MemberMenuView alloc] init];
    _memberMenuView.delegate = self;
    _memberMenuView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_memberMenuView.view];
    
    
    LoginModel * loginModel = [LoginModel instance];
    
    PermissionsModel * permissionsModel = [PermissionsModel instance];
    NSMutableArray * titleArr = [[NSMutableArray alloc] init];
    NSMutableArray * iconArr = [[NSMutableArray alloc] init];
    
    if (permissionsModel.credits_setting) {
        [titleArr addObject:@"回覆/通話設定"];
        [iconArr addObject:@"person_list_call"];
    }
    if (permissionsModel.deposit) {
        [titleArr addObject:@"我的鑽石"];
        [iconArr addObject:@"person_list_daimond"];
    }
    //role
    if (loginModel.role == 2) {
        [titleArr addObject:@"我的收益"];
        [iconArr addObject:@"person_list_income"];
    }
    
    [titleArr addObject:@"使用紀錄"];
    [titleArr addObject:@"設定"];
 
    [iconArr addObject:@"person_list_record"];
    [iconArr addObject:@"person_list_setting"];
    
    _memberMenuView.dataArr = titleArr;
    _memberMenuView.iconArr = iconArr;
    [_memberMenuView.tableView reloadData];
    
    
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    paramDict[@"token"] = loginModel.token;
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    [netHttpsModel POSTWithUrl:URL_get_credits paramDict:paramDict];
}

- (void)presentController :(NSString*) cellTitle{
    [_delegate presentController:cellTitle];
}

#pragma mark - http api
- (void)httpResult: (NSDictionary*) responseObject :(NSString *) url {
    if ([url isEqualToString:URL_get_credits]) {
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            NSLog(@"%@",[[responseObject objectForKey:@"data"]objectForKey:@"credits"]);
            
            _memberMenuView.credits = [[[responseObject objectForKey:@"data"]objectForKey:@"credits"] intValue];
            [_memberMenuView.tableView reloadData];
        }
    }
}
    
@end
