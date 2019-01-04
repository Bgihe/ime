//
//  DiamondListController.m
//  IME
//
//  Created by apple on 2018/12/20.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DiamondListController.h"

@interface DiamondListController ()

@end

@implementation DiamondListController

- (void)viewDidLoad {
    [super viewDidLoad];
    _diamondListView = [[DiamondListView alloc] init];
    _diamondListView.delegate = self;
    _diamondListView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_diamondListView.view];
    
    NSMutableArray * arr =[[NSMutableArray alloc]init];
    if ([self.title isEqualToString:@"貼文"]) {
        [arr addObject:@""];
        [arr addObject:@""];
    }else if([self.title isEqualToString:@"訊息"]){
        [arr addObject:@""];
        [arr addObject:@""];
        [arr addObject:@""];
    }else{
        [arr addObject:@""];
        [arr addObject:@""];
        [arr addObject:@""];
        [arr addObject:@""];
    }
    _diamondListView.dataArr = arr;
}
- (void) clickListCell :(long) indexPath{
    
}
- (void) clickHeadBtn :(int) userId{
    [_delegate pushSpotLightController];
}
@end
