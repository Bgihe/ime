//
//  MessageListView.h
//  IME
//
//  Created by apple on 2018/12/27.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MassMessageCell.h"
@class MessageListView;

@protocol MessageListViewDelegate<MassMessageCellDelegate>
- (void) pushMessageController;
- (void) pushSpotLightController;
@end
@interface MessageListView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;

@property (nonatomic, weak) id<MessageListViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@end

