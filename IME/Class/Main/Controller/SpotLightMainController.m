//
//  SpotLightMainController.m
//  IME
//
//  Created by apple on 2018/12/11.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SpotLightMainController.h"
#import "SpotLightController.h"
@interface SpotLightMainController ()<SpotLightControllerDelegate>
@property (nonatomic) CAPSPageMenu *pageMenu;
@end

@implementation SpotLightMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addPageView];
   
}
- (IBAction)clickBackBtn:(id)sender {
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)removeController{
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) addPageView{
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < [_dataArr count]; i++) {
        SpotLightController * memberMenuController = [[SpotLightController alloc] init];
        memberMenuController.delegate = self;
        memberMenuController.nameStr = [_dataArr objectAtIndex:i];
        memberMenuController.isPageView = true;
        [arr addObject:memberMenuController];
    }
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor whiteColor],//標題底色
                                 CAPSPageMenuOptionViewBackgroundColor: [UIColor whiteColor],
                                 CAPSPageMenuOptionSelectionIndicatorColor: [UIColor redColor],
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor blackColor],
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue" size:13.0],
                                 CAPSPageMenuOptionMenuHeight: @(0),
                                 CAPSPageMenuOptionMenuItemWidth: @(90.0),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES)
                                 };
    
    
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:arr frame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
    [self.view addSubview:_pageMenu.view];
}

@end
