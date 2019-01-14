//
//  FansController.m
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import "FansController.h"
#import "SpotLightController.h"
#import "NetHttpsModel.h"
#import "LoginModel.h"
#import "ConfigModel.h"
#import <SVProgressHUD.h>
@interface FansController ()<NetHttpsModelDelegate>

@end

@implementation FansController
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    DLog(@"數字:%ld",_btnTag)
    _isLoadTableView = false;
    _fansView = [[FansView alloc] init];
    _fansView.delegate = self;
    _fansView.btnTag = _btnTag;
    _fansView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_fansView.view];
    
    [SVProgressHUD showWithStatus:@"loadding"];
    [self reloadFansData];
}
#pragma mark - void
- (void) reloadFansData{
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    LoginModel * loginModel = [LoginModel instance];
    paramDict[@"token"] = loginModel.token;
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    if (_btnTag == 300) {
        [netHttpsModel POSTWithUrl:URL_get_fans_data paramDict:paramDict];
        self.title = @"我的粉絲";
    }else{
        [netHttpsModel POSTWithUrl:URL_get_trace_data paramDict:paramDict];
        self.title = @"我追蹤者的主播";
    }
}

- (void) addSpotLightView : (NSMutableArray *) userData {
    _fansNo = [userData valueForKey:@"no"];
    _hasTrace = [[userData valueForKey:@"has_trace"] boolValue];
    
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    LoginModel * loginModel = [LoginModel instance];
    paramDict[@"token"] = loginModel.token;
    paramDict[@"keyword"] = [userData valueForKey:@"account"];
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    if (_btnTag == 300) {
        [netHttpsModel POSTWithUrl:URL_get_fans_data paramDict:paramDict];
        self.title = @"我的粉絲";
    }else{
        [netHttpsModel POSTWithUrl:URL_get_trace_data paramDict:paramDict];
        self.title = @"我追蹤者的主播";
    }
}
-(void) reloadSpotLightView : (NSMutableArray *) userData {
    _spotLightView = [[SpotLightView alloc] init];
    _spotLightView.delegate = self;
    _spotLightView.view.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
    [self.navigationController.view addSubview:_spotLightView.view];
    [_spotLightView.backBtn addTarget:self action:@selector(clickSpotLightBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_spotLightView.moreMsgBtn addTarget:self action:@selector(clickSpotLightMoreMsgBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_spotLightView.followBtn addTarget:self action:@selector(clickSpotLightfollowBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_spotLightView.moreBtn addTarget:self action:@selector(clickSpotLightMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_spotLightView.postBtn addTarget:self action:@selector(clickSpotLightPostBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_spotLightView.chatBtn addTarget:self action:@selector(clickSpotLightChatBtn:) forControlEvents:UIControlEventTouchUpInside];

    NSString * msg = [[NSString alloc] init];
    NSString * account = [[NSString alloc] init];
    UIImage * headImg = [[UIImage alloc] init];
    
    if (![[userData valueForKey:@"account"]  isKindOfClass:[NSNull class]]) {
        if ([[userData valueForKey:@"account"] isKindOfClass:[NSNumber class]]) {
            account = [[userData valueForKey:@"account"] stringValue];
        }else{
            account = [userData valueForKey:@"account"];
        }
    }
    if (![[userData valueForKey:@"introduction"]  isKindOfClass:[NSNull class]]) {
        msg = [userData valueForKey:@"introduction"];
    }
    if ([[userData valueForKey:@"gender"] isEqualToString:@"F"]) {
        headImg = [UIImage imageNamed:@"default_avatar2"];
    }else{
        headImg = [UIImage imageNamed:@"default_avatar_m2"];
    }

    if (![[userData valueForKey:@"thumbnail"] isKindOfClass:[NSNull class]]) {
        NSArray *partitionArr = [[NSArray alloc]init];
        partitionArr = [[userData valueForKey:@"thumbnail"] componentsSeparatedByString:@","];
        NSData *decodedImageData = [[NSData alloc]
                                    initWithBase64EncodedString:[partitionArr objectAtIndex:1] options:NSDataBase64DecodingIgnoreUnknownCharacters];
        
        headImg = [UIImage imageWithData:decodedImageData];
    }
    
    ConfigModel * configModel = [ConfigModel instance];
    NSURL *url = [NSURL URLWithString:[[NSString alloc]initWithFormat:@"%@/%@",configModel.member_picture_url,_fansNo]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    [_spotLightView refreshUI:headImg :[[UIImage alloc] initWithData:data]: msg :account :YES];
    [_spotLightView refreshFollowBtn:[[userData valueForKey:@"has_trace"] boolValue]];
    
}
- (void) reloadFansTableView : (NSMutableArray*) fansList{
    _fansView.dataArr = fansList;
    [_fansView.tableView reloadData];
    [SVProgressHUD dismiss];
}
- (void) removeTrace : (NSString*) memberNo{
    NSLog(@"取消追蹤");
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    LoginModel * loginModel = [LoginModel instance];
    paramDict[@"token"] = loginModel.token;
    paramDict[@"no"] = memberNo;
    
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    [netHttpsModel POSTWithUrl:URL_trace_remove paramDict:paramDict];
}
- (void) addTrace : (NSString*) memberNo{
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    LoginModel * loginModel = [LoginModel instance];
    paramDict[@"token"] = loginModel.token;
    paramDict[@"no"] = memberNo;
    
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    [netHttpsModel POSTWithUrl:URL_trace_add paramDict:paramDict];
}
#pragma mark - button
-(void)clickSpotLightfollowBtn:(UIButton*)sender {
    _hasTrace = true;
    [self addTrace:_fansNo];
}
-(void)clickSpotLightMoreMsgBtn:(UIButton*)sender {
    [_spotLightView refreshMsgRect];
}
-(void)clickSpotLightBackBtn:(UIButton*)sender {
    [_spotLightView.view removeFromSuperview];
    _spotLightView = nil;
}
-(void)clickSpotLightMoreBtn:(UIButton*)sender {
    if (!_reportView) {
        _reportView = [[ReportView alloc] init];
        _reportView.delegate = self;
        _reportView.view.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
        [self.navigationController.view addSubview:_reportView.view];
        if (!_hasTrace) {
            //_hasTrace = true;
            _reportView.firstBtn.alpha = 0;
        }else{
            //_hasTrace = false;
            _reportView.firstBtn.alpha = 1;
            [_reportView.firstBtn setTitle:@"取消追蹤" forState:UIControlStateNormal];
            [_reportView.firstBtn addTarget:self action:@selector(clickFirstBtn:) forControlEvents:UIControlEventTouchUpInside];
        }
        [_reportView.secondBtn setTitle:@"檢舉" forState:UIControlStateNormal];
        [_reportView.secondBtn addTarget:self action:@selector(clickSecondBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_reportView.cancelBtn addTarget:self action:@selector(clickCancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)clickSpotLightPostBtn:(id)sender {
    
}
-(void)clickSpotLightChatBtn:(id)sender {
    
}


-(void)clickFirstBtn:(UIButton*)sender {
    _hasTrace = false;
    [self removeTrace:_fansNo];
}
-(void)clickSecondBtn:(id)sender {
    NSLog(@"檢舉");
    [_reportView.view removeFromSuperview];
    _reportView = nil;
    
}
-(void)clickCancelBtn:(id)sender {
    [_reportView.view removeFromSuperview];
    _reportView = nil;
}


#pragma mark - http api
- (void) httpResult: (NSDictionary*) responseObject :(NSString *) url {
    if ([url isEqualToString:URL_get_fans_data]) {
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            if (!_isLoadTableView) {
                [self reloadFansTableView:[[responseObject objectForKey:@"data"]objectForKey:@"data"]];
                _isLoadTableView = true;
            }else{
                NSLog(@"%@",responseObject);
                [self reloadSpotLightView:[[[responseObject objectForKey:@"data"] objectForKey:@"data"] objectAtIndex:0]];
            }
        }
    }else if([url isEqualToString:URL_get_trace_data]){
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            if (!_isLoadTableView) {
                [self reloadFansTableView:[[responseObject objectForKey:@"data"]objectForKey:@"data"]];
                _isLoadTableView = true;
            }else{
                NSLog(@"%@",responseObject);
                [self reloadSpotLightView:[[[responseObject objectForKey:@"data"] objectForKey:@"data"] objectAtIndex:0]];
                
            }
        }
    }else if([url isEqualToString:URL_trace_add]){
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            [_spotLightView refreshFollowBtn:YES];
        }
    }else if([url isEqualToString:URL_trace_remove]){
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            [_spotLightView refreshFollowBtn:NO];
            
            if (_reportView) {
                [_reportView.view removeFromSuperview];
                _reportView = nil;
            }
            
        }
    }
   
}
@end
