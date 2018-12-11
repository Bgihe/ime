//
//  MainController.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MainController.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewWillAppear:(BOOL)animated{
    if (_pageNumber) {
        [self gotoPage:_pageNumber];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainView = [[MainView alloc] init];
    _mainView.delegate = self;
    _mainView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_mainView.view];
 
    [_mainView.massMsgBtn addTarget:self action:@selector(clickMassMsgBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_mainView.msgBtn addTarget:self action:@selector(clickMsgBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_mainView.cameraBtn addTarget:self action:@selector(clickCameraBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_mainView.searchBtn addTarget:self action:@selector(clickSearchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_mainView.settingBtn addTarget:self action:@selector(clickSettingBtn:) forControlEvents:UIControlEventTouchUpInside];


    _pageViewController.view.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height*0.08+34, [[UIScreen mainScreen] bounds].size.width,  ([[UIScreen mainScreen] bounds].size.height - [[UIScreen mainScreen] bounds].size.height * 0.13)-34);
    [self pageViewController];
    
    _controllerList = [[NSArray alloc] init];
    _controllerList = @[[[MassMessageController alloc] init], [[MessageController alloc] init],[[SearchAnchorController alloc]init],[[SettingController alloc]init]];
    [self performSelector:@selector(refreshRect) withObject:nil afterDelay:0.05];
    [self gotoPage:1];
}
- (void)refreshRect{
    if (@available(iOS 11.0, *)) {
        //NSLog(@"%@",self.view.safeAreaInsets);
    } else {
        // Fallback on earlier versions
    }
    if (@available(iOS 11.0, *)) {
        self.view.backgroundColor = [UIColor blackColor];
        float safeHeight = self.view.safeAreaLayoutGuide.layoutFrame.size.height;
        float safeY = self.view.safeAreaLayoutGuide.layoutFrame.origin.y;
        
        _pageViewController.view.frame = CGRectMake(0, safeHeight *0.08 + safeY, self.view.safeAreaLayoutGuide.layoutFrame.size.width, safeHeight - safeHeight* 0.13);
    } else {
        
    }
}
#pragma mark - Page View
- (UIPageViewController *)pageViewController{
    if (!_pageViewController) {
        _pageViewController = [[UIPageViewController alloc]
                               initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                               navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                               options:nil];
        _pageViewController.delegate = self;
        _pageViewController.dataSource = self;
        [self.view addSubview:_pageViewController.view];
    }
    return _pageViewController;
}
-(void)gotoPage:(int)index{
 
    UIPageViewControllerNavigationDirection direction;
    direction = UIPageViewControllerNavigationDirectionReverse;
    
    [_pageViewController setViewControllers:@[[_controllerList objectAtIndex:index]]
                                  direction:direction
                                   animated:NO
                                 completion:nil];
}
- (IBAction)clickMassMsgBtn:(id)sender {
    [self gotoPage:0];
}
- (IBAction)clickMsgBtn:(id)sender {
    [self gotoPage:1];
}
- (IBAction)clickCameraBtn:(id)sender {
    [self gotoPage:2];
}
- (IBAction)clickSearchBtn:(id)sender {
    [self gotoPage:3];
}
- (IBAction)clickSettingBtn:(id)sender {
    [self gotoPage:4];
}

@end
