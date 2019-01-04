//
//  IncomeRankController.m
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import "IncomeRankController.h"

@interface IncomeRankController ()

@end

@implementation IncomeRankController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _incomeRankView = [[IncomeRankView alloc] init];
    _incomeRankView.delegate = self;
    _incomeRankView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_incomeRankView.view];
}
- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"viewDisappear");
}
@end
