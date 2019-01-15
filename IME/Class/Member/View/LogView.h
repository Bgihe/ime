//
//  LogView.h
//  IME
//
//  Created by apple on 2018/12/22.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LogView;

@protocol LogViewDelegate
 
@end
@interface LogView : UIView
@property (nonatomic, weak) id<LogViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView       *view;
@property (weak, nonatomic) IBOutlet UITableView    *tableView;
@property (weak, nonatomic) IBOutlet UIButton       *selectBtn;
@property (weak, nonatomic) IBOutlet UIStackView    *noDataAlert;
@property (nonatomic, strong) NSMutableArray        *dataArr;
@end
