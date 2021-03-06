//
//  PostController.m
//  IME
//
//  Created by MAC on 2018/12/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PostController.h"

@interface PostController ()

@end

@implementation PostController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _postView = [[PostView alloc] init];
    _postView.delegate = self;
    _postView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_postView.view];
    
    [_postView.backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_postView.unlockBtn addTarget:self action:@selector(clickUnlockBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_postView.headBtn addTarget:self action:@selector(clickHeadBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (IBAction)clickBackBtn:(id)sender {
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)clickUnlockBtn:(id)sender {
    [_postView unlockPost];
}
- (IBAction)clickHeadBtn:(id)sender {
    SpotLightController * spotLightController = [[SpotLightController alloc] init];
    self.navigationController.navigationBarHidden=YES;
     self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: spotLightController animated:YES];
}


@end
