//
//  MemberPostController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MemberPostController.h"

@interface MemberPostController ()

@end

@implementation MemberPostController

- (void)viewDidLoad {
    [super viewDidLoad];
    _memberPostView = [[MemberPostView alloc] init];
    _memberPostView.delegate = self;
    _memberPostView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_memberPostView.view];
}


@end
