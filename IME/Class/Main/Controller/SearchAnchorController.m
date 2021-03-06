//
//  SearchAnchorController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SearchAnchorController.h"
#import "SpotLightController.h"
#import "SpotLightMainController.h"
#import "SearchController.h"
@interface SearchAnchorController ()

@end

@implementation SearchAnchorController
-(IBAction)clickSearchBtn:(id)sender
{
    NSLog(@"123");
    SearchController * searchController = [[SearchController alloc] init];
    self.navigationController.navigationBarHidden=YES;
    [self.navigationController pushViewController: searchController animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *faceImage = [UIImage imageNamed:@"navi_search3"];
    UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
    face.bounds = CGRectMake( 0, 0, 20, 20 );
    [face setImage:faceImage forState:UIControlStateNormal];
    face.clipsToBounds = true;
    face.contentMode = UIViewContentModeScaleAspectFit;
    [face addTarget:self action:@selector(clickSearchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *faceBtn = [[UIBarButtonItem alloc] initWithCustomView:face];
    self.navigationItem.rightBarButtonItem = faceBtn;

    _searchAnchorView = [[SearchAnchorView alloc] init];
    _searchAnchorView.delegate = self;
    _searchAnchorView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_searchAnchorView.view];
    
    
    NSMutableArray * arrA = [[NSMutableArray alloc] init];
    [arrA addObject:@"主播A1"];
    [arrA addObject:@"主播A2"];
    [arrA addObject:@"主播A3"];
    [arrA addObject:@"主播A4"];
    [arrA addObject:@"主播A5"];
    [arrA addObject:@"主播A6"];
    
    NSMutableArray * arrB = [[NSMutableArray alloc] init];
    [arrB addObject:@"主播B1"];
    [arrB addObject:@"主播B2"];
    [arrB addObject:@"主播B3"];
    [arrB addObject:@"主播B4"];
    NSMutableArray * arrC = [[NSMutableArray alloc] init];
    [arrC addObject:@"主播C1"];
    [arrC addObject:@"主播C2"];
    [arrC addObject:@"主播C3"];
    [arrC addObject:@"主播C4"];
    [arrC addObject:@"主播C5"];
    NSMutableArray * arrD = [[NSMutableArray alloc] init];
    [arrD addObject:@"主播D1"];
    [arrD addObject:@"主播D2"];
    
    NSMutableArray * arrE = [[NSMutableArray alloc] init];
    [arrE addObject:@"主播E1"];
    [arrE addObject:@"主播E2"];
    [arrE addObject:@"主播E3"];
    [arrE addObject:@"主播E4"];
    [arrE addObject:@"主播E5"];
    
    NSMutableArray * arrF = [[NSMutableArray alloc] init];
    [arrF addObject:@"主播F1"];
    [arrF addObject:@"主播F2"];
    [arrF addObject:@"主播F3"];
    [arrF addObject:@"主播F4"];
    [arrF addObject:@"主播F5"];
    [arrF addObject:@"主播F6"];

    _dataArr = [[NSMutableArray alloc] init];
    [_dataArr addObject:arrA];
    [_dataArr addObject:arrB];
    [_dataArr addObject:arrC];
    [_dataArr addObject:arrD];
    [_dataArr addObject:arrE];
    [_dataArr addObject:arrF];
    _searchAnchorView.dataArr =_dataArr;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"SearchAnchorController");
}
-(void) presentSpotLight :(NSMutableArray*) spotLightList :(int) row{
    
    SpotLightMainController * spotLightMainController = [[SpotLightMainController alloc] init];
    spotLightMainController.dataArr = spotLightList;
    spotLightMainController.pageRow = row;
    
    self.navigationController.navigationBarHidden=YES;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: spotLightMainController animated:YES];
}
 
@end
