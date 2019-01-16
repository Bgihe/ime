//
//  SearchController.m
//  IME
//
//  Created by MAC on 2019/1/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "SearchController.h"

@interface SearchController ()

@end

@implementation SearchController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _searchView = [[SearchView alloc] init];
    _searchView.delegate = self;
    _searchView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_searchView.view];
    
}


@end
