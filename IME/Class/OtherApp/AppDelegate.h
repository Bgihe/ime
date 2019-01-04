//
//  AppDelegate.h
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UITabBarController * tabController;
    UIViewController * firstViewController;
    UIViewController * secondViewController;
    UINavigationController * firstNavController;
    UINavigationController * secNavController;
    UINavigationController * thirNavController;
    
    UINavigationController * rootNavigationController;
    NSMutableArray * controllerList;
    
    
    UITabBarController * tabBarController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) BOOL fullScreen;

@end

