//
//  MainController.h
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
#import "MassMessageController.h"
#import "MessageListController.h"
#import "CameraController.h"
#import "SearchAnchorController.h"
#import "MemberController.h"
#import "IMEBaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainController : IMEBaseViewController<MainViewDelegate,UIPageViewControllerDelegate,UIPageViewControllerDataSource>{
    MainView * _mainView;
    NSArray * _controllerList;
}
@property (nonatomic, strong)UIPageViewController *pageViewController;// 页面试图控制器
@property int pageNumber;// 页面试图控制器
@end

NS_ASSUME_NONNULL_END
