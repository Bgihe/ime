//
//  MassMessageView.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MassMessageCell.h"
NS_ASSUME_NONNULL_BEGIN
@class MassMessageView;

@protocol MassMessageViewDelegate
-(void)addChild;
@end

@interface MassMessageView : UIView<MassMessageCellDelegate>
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIStackView *nothingStack;
@property (nonatomic, weak) id<MassMessageViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
