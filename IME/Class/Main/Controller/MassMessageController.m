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
    NSLog(@"MassMessageController");
}

-(void)addChild{
    PostListController * postListController = [[PostListController alloc] init];
    [_delegate addChild:postListController inRect:[UIScreen mainScreen].bounds];
}
@end
