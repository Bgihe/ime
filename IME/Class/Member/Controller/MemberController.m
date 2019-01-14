//
//  MemberController.m
//  IME
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MemberController.h"
#import "CAPSPageMenu.h"
#import "SettingController.h"
#import "FansController.h"
#import "ReplyPriceController.h"
#import "IncomeMainController.h"
#import "DepositController.h"
#import "LogController.h"
#import "MemberEditController.h"

#import "PermissionsModel.h"
#import "MemberModel.h"
#import "NetHttpsModel.h"

@interface MemberController ()<NetHttpsModelDelegate,MemberMenuViewDelegate>
@property (nonatomic) CAPSPageMenu *pageMenu;
@end

@implementation MemberController

- (void) addPageView{
    
    MemberMenuController * memberMenuController = [[MemberMenuController alloc] init];
    memberMenuController.delegate = self;
    memberMenuController.title =@"選單";
    MemberPostController * memberPostController = [[MemberPostController alloc] init];
    memberPostController.title =@"貼文";
    MemberBuyController * memberBuyController = [[MemberBuyController alloc] init];
    memberBuyController.title =@"已購";
    MemberFavoriteController * memberFavoriteController = [[MemberFavoriteController alloc] init];
    memberFavoriteController.title =@"最愛";
    
    NSArray *controllerArray = @[memberMenuController, memberPostController, memberBuyController, memberFavoriteController];
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor colorWithRed:221.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1],//標題底色
                                 CAPSPageMenuOptionViewBackgroundColor: [UIColor whiteColor],
                                 CAPSPageMenuOptionSelectionIndicatorColor: [UIColor colorWithRed:255.0/255.0 green:136.0/255.0 blue:146.0/255.0 alpha:1],
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor lightGrayColor],
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue" size:13.0],
                                 CAPSPageMenuOptionMenuHeight: @(40.0),
                                 CAPSPageMenuOptionMenuItemWidth: @(self.view.frame.size.width/5),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES),
                                 CAPSPageMenuOptionSelectedMenuItemLabelColor : [UIColor colorWithRed:255.0/255.0 green:136.0/255.0 blue:146.0/255.0 alpha:1],
                                 CAPSPageMenuOptionUnselectedMenuItemLabelColor : [UIColor colorWithRed:33.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1],
                                 CAPSPageMenuOptionHideTopMenuImg : @(NO),
                                 CAPSPageMenuOptionHideTopMenuBar : @(NO)
                                 };
    
    
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 0.0+ _memberView.view.frame.size.height*0.4, self.view.frame.size.width, _memberView.view.frame.size.height*0.6) options:parameters];
    [self.view addSubview:_pageMenu.view];
}

- (void)httpResult: (NSDictionary*) responseObject :(NSString *) url {
    if ([[responseObject objectForKey:@"success"] boolValue]) {
        //---- Member
        
        MemberModel * memberModel = [[MemberModel alloc] init];
        memberModel = [MemberModel instance];
        NSDictionary *memberDict = [responseObject objectForKey:@"data"];
        //thumbnail
        for(NSString *key in [memberDict allKeys]) {
            NSString *value = [memberDict objectForKey:key];
            if([value isKindOfClass:[NSNumber class]]){
                value = [NSString stringWithFormat:@"%@",value];
            }else if([value isKindOfClass:[NSNull class]])
                value = @"";
            @try {
                [memberModel setValue:value forKey:key];
            }
            @catch (NSException *exception) {
                DLog(@"欄位%@不再model裡面",key);
            }
        }
        memberModel = [MemberModel instance];
        NSLog(@"%@",memberModel.pictures);
        
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
        [_memberView reloadMemberUI];
    }else{
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"訊息"
                                      message:[responseObject objectForKey:@"error"]
                                      preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"確認" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    LoginModel * loginModel = [LoginModel instance];
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    paramDict[@"token"] = loginModel.token;
    paramDict[@"setting"] = @"0";
    paramDict[@"pictures"] = @"1";

    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    [netHttpsModel POSTWithUrl:URL_get_my_data paramDict:paramDict];
    [_memberView reloadMemberUI];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _memberView = [[MemberView alloc] init];
    _memberView.delegate = self;
    _memberView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [_memberView.fanBtn addTarget:self action:@selector(clickFollowBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_memberView.traceBtn addTarget:self action:@selector(clickTraceBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [_memberView.editBtn addTarget:self action:@selector(clickEditBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_memberView.view];
    
    
    [self performSelector:@selector(addPageView) withObject:nil afterDelay:0.0];
}
- (IBAction)clickEditBtn:(UIButton *)sender {
    MemberEditController * memberEditController = [[MemberEditController alloc] init];
    self.navigationController.navigationBarHidden=NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: memberEditController animated:YES];
}

- (IBAction)clickFollowBtn:(UIButton *)sender {
    FansController * fansController = [[FansController alloc] init];
    fansController.btnTag = sender.tag;
    self.navigationController.navigationBarHidden=NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: fansController animated:YES];
}
- (IBAction)clickTraceBtn:(UIButton *)sender {
    FansController * fansController = [[FansController alloc] init];
    fansController.btnTag = sender.tag;
    self.navigationController.navigationBarHidden=NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: fansController animated:YES];
}

- (void)didTapGoToRight {
    NSInteger currentIndex = self.pageMenu.currentPageIndex;
    
    if (currentIndex < self.pageMenu.controllerArray.count) {
        [self.pageMenu moveToPage:currentIndex + 1];
    }
}

- (void)presentController :(NSString*) cellTitle{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    if ([cellTitle isEqualToString:@"回覆/通話設定"]) {
        ReplyPriceController * replyPriceController = [[ReplyPriceController alloc] init];
        [self.navigationController pushViewController: replyPriceController animated:YES];
        
    }else if([cellTitle isEqualToString:@"我的收益"]){
        IncomeMainController * incomeMainController = [[IncomeMainController alloc] init];
        [self.navigationController pushViewController: incomeMainController animated:YES];
    }else if([cellTitle isEqualToString:@"我的鑽石"]){
        DepositController * depositController = [[DepositController alloc] init];
        [self.navigationController pushViewController: depositController animated:YES];
    }else if([cellTitle isEqualToString:@"使用紀錄"]){
        LogController * logController = [[LogController alloc] init];
        [self.navigationController pushViewController: logController animated:YES];
    }else if([cellTitle isEqualToString:@"設定"]){
        SettingController * settingController = [[SettingController alloc] init];
        [self.navigationController pushViewController: settingController animated:YES];
    }
    
}

- (IBAction)test1:(id)sender {
    [self.pageMenu moveToPage:0];
    
}
- (IBAction)test2:(id)sender {
    [self.pageMenu moveToPage:2];
}


@end
