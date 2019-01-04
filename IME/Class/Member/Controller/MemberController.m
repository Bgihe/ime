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
@interface MemberController ()
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

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _memberView = [[MemberView alloc] init];
    _memberView.delegate = self;
    _memberView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [_memberView.followBtn addTarget:self action:@selector(clickFollowBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_memberView.fanBtn addTarget:self action:@selector(clickFollowBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //followBtn
    [self.view addSubview:_memberView.view];
    [self performSelector:@selector(addPageView) withObject:nil afterDelay:0.0];
}
- (IBAction)clickFollowBtn:(UIButton *)sender {
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

- (void)presentController :(long)indexRow {
    
    if (indexRow == 0) {
        ReplyPriceController * replyPriceController = [[ReplyPriceController alloc] init];
        self.navigationController.navigationBarHidden = NO;
        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController: replyPriceController animated:YES];
    }else if(indexRow == 1){
        IncomeMainController * incomeMainController = [[IncomeMainController alloc] init];
        self.navigationController.navigationBarHidden = NO;
        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController: incomeMainController animated:YES];
    }else if(indexRow == 2){
        DepositController * depositController = [[DepositController alloc] init];
        self.navigationController.navigationBarHidden = NO;
        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController: depositController animated:YES];
    }else if(indexRow == 3){
        LogController * logController = [[LogController alloc] init];
        self.navigationController.navigationBarHidden = NO;
        self.tabBarController.tabBar.hidden = YES;
        [self.navigationController pushViewController: logController animated:YES];
    }else if(indexRow == 4){
        SettingController * settingController = [[SettingController alloc] init];
        self.navigationController.navigationBarHidden=NO;
        self.tabBarController.tabBar.hidden = YES;
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
