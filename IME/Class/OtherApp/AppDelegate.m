//
//  AppDelegate.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "MassMessageController.h"
#import "MessageListController.h"
#import "CameraController.h"
#import "SearchAnchorController.h"
#import "MemberController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initService];
    return YES;
}
-(void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
    controller.title = title;
    
    controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //未选中字体颜色
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:KBlackColor,NSFontAttributeName:SYSTEMFONT(10.0f)} forState:UIControlStateNormal];
    //选中字体颜色
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:CNavBgColor,NSFontAttributeName:SYSTEMFONT(10.0f)} forState:UIControlStateSelected];
    [controller.tabBarItem setTitle:@""];
    
    UIEdgeInsets imageInset = UIEdgeInsetsMake(7, 0, -7, 0);
    controller.tabBarItem.imageInsets = imageInset;
    
    
    //包装导航控制器
    rootNavigationController = [[UINavigationController alloc]initWithRootViewController:controller];
    [rootNavigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    [rootNavigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [rootNavigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [rootNavigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:124.0f/255.0f green:209.0f/255.0f blue:204.0f/255.0f alpha:1]] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [rootNavigationController.navigationBar setShadowImage:[UIImage new]];//去掉阴影线
    
    [controllerList addObject:rootNavigationController];
}
#pragma mark ————— 初始化服务 —————
-(void)initService{
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginStateChange:)
                                                 name:KNotificationLoginStateChange
                                               object:nil];
}


#pragma mark ————— 登录状态处理 —————
- (void)loginStateChange:(NSNotification *)notification
{
    BOOL loginSuccess = [notification.object boolValue];
    
    if (loginSuccess) {//登陆成功加载主窗口控制器
        NSLog(@"Test Success");
        
        controllerList = [[NSMutableArray alloc] init];
    
        MassMessageController * massMessageController= [[MassMessageController alloc] init];
        [self setupChildViewController:massMessageController title:@"訊息" imageName:@"navi_talk" seleceImageName:@"navi_talk"];
        
        MessageListController * messageListController= [[MessageListController alloc] init];
        [self setupChildViewController:messageListController title:@"群發" imageName:@"navi_status" seleceImageName:@"navi_status"];
        
        //----相機
        CameraController * cameraController= [[CameraController alloc] init];
        [self setupChildViewController:cameraController title:@"相機" imageName:@"navi_camera" seleceImageName:@"navi_camera"];
        
        
        SearchAnchorController * searchAnchorController= [[SearchAnchorController alloc] init];
        [self setupChildViewController:searchAnchorController title:@"收尋" imageName:@"navi_search" seleceImageName:@"navi_search"];
        
        MemberController * memberController= [[MemberController alloc] init];
        [self setupChildViewController:memberController title:@"個人" imageName:@"navi_person" seleceImageName:@"navi_person"];
        
        //初始化UITabBarController
        self->tabBarController = [[UITabBarController alloc] init];
        //为viewControllers添加引用
        self->tabBarController.viewControllers = controllerList;
        self.window.rootViewController = self->tabBarController;
    }else{
        NSLog(@"Test Fail");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
