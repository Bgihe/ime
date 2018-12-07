//
//  MemberBuyController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MemberBuyController.h"

@interface MemberBuyController ()

@end

@implementation MemberBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _memberBuyView = [[MemberBuyView alloc] init];
    _memberBuyView.delegate = self;
    _memberBuyView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_memberBuyView.view];
}

@end
