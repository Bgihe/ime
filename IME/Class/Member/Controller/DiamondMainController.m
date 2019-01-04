//
//  DiamondMainController.m
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DiamondMainController.h"
#import "CAPSPageMenu.h"

#import "DiamondListController.h"
#import "SpotLightController.h"
@interface DiamondMainController ()<DiamondListControllerDelegate>
@property (nonatomic) CAPSPageMenu *pageMenu;
@end

@implementation DiamondMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"贈鑽排行";
    [self performSelector:@selector(addPageView) withObject:nil afterDelay:0.0];
}
 
- (void) addPageView{
    DiamondListController * diamondPostController = [[DiamondListController alloc] init];
    diamondPostController.title = @"貼文";
    diamondPostController.delegate = self;
    DiamondListController * diamondMsgController = [[DiamondListController alloc] init];
    diamondMsgController.title = @"訊息";
    diamondPostController.delegate = self;
    DiamondListController * diamondCallController = [[DiamondListController alloc] init];
    diamondCallController.title = @"通話";
    diamondPostController.delegate = self;
    NSArray *controllerArray = @[diamondPostController ,diamondMsgController,diamondCallController];
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor:[UIColor colorWithRed:221.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1],//標題底色
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
    
    //_titleImage
    [self.view addSubview:_pageMenu.view];
}

-(void)pushSpotLightController{
    SpotLightController * spotLightController = [[SpotLightController alloc] init];
    self.navigationController.navigationBarHidden=YES;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: spotLightController animated:YES];
}
@end
