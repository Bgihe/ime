//
//  MemberFavoriteController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MemberFavoriteController.h"

@interface MemberFavoriteController ()

@end

@implementation MemberFavoriteController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _memberFavoriteView = [[MemberFavoriteView alloc] init];
    _memberFavoriteView.delegate = self;
    _memberFavoriteView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_memberFavoriteView.view];
}



@end
