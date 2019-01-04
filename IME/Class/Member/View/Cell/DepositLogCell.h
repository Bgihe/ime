//
//  DepositLogCell.h
//  IME
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DepositLogCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *payMentLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *daimondAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end
