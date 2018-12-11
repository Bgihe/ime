//
//  SettingController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SettingController.h"
#import "CAPSPageMenu.h"


@interface SettingController ()
@property (nonatomic) CAPSPageMenu *pageMenu;
@end

@implementation SettingController
- (void) addPageView{

    MemberMenuController * memberMenuController = [[MemberMenuController alloc] init];
    memberMenuController.title =@"選單";
    MemberPostController * memberPostController = [[MemberPostController alloc] init];
    memberPostController.title =@"貼文";
    MemberBuyController * memberBuyController = [[MemberBuyController alloc] init];
    memberBuyController.title =@"已購";
    MemberFavoriteController * memberFavoriteController = [[MemberFavoriteController alloc] init];
    memberFavoriteController.title =@"最愛";

    NSArray *controllerArray = @[memberMenuController, memberPostController, memberBuyController, memberFavoriteController];
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor whiteColor],//標題底色
                                 CAPSPageMenuOptionViewBackgroundColor: [UIColor whiteColor],
                                 CAPSPageMenuOptionSelectionIndicatorColor: [UIColor redColor],
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor blackColor],
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue" size:13.0],
                                 CAPSPageMenuOptionMenuHeight: @(40.0),
                                 CAPSPageMenuOptionMenuItemWidth: @(90.0),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES)
                                 };
 
    
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 0.0+ _settingView.view.frame.size.height*0.4, self.view.frame.size.width, _settingView.view.frame.size.height*0.6) options:parameters];
    [self.view addSubview:_pageMenu.view];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _settingView = [[SettingView alloc] init];
    _settingView.delegate = self;
    _settingView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_settingView.view];
    
    [self performSelector:@selector(addPageView) withObject:nil afterDelay:0.0];
}

- (void)didTapGoToRight {
    NSInteger currentIndex = self.pageMenu.currentPageIndex;
    
    if (currentIndex < self.pageMenu.controllerArray.count) {
        [self.pageMenu moveToPage:currentIndex + 1];
    }
}
- (IBAction)test1:(id)sender {
    [self.pageMenu moveToPage:0];
    
}
- (IBAction)test2:(id)sender {
    [self.pageMenu moveToPage:2];
}


@end
