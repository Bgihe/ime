//
//  MessageListController.m
//  IME
//
//  Created by apple on 2018/12/27.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MessageListController.h"
#import "MessageController.h"
#import "SpotLightController.h"
@interface MessageListController ()

@end

@implementation MessageListController
- (void) setStatuBar :(UIColor *)color {
    UIView * statusBarView =[[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"]  valueForKey:@"statusBar"];
    if ([statusBarView respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBarView.backgroundColor = color;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
 
    _messageListView = [[MessageListView alloc] init];
    _messageListView.delegate = self;
    _messageListView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_messageListView.view];

}

- (void) pushSpotLightController{
    SpotLightController * spotLightController = [[SpotLightController alloc] init];
    self.navigationController.navigationBarHidden=YES;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: spotLightController animated:YES];
    
}
- (void) pushMessageController{
    MessageController * messageController = [[MessageController alloc] init];
    self.navigationController.navigationBarHidden=NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: messageController animated:YES];
}


@end
