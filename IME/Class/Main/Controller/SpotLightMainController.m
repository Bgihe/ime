//
//  SpotLightMainController.m
//  IME
//
//  Created by apple on 2018/12/11.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SpotLightMainController.h"
#import "SpotLightController.h"
@interface SpotLightMainController ()
@property (nonatomic) CAPSPageMenu *pageMenu;
@end

@implementation SpotLightMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addPageView];
   
}
- (void) addPageView{

    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < [_dataArr count]; i++) {
        NSLog(@"%d",i);
        NSLog(@"%@",[_dataArr objectAtIndex:i]);
        SpotLightController * memberMenuController = [[SpotLightController alloc] init];
        memberMenuController.nameStr = [_dataArr objectAtIndex:i];
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
