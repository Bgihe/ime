//
//  MemberMenuController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MemberMenuController.h"
#import "SettingController.h"

@interface MemberMenuController ()

@end

@implementation MemberMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    _memberMenuView = [[MemberMenuView alloc] init];
    _memberMenuView.delegate = self;
    _memberMenuView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_memberMenuView.view];
   
}

- (void)presentController :(long)indexRow {
    
    [_delegate presentController:indexRow];
    
}

@end
