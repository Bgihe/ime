//
//  DiamondRankController.m
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DiamondRankController.h"

@interface DiamondRankController ()

@end

@implementation DiamondRankController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewWil");
    [_delegate pushViewController:0];
}
- (void)viewWillDisappear:(BOOL)animated{
    
    NSLog(@"viewDisappear");
}
@end
