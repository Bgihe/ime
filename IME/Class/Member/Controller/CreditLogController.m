//
//  CreditLogController.m
//  IME
//
//  Created by apple on 2019/1/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "CreditLogController.h"
#import "LoginModel.h"
#import "NetHttpsModel.h"

@interface CreditLogController ()

@end

@implementation CreditLogController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight * 0.05)];
    _bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_bgView];
    
    _postBtn = [[UIButton alloc] initWithFrame:CGRectMake(_bgView.frame.size.width/3*0, 0, _bgView.frame.size.width/3, _bgView.frame.size.height)];
    [_postBtn setTitle:@"貼文" forState:UIControlStateNormal];
    [_postBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:136.0/255.0 blue:146.0/255.0 alpha:1] forState:UIControlStateNormal];
    [_bgView addSubview:_postBtn];
    
    _msgBtn = [[UIButton alloc] initWithFrame:CGRectMake(_bgView.frame.size.width/3*1, 0, _bgView.frame.size.width/3, _bgView.frame.size.height)];
    [_msgBtn setTitle:@"訊息" forState:UIControlStateNormal];
    [_msgBtn setTitleColor:[UIColor colorWithRed:33.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1] forState:UIControlStateNormal];
    [_bgView addSubview:_msgBtn];
    
    _otherBtn = [[UIButton alloc] initWithFrame:CGRectMake(_bgView.frame.size.width/3*2, 0, _bgView.frame.size.width/3, _bgView.frame.size.height)];
    [_otherBtn setTitle:@"其他" forState:UIControlStateNormal];
    [_otherBtn setTitleColor:[UIColor colorWithRed:33.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1] forState:UIControlStateNormal];
    [_bgView addSubview:_otherBtn];
    
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(_bgView.frame.size.width/3*1 - _bgView.frame.size.width/3/2 - 10 , _bgView.frame.size.height - 5, 20, 2)];
    _bottomLine.backgroundColor = [UIColor colorWithRed:133.0/255.0 green:216.0/255.0 blue:215.0/255.0 alpha:1];
    [_bgView addSubview:_bottomLine];

    [_postBtn addTarget:self action:@selector(clickTopBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_msgBtn addTarget:self action:@selector(clickTopBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_otherBtn addTarget:self action:@selector(clickTopBtn:) forControlEvents:UIControlEventTouchUpInside];
 
    _logView = [[LogView alloc] init];
    _logView.delegate = self;
    _logView.view.frame = CGRectMake(0, _bgView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-_bgView.frame.size.height);
    [self.view addSubview:_logView.view];
    [_logView.selectBtn addTarget:self action:@selector(clickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
    //----
    /*
    _selectStr = [[NSString alloc] init];
    _selectStr = @"D";
    _actionStr = [[NSString alloc] init];
    _actionStr = @"4";
    
    [self reloadCreditsLog];
     */
}
-(void)refreshRect :(int)hight{
    //_bgView.frame = CGRectMake(0, 0, KScreenWidth, hight);
    _logView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-hight);
}
-(void) viewWillAppear:(BOOL)animated{
    [self reloadCreditsLog];
    //_bgView.hidden = YES;
}
- (IBAction)clickSelectBtn:(UIButton*)sender {
    
     UIAlertController* deleteAlert = [UIAlertController alertControllerWithTitle:nil
     message:nil
     preferredStyle:UIAlertControllerStyleActionSheet];
     
     UIAlertAction* todayAction = [UIAlertAction actionWithTitle:@"今日" style:UIAlertActionStyleDestructive
     handler:^(UIAlertAction * action) {
         self->_selectStr = @"D";
         [self->_logView.selectBtn setTitle:@"今日 ▼" forState:UIControlStateNormal];
         [self reloadCreditsLog];
     }];
     [todayAction setValue:[UIColor colorWithRed:33.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1] forKey:@"titleTextColor"];
     UIAlertAction* weekAction = [UIAlertAction actionWithTitle:@"過去7日" style:UIAlertActionStyleDestructive
     handler:^(UIAlertAction * action) {
         self->_selectStr = @"7";
         [self->_logView.selectBtn setTitle:@"過去7日 ▼" forState:UIControlStateNormal];
         [self reloadCreditsLog];
     }];
     [weekAction setValue:[UIColor colorWithRed:33.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1] forKey:@"titleTextColor"];
     UIAlertAction* monthAction = [UIAlertAction actionWithTitle:@"本月" style:UIAlertActionStyleDestructive
     handler:^(UIAlertAction * action) {
         self->_selectStr = @"M";
         [self->_logView.selectBtn setTitle:@"本月 ▼" forState:UIControlStateNormal];
         [self reloadCreditsLog];
     }];
     [monthAction setValue:[UIColor colorWithRed:33.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1] forKey:@"titleTextColor"];
     UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
     handler:^(UIAlertAction * action) {
     
     }];
     [cancelAction setValue:[UIColor colorWithRed:255.0/255.0 green:136.0/255.0 blue:146.0/255.0 alpha:1] forKey:@"titleTextColor"];
     [deleteAlert addAction:todayAction];
     [deleteAlert addAction:weekAction];
     [deleteAlert addAction:monthAction];
     [deleteAlert addAction:cancelAction];
     [self presentViewController:deleteAlert animated:YES completion:nil];
}
- (IBAction)clickTopBtn:(UIButton*)sender {
    _actionStr = [[NSString alloc] init];
    [self resetBtnColor];
    if ([sender.titleLabel.text isEqualToString:@"貼文"]) {
        _actionStr = @"4";
        [_postBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:136.0/255.0 blue:146.0/255.0 alpha:1] forState:UIControlStateNormal];
        _bottomLine.frame = CGRectMake(_bgView.frame.size.width/3*1 - _bgView.frame.size.width/3/2 - 10 , _bgView.frame.size.height - 5, 20, 2);
    }else if([sender.titleLabel.text isEqualToString:@"訊息"]){
        _actionStr = @"2";
        [_msgBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:136.0/255.0 blue:146.0/255.0 alpha:1] forState:UIControlStateNormal];
        _bottomLine.frame = CGRectMake(_bgView.frame.size.width/3*2 - _bgView.frame.size.width/3/2 - 10 , _bgView.frame.size.height - 5, 20, 2);
    }else if([sender.titleLabel.text isEqualToString:@"其他"]){
        _actionStr = @"8";
        [_otherBtn setTitleColor:[UIColor colorWithRed:255.0/255.0 green:136.0/255.0 blue:146.0/255.0 alpha:1] forState:UIControlStateNormal];
        _bottomLine.frame = CGRectMake(_bgView.frame.size.width/3*3 - _bgView.frame.size.width/3/2 - 10 , _bgView.frame.size.height - 5, 20, 2);
    }
    [self reloadCreditsLog];
}
- (void) resetBtnColor{
    [_postBtn setTitleColor:[UIColor colorWithRed:33.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1] forState:UIControlStateNormal];
    [_msgBtn setTitleColor:[UIColor colorWithRed:33.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1] forState:UIControlStateNormal];
    [_otherBtn setTitleColor:[UIColor colorWithRed:33.0/255.0 green:186.0/255.0 blue:186.0/255.0 alpha:1] forState:UIControlStateNormal];
}
- (void) reloadCreditsLog{
    LoginModel * loginModel = [LoginModel instance];
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    paramDict[@"token"] = loginModel.token;
    paramDict[@"action"] = _actionStr;
    paramDict[@"date"] = _selectStr;
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    [netHttpsModel POSTWithUrl:URL_get_credits_log paramDict:paramDict];
}
#pragma mark - http api
- (void)httpResult: (NSDictionary*) responseObject :(NSString *) url {
    if ([url isEqualToString:URL_get_credits_log]) {
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            NSLog(@"%@",responseObject);
            NSLog(@"%@",[[responseObject objectForKey:@"data"]objectForKey:@"data"]);
            
            if ([[[responseObject objectForKey:@"data"]objectForKey:@"data"] count] <= 0) {
                _logView.noDataAlert.hidden = NO;
            }else{
                _logView.noDataAlert.hidden = YES;
            }
            
            _logView.dataArr = [[responseObject objectForKey:@"data"]objectForKey:@"data"];
            [_logView.tableView reloadData];
       }        
    }
}
@end
