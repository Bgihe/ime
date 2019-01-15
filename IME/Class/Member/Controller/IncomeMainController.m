//
//  IncomeMainController.m
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import "IncomeMainController.h"
#import "CAPSPageMenu.h"
#import "IncomeRankController.h"
#import "IncomeController.h"
#import "DiamondRankController.h"
#import "DiamondMainController.h"
@interface IncomeMainController ()<DiamondRankControllerDelegate>
@property (nonatomic) CAPSPageMenu *pageMenu;
@end

@implementation IncomeMainController
- (void)viewWillAppear:(BOOL)animated{
   // [self.pageMenu moveToPage:0];
    //[_pageMenu removeFromParentViewController];
 
    for(UIView *view in [self.view subviews])
    {
        [view removeFromSuperview];
    }
    [self performSelector:@selector(addPageView) withObject:nil afterDelay:0.0];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收益";
}

- (void) addPageView{
    IncomeController * incomeController = [[IncomeController alloc] init];
    incomeController.title = @"收益報表";
    
    IncomeRankController * incomeRankController = [[IncomeRankController alloc] init];
    incomeRankController.title = @"收益排行";
    
    DiamondRankController * diamondRankController = [[DiamondRankController alloc] init];
    diamondRankController.title = @"贈鑽排行";
    diamondRankController.delegate = self;
    
    NSArray *controllerArray = @[incomeController ,incomeRankController,diamondRankController];
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor colorWithRed:221.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1],//標題底色
                                 CAPSPageMenuOptionViewBackgroundColor: [UIColor whiteColor],
                                 CAPSPageMenuOptionSelectionIndicatorColor: [UIColor colorWithRed:255.0/255.0 green:136.0/255.0 blue:146.0/255.0 alpha:1],
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor lightGrayColor],
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue" size:17.0],
                                 CAPSPageMenuOptionMenuHeight: @(40.0),
                                 CAPSPageMenuOptionMenuItemWidth: @(self.view.frame.size.width /3 -30),
                                 CAPSPageMenuOptionSelectedMenuItemLabelColor : [UIColor colorWithRed:255.0/255.0 green:136.0/255.0 blue:146.0/255.0 alpha:1],
                                 CAPSPageMenuOptionUnselectedMenuItemLabelColor : [UIColor colorWithRed:33.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1],
                                 CAPSPageMenuOptionCenterMenuItems: @(YES),
                                 CAPSPageMenuOptionHideTopMenuImg : @(YES)
                                 };
    
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
    [self.view addSubview:_pageMenu.view];
}

- (void)pushViewController :(long)indexRow {
    /*
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController popViewControllerAnimated:YES];*/
   
    DiamondMainController * diamondMainController = [[DiamondMainController alloc] init];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController pushViewController: diamondMainController animated:YES];
    
}
@end
