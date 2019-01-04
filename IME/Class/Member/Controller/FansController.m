//
//  FansController.m
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import "FansController.h"
#import "SpotLightController.h"
@interface FansController ()

@end

@implementation FansController

- (void)viewDidLoad {
    [super viewDidLoad];
   

    DLog(@"數字:%ld",_btnTag)
    _fansView = [[FansView alloc] init];
    _fansView.delegate = self;
    _fansView.btnTag = _btnTag;
    _fansView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_fansView.view];
}

- (void) pushSpotLightView{
    SpotLightController * spotLightController = [[SpotLightController alloc] init];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: spotLightController animated:NO];
}
@end
