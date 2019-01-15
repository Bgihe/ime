//
//  DepositDetailController.m
//  IME
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DepositDetailController.h"

@interface DepositDetailController ()

@end

@implementation DepositDetailController

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"%@",_creditsData);
    NSLog(@"%@",_creditsName);
    NSLog(@"%@",_subpaymentsList);
    
    _depositDetailView.dataArr = _subpaymentsList;
    [_depositDetailView.tableView reloadData];
    
    [_depositDetailView refreshRect];
    [_depositDetailView refreshCreditData:_creditsData :_creditsName];
  
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"儲值付款";
    //_depositModel = [DepositModel instance];
    _depositDetailView = [[DepositDetailView alloc] init];
    _depositDetailView.delegate = self;
    _depositDetailView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_depositDetailView.view];
    
    [_depositDetailView.confirmBtn addTarget:self action:@selector(clickConfirmBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    /*
    _depositDetailView.payStatus = _depositModel.amountRow ;

    _depositDetailView.diamond = [_depositModel.diamondList objectAtIndex:(int)_depositModel.amountRow];
    _depositDetailView.amount = [_depositModel.amountList objectAtIndex:(int)_depositModel.amountRow];
    */
    
    //[_depositDetailView reloadAmountLabel];
    
    
    /*
    if (_isConfirm) {
        [_depositDetailView showPaymentInfo];
        _depositDetailView.isConfirm = YES;
        
        NSMutableArray * titleArr =[[NSMutableArray alloc] init];
        NSMutableArray * infoArr =[[NSMutableArray alloc] init];
        NSMutableArray * arr =[[NSMutableArray alloc] init];
        
        if(_depositModel.payStatus == 401){
            [titleArr addObject:@"繳費銀行代碼"];
            [titleArr addObject:@"繳費虛擬帳號"];
            [titleArr addObject:@"繳費期限"];
            [titleArr addObject:@"繳費金額"];
            
            [infoArr addObject:@"808"];
            [infoArr addObject:@"20410062582007"];
            [infoArr addObject:@"2018-12-28 10:04:07"];
            [infoArr addObject:@"$500"];
            
            [arr addObject: titleArr];
            [arr addObject: infoArr];
            _depositDetailView.dataArr = arr;
            [_depositDetailView.tableView reloadData];
        }else if(_depositModel.payStatus == 402){
            
        }else{
            [titleArr addObject:@"繳費代碼"];
            [titleArr addObject:@"繳費期限"];
            [titleArr addObject:@"繳費金額"];
            
            [infoArr addObject:@"LLL86484563456545"];
            [infoArr addObject:@"2018-12-28 10:04:07"];
            [infoArr addObject:@"$500"];
            
            [arr addObject: titleArr];
            [arr addObject: infoArr];
            _depositDetailView.dataArr = arr;
            [_depositDetailView.tableView reloadData];
        }
    }*/
}
 
- (IBAction)clickConfirmBtn:(UIButton*)sender {
    NSLog(@"購買事件");
    [_depositDetailView showPaymentInfo];
    _depositDetailView.isConfirm = YES;
    
    NSMutableArray * titleArr =[[NSMutableArray alloc] init];
    NSMutableArray * infoArr =[[NSMutableArray alloc] init];
    NSMutableArray * arr =[[NSMutableArray alloc] init];
    
    if(_depositModel.payStatus == 401){
        [titleArr addObject:@"繳費銀行代碼"];
        [titleArr addObject:@"繳費虛擬帳號"];
        [titleArr addObject:@"繳費期限"];
        [titleArr addObject:@"繳費金額"];
        
        [infoArr addObject:@"808"];
        [infoArr addObject:@"20410062582007"];
        [infoArr addObject:@"2018-12-28 10:04:07"];
        [infoArr addObject:@"$500"];
        
        [arr addObject: titleArr];
        [arr addObject: infoArr];
        _depositDetailView.dataArr = arr;
        [_depositDetailView.tableView reloadData];
    }else if(_depositModel.payStatus == 402){
 
    }else{
        [titleArr addObject:@"繳費代碼"];
        [titleArr addObject:@"繳費期限"];
        [titleArr addObject:@"繳費金額"];
        
        [infoArr addObject:@"LLL86484563456545"];
        [infoArr addObject:@"2018-12-28 10:04:07"];
        [infoArr addObject:@"$500"];
        
        [arr addObject: titleArr];
        [arr addObject: infoArr];
        _depositDetailView.dataArr = arr;
        [_depositDetailView.tableView reloadData];
    }
    
    
}
@end
