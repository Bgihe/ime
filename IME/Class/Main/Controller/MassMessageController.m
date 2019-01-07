//
//  MassMessageController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MassMessageController.h"
#import "PostListController.h"
#import "DepositController.h"
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
-(IBAction)clickDaimondBtn:(id)sender{
    DepositController * depositController = [[DepositController alloc] init];
    self.navigationController.navigationBarHidden=NO;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: depositController animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];


    UIImage *faceImage = [UIImage imageNamed:@"icon_daimond"];
    UIButton *daimondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [daimondBtn setTitle:@" 0" forState:UIControlStateNormal];
    daimondBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [daimondBtn addTarget:self action:@selector(clickDaimondBtn:) forControlEvents:UIControlEventTouchUpInside];
    [daimondBtn setImage:faceImage forState:UIControlStateNormal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:daimondBtn];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem.width = 20;


    
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
