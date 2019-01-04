//
//  MessageView.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MassMessageCell.h"
#import "MessageCell.h"
NS_ASSUME_NONNULL_BEGIN
@class MessageView;

@protocol MessageViewDelegate
-(void) pushMediaPlayerView;
@end
@interface MessageView : UIView<MassMessageCellDelegate,MessageCellDelegate>{
    float cellHight;
}
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (nonatomic, strong) NSMutableArray   *cellHightArr;
@property (nonatomic, strong) NSMutableArray *testImgArr;
@property (nonatomic, strong) NSMutableArray *testStatusArr;
@property (nonatomic, strong) NSMutableArray *testMeArr;


@property (weak, nonatomic) IBOutlet UIView *sendView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (weak, nonatomic) IBOutlet UIButton *takePhotoBtn;
@property (weak, nonatomic) IBOutlet UITextView *msgTextView;
@property (nonatomic, weak) id<MessageViewDelegate> delegate;

- (void) reloadSendViewUI :(float) keyboardHeight;
@end

NS_ASSUME_NONNULL_END
