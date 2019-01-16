//
//  LogView.h
//  IME
//
//  Created by apple on 2018/12/22.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, stateType)
{
    stateUnpaid      = 0,  // 未付款
    statePaid        = 1,  // 已付款
    statePayFail     = 2,  // 付款失敗
    stateCancel      = 3,  // 訂單取消
};

@class LogView;

@protocol LogViewDelegate
-(void)presentController :(NSInteger) indexRow;
@end
@interface LogView : UIView
@property (nonatomic, weak) id<LogViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView       *view;
@property (weak, nonatomic) IBOutlet UITableView    *tableView;
@property (weak, nonatomic) IBOutlet UIButton       *selectBtn;
@property (weak, nonatomic) IBOutlet UIStackView    *noDataAlert;
@property (nonatomic, strong) NSMutableArray        *dataArr;
@property                     BOOL                   isQuery;
@end
