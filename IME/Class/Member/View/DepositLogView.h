//
//  DepositLogView.h
//  IME
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DepositLogView;

@protocol DepositLogViewDelegate
- (void)clickTableViewCell:(int)indexRow;
@end
@interface DepositLogView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, weak) id<DepositLogViewDelegate> delegate;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
