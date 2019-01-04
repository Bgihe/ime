//
//  DepositLogController.m
//  IME
//
//  Created by apple on 2018/12/22.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DepositLogController.h"
#import "DepositDetailController.h"
@interface DepositLogController ()

@end

@implementation DepositLogController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"購買紀錄";
 
    _depositLogView = [[DepositLogView alloc] init];
    _depositLogView.delegate = self;
    _depositLogView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_depositLogView.view];
    
    
    NSMutableArray * dateList = [[NSMutableArray alloc] init];
    [dateList addObject:@"2018-12-20 \n 11:11:11"];
    [dateList addObject:@"2018-12-21 \n 12:11:11"];
    [dateList addObject:@"2018-12-22 \n 13:11:11"];
    [dateList addObject:@"2018-12-23 \n 14:11:11"];
    [dateList addObject:@"2018-12-25 \n 15:11:11"];

    NSMutableArray * payStatusList = [[NSMutableArray alloc] init];
    [payStatusList addObject:@"付款方式 : 自動櫃員機"];
    [payStatusList addObject:@"付款方式 : 超商代碼繳款"];
    [payStatusList addObject:@"付款方式 : 信用卡"];
    [payStatusList addObject:@"付款方式 : 自動櫃員機"];
    [payStatusList addObject:@"付款方式 : 自動櫃員機"];
    
    NSMutableArray * amountList = [[NSMutableArray alloc] init];
    [amountList addObject:@"儲值金額 : 500 TWD"];
    [amountList addObject:@"儲值金額 : 6000 TWD"];
    [amountList addObject:@"儲值金額 : 9000 TWD"];
    [amountList addObject:@"儲值金額 : 500 TWD"];
    [amountList addObject:@"儲值金額 : 500 TWD"];
    
    NSMutableArray * diamondList = [[NSMutableArray alloc] init];
    [diamondList addObject:@"3150"];
    [diamondList addObject:@"39000"];
    [diamondList addObject:@"68400"];
    [diamondList addObject:@"3150"];
    [diamondList addObject:@"3150"];
    
    NSMutableArray * paymentList =[[NSMutableArray alloc] init];
    [paymentList addObject:@"未付款"];
    [paymentList addObject:@"未付款"];
    [paymentList addObject:@"未付款"];
    [paymentList addObject:@"已付款"];
    [paymentList addObject:@"已付款"];
    
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    [arr addObject:dateList];
    [arr addObject:payStatusList];
    [arr addObject:amountList];
    [arr addObject:diamondList];
    [arr addObject:paymentList];
    
    _depositLogView.dataArr = arr;
    [_depositLogView.tableView reloadData];
    
}
- (void)clickTableViewCell:(int)indexRow{
    DepositDetailController * depositDetailController = [[DepositDetailController alloc] init];
    depositDetailController.isConfirm = YES;
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController pushViewController: depositDetailController animated:YES];
}



@end
