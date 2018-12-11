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
#import "MessageController.h"
#import "SearchAnchorController.h"
#import "SettingController.h"


NS_ASSUME_NONNULL_BEGIN

@interface MainController : UIViewController<MainViewDelegate,UIPageViewControllerDelegate,UIPageViewControllerDataSource>{
    MainView * _mainView;
    NSArray * _controllerList;
}
@property (nonatomic, strong)UIPageViewController *pageViewController;// 页面试图控制器
@property int pageNumber;// 页面试图控制器
@end

NS_ASSUME_NONNULL_END
