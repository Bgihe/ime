//
//  MessageController.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MessageController : UIViewController<MessageViewDelegate>{
    MessageView * _messageView;
}

@end

NS_ASSUME_NONNULL_END