//
//  DepositController.m
//  IME
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DepositController.h"
#import "DepositLogController.h"
#import "LoginModel.h"
#import "NetHttpsModel.h"
@interface DepositController ()

@end

@implementation DepositController
-(IBAction)clickDepositLogBtn:(id)sender
{
    DepositLogController * depositLogController = [[DepositLogController alloc] init];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController pushViewController: depositLogController animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"購買鑽石";
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] initWithTitle:@"購買紀錄" style:UIBarButtonItemStylePlain target:self action:@selector(clickDepositLogBtn:)];
    self.navigationItem.rightBarButtonItem = refreshItem;
    
    _depositView = [[DepositView alloc] init];
    _depositView.delegate = self;
    _depositView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_depositView.view];
    [_depositView.ATMBtn addTarget:self action:@selector(clickPaySatus:) forControlEvents:UIControlEventTouchUpInside];
    [_depositView.CVSBtn addTarget:self action:@selector(clickPaySatus:) forControlEvents:UIControlEventTouchUpInside];
    [_depositView.cardBtn addTarget:self action:@selector(clickPaySatus:) forControlEvents:UIControlEventTouchUpInside];
    _depositModel = [DepositModel instance];
   
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    [arr addObject:_depositModel.diamondList];
    [arr addObject:_depositModel.bonusAList];
    [arr addObject:_depositModel.bonusBList];
    [arr addObject:_depositModel.amountList];
    _depositView.dataArr = arr;
    
    LoginModel * loginModel = [LoginModel instance];
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    paramDict[@"token"] = loginModel.token;
    NetHttpsModel * netHttpsModel = [[NetHttpsModel alloc] init];
    netHttpsModel.delegate = self;
    [netHttpsModel POSTWithUrl:URL_get_credits paramDict:paramDict];
    
    paramDict = [NSMutableDictionary dictionary];
    paramDict[@"token"] = loginModel.token;
    paramDict[@"currency"] = @"TWD";
    [netHttpsModel POSTWithUrl:URL_deposit_get_all_plan paramDict:paramDict];
    
    
    
    
}
- (IBAction)clickPaySatus:(UIButton*)sender {
    [_depositView updateBtnColor:sender.tag ];
    _depositModel.payStatus = sender.tag;
}
- (void)clickTableViewCell :(int) indexRow{
    _depositModel.amountRow = indexRow;
    DepositDetailController * depositDetailController = [[DepositDetailController alloc] init];
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController pushViewController: depositDetailController animated:YES];
}
#pragma mark - http api
- (void)httpResult: (NSDictionary*) responseObject :(NSString *) url {
    if ([url isEqualToString:URL_get_credits]) {
        if ([[responseObject objectForKey:@"success"] boolValue]) {
            _depositView.creditsLabel.text = [NSNumberFormatter localizedStringFromNumber:@([[[responseObject objectForKey:@"data"]objectForKey:@"credits"] intValue])
                                                                              numberStyle:NSNumberFormatterDecimalStyle];
        }
    }else if([url isEqualToString:URL_deposit_get_all_plan]){
        NSLog(@"%@",responseObject);
    }
 
}
@end
