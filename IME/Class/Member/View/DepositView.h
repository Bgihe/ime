//
//  DepositView.h
//  IME
//
//  Created by apple on 2018/12/20.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DepositView;

@protocol DepositViewDelegate
- (void)clickTableViewCell :(int) indexRow;
@end
@interface DepositView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, weak) id<DepositViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray   *dataArr;

@property (weak, nonatomic) IBOutlet UIButton *ATMBtn;
@property (weak, nonatomic) IBOutlet UIButton *CVSBtn;
@property (weak, nonatomic) IBOutlet UIButton *cardBtn;

@property (weak, nonatomic) IBOutlet UIView *customerServiceView;

- (void)updateBtnColor :(long) tag;

@end
