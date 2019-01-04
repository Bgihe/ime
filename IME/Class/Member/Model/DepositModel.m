//
//  DepositModel.m
//  IME
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DepositModel.h"

@implementation DepositModel
+ (DepositModel *) instance
{
    // Persistent instance.
    static DepositModel *_default = nil;
    if (_default == nil)
    {
        _default = [[DepositModel alloc] init];
        _default.diamondList = [NSArray arrayWithObjects:@"3,150",@"9,750",@"19,500",@"39,000",@"68,400",@"117,000",@"243,000",@"435,000", nil];
        _default.bonusAList = [NSArray arrayWithObjects:@"+150 ",@"+750 ",@"+1500",@"+3000 ",@"+14400 ",@"+7000 ",@"+63000 ",@"+135000 ", nil];
        _default.bonusBList = [NSArray arrayWithObjects:@"5%",@"8%",@"8%",@"8%",@"26%",@"30%",@"35%",@"45%", nil];
        _default.amountList = [NSArray arrayWithObjects:@"500",@"1,500",@"3,000",@"6,000",@"9,000",@"15,000",@"30,000",@"50,000", nil];
        
        _default.ATMList = [NSArray arrayWithObjects:@"玉山銀行(建議)",@"中國信託",@"台北富邦",@"第一銀行",@"國泰世華", nil];
        _default.CVSList = [NSArray arrayWithObjects:@"OK超商",@"全家超商",@"萊爾富超商",@"7-11 ibon", nil];
    }
    return _default;
}
@end

