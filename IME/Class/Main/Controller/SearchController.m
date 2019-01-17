//
//  SearchController.m
//  IME
//
//  Created by MAC on 2019/1/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "SearchController.h"
#import "NetHttpsModel.h"
#import "LoginModel.h"

@interface SearchController ()

@end

@implementation SearchController

-(void) viewWillAppear:(BOOL)animated{
    LoginModel * loginModel = [LoginModel instance];
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    paramDict[@"token"] = loginModel.token;
    
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    [netHttpsModel POSTWithUrl:URL_get_trace_data paramDict:paramDict];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    _searchView = [[SearchView alloc] init];
    _searchView.delegate = self;
    _searchView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_searchView.view];
}
#pragma mark - http api
- (void)httpResult: (NSDictionary*) responseObject :(NSString *) url {
    if ([url isEqualToString:URL_explore_search_anchor]) {
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            _searchView.searchLogArr =  [[responseObject objectForKey:@"data"] objectForKey:@"data"];
            [_searchView.resultTableView reloadData];
        }
    }else if([url isEqualToString:URL_get_trace_data]){
        
        _traceArr = [[[responseObject objectForKey:@"data"] objectForKey:@"data"] valueForKey:@"no"];
        
        
        LoginModel * loginModel = [LoginModel instance];
        NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
        paramDict[@"token"] = loginModel.token;
        paramDict[@"keyword"] = @"y";
        
        NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
        netHttpsModel.delegate = self;
        [netHttpsModel POSTWithUrl:URL_explore_search_anchor paramDict:paramDict];
    }
}


-(BOOL) traceCheck : (long)accountNo{
    BOOL isTrace = false;
    for (int i = 0; i < _traceArr.count; i++) {
        if ([_traceArr objectAtIndex:i] == accountNo) {
            isTrace = true;
        }
    }
    return isTrace;
}
@end
