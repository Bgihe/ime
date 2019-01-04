//
//  MessageListController.h
//  IME
//
//  Created by apple on 2018/12/27.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageListView.h"
@interface MessageListController : UIViewController<MessageListViewDelegate>{
    MessageListView * _messageListView;
}

@end

