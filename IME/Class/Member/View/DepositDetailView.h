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
@interface DepositDetailView : UIView <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic) IBOutlet UIView *subView;
@property (nonatomic, weak) id<DepositDetailViewDelegate> delegate;
@property (nonatomic, strong) NSArray   *dataArr;

@property (nonatomic) IBOutlet UILabel *daimondTopLabel; //上面右邊
@property (nonatomic) IBOutlet UIImageView *daimondTopImg;
@property (nonatomic) IBOutlet UILabel *amountTopLabel; //上面做邊
@property (nonatomic) IBOutlet UILabel *creditNameLabel;
@property (nonatomic) IBOutlet UILabel *daimondBottomLabel; //下面鑽石
@property (nonatomic) IBOutlet UIImageView *daimondBottomImg;
@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) IBOutlet UILabel *amountBottomLabel; //上面做邊
@property (nonatomic) IBOutlet UIView *confirmView;
@property (nonatomic) IBOutlet UIButton *confirmBtn;
@property (nonatomic) IBOutlet UILabel *payStatusLabel;

@property (nonatomic) IBOutlet UILabel *titleTopLabel;
@property (nonatomic) IBOutlet UIImageView *titleTopImg;
@property (nonatomic) IBOutlet UILabel *titleBottomLabel;
@property (nonatomic) IBOutlet UIImageView *titleBottomImg;

@property (nonatomic) IBOutlet UIImageView *confirmImg;
@property (nonatomic) IBOutlet UILabel *confirmLabel;

@property (nonatomic) IBOutlet UIView *subBgView;


@property (nonatomic, strong) NSString   *diamond;
@property (nonatomic, strong) NSString   *amount;
@property (nonatomic, assign) NSInteger payStatus;
@property (nonatomic, assign) BOOL isConfirm;


@property (weak, nonatomic) IBOutlet UIStackView *saveAmountView;

- (void)reloadAmountLabel;
- (void)showPaymentInfo;
- (void)refreshRect;
- (void)refreshCreditData : (NSMutableArray *)creditData :(NSString*) creditName;
@end
