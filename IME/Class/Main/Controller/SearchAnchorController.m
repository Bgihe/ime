//
//  SearchAnchorController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SearchAnchorController.h"

@interface SearchAnchorController ()

@end

@implementation SearchAnchorController

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchAnchorView = [[SearchAnchorView alloc] init];
    _searchAnchorView.delegate = self;
    _searchAnchorView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_searchAnchorView.view];
    
     NSLog(@"SearchAnchorController viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"SearchAnchorController");
}

@end
