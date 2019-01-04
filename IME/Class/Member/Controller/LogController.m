//
//  LogController.m
//  IME
//
//  Created by apple on 2018/12/22.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LogController.h"

@interface LogController ()

@end

@implementation LogController

- (void)viewDidLoad {
    [super viewDidLoad];
    _logView = [[LogView alloc] init];
    _logView.delegate = self;
    _logView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_logView.view];
}



@end
