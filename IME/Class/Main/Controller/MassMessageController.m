//
//  MassMessageController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MassMessageController.h"
#import "PostListController.h"
@interface MassMessageController ()

@end

@implementation MassMessageController
//改狀態bar 顏色
- (void) setStatuBar :(UIColor *)color {
    UIView * statusBarView =[[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"]  valueForKey:@"statusBar"];
    if ([statusBarView respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBarView.backgroundColor = color;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _massMessageView = [[MassMessageView alloc] init];
    _massMessageView.delegate = self;
    _massMessageView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_massMessageView.view];
  
    NSLog(@"MassMessageController viewDidLoad");
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden=NO;
}


-(void)pushPostListController{
    PostListController * postListController = [[PostListController alloc] init];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: postListController animated:YES];
}
@end
