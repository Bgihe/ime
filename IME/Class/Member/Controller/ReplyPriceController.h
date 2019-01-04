//
//  ReplyPriceController.h
//  IME
//
//  Created by apple on 2018/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReplyPriceView.h"

@interface ReplyPriceController : UIViewController<ReplyPriceViewDelegate>{
    ReplyPriceView * _replyPriceView;
}

@end
