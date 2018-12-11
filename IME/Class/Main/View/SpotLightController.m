//
//  SpotLightController.m
//  IME
//
//  Created by MAC on 2018/12/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SpotLightController.h"

@interface SpotLightController ()

@end

@implementation SpotLightController

- (void)viewDidLoad {
    [super viewDidLoad];
    _spotLightView = [[SpotLightView alloc] init];
    _spotLightView.delegate = self;
    _spotLightView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_spotLightView.view];
}


@end
