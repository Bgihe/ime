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
#import "LoginMainController.h"


#import "AFNetworking.h"
#import "ConfigModel.h"
#import "LoginModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:[URL_main stringByAppendingString:URL_config] parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DLog(@"URL_config Success");
        if ([[[responseObject objectForKey:@"success"] stringValue]isEqualToString:@"1"]) {
            NSLog(@"%@",responseObject);
            //---- member
            ConfigModel * configModel = [ConfigModel instance];
            NSDictionary *loginDict = [responseObject objectForKey:@"data"];
            for(NSString *key in [loginDict allKeys]) {
                NSString *value = [loginDict objectForKey:key];
                if([value isKindOfClass:[NSNumber class]]){
                    value = [NSString stringWithFormat:@"%@",value];
                    DLog(@"Value:%@",value);
                }else if([value isKindOfClass:[NSNull class]])
                    value = @"";
                @try {
                    [configModel setValue:value forKey:key];
                }
                @catch (NSException *exception) {
                    DLog(@"试图添加不存在的key:%@到实例:%@中.",key,NSStringFromClass([self class]));
                }
            }
 
        }else{
            DLog(@"URL_config Fail");
        }
 
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DLog(@"Http Fail!!");
    }];
    
    
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

        controllerList = [[NSMutableArray alloc] init];
    
        MassMessageController * massMessageController= [[MassMessageController alloc] init];
        [self setupChildViewController:massMessageController title:@"訊息" imageName:@"navi_talk" seleceImageName:@"navi_talk"];
        MessageListController * messageListController= [[MessageListController alloc] init];
        [self setupChildViewController:messageListController title:@"群發" imageName:@"navi_status" seleceImageName:@"navi_status"];
        
        LoginModel * loginModel = [LoginModel instance];
        if (loginModel.role == 2) {
            CameraController * cameraController= [[CameraController alloc] init];
            [self setupChildViewController:cameraController title:@"相機" imageName:@"navi_camera" seleceImageName:@"navi_camera"];
        }
        
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
        
        /*
        UIViewController * viewController = [[UIViewController alloc] init];
        UIViewController *previousRootViewController = self.window.rootViewController;
        
        self.window.rootViewController = viewController;
        
        // Nasty hack to fix https://stackoverflow.com/questions/26763020/leaking-views-when-changing-rootviewcontroller-inside-transitionwithview
        // The presenting view controllers view doesn't get removed from the window as its currently transistioning and presenting a view controller
        for (UIView *subview in self.window.subviews) {
            if ([subview isKindOfClass:NSClassFromString(@"UITransitionView")]) {
                [subview removeFromSuperview];
            }
        }
        // Allow the view controller to be deallocated
        [previousRootViewController dismissViewControllerAnimated:NO completion:^{
            // Remove the root view in case its still showing
            [previousRootViewController.view removeFromSuperview];
        }];*/
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
