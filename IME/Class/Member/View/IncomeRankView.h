//
//  IncomeRankView.h
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IncomeRankView;

@protocol IncomeRankViewDelegate

@end
@interface IncomeRankView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, weak) id<IncomeRankViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@end

