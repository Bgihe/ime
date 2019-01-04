//
//  DepositDetailView.h
//  IME
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DepositDetailView;

@protocol DepositDetailViewDelegate

@end
@interface DepositDetailView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *subView;
@property (nonatomic, weak) id<DepositDetailViewDelegate> delegate;
@property (nonatomic, strong) NSArray   *dataArr;

@property (weak, nonatomic) IBOutlet UILabel *daimondTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *daimondBottomLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *payStatusLabel;

@property (nonatomic, strong) NSString   *diamond;
@property (nonatomic, strong) NSString   *amount;
@property (nonatomic, assign) NSInteger payStatus;
@property (nonatomic, assign) BOOL isConfirm;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UIView *confirmView;
@property (weak, nonatomic) IBOutlet UIStackView *saveAmountView;
- (void)reloadAmountLabel;
- (void)showPaymentInfo;
@end
