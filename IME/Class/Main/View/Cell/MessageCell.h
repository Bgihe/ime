//
//  MessageCell.h
//  IME
//
//  Created by apple on 2018/12/27.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MessageCell;

@protocol MessageCellDelegate
-(void) reloadCellHight : (float) hight;
@end

@interface MessageCell : UITableViewCell

@property (nonatomic) IBOutlet UILabel *msgLabel;
@property (nonatomic) IBOutlet UIView *msgView;
@property (nonatomic) IBOutlet UIButton *headBtn;
@property (nonatomic) IBOutlet UITextView *msgTextView;
@property (nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic) IBOutlet UIImageView *photoImg;
@property (nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *cellView;



@property (weak, nonatomic) IBOutlet UIView *photoView;
@property (nonatomic, weak) id<MessageCellDelegate> delegate;
@property (nonatomic, copy ) void (^changeCellHeight)();

-(float)updateMsgUI:(BOOL)isMe :(int)postStatus :(NSString*) str ;
@end

NS_ASSUME_NONNULL_END
