//
//  MassMessageController.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MassMessageView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MassMessageController : UIViewController<MassMessageViewDelegate>{
    MassMessageView * _massMessageView;
}

@end

NS_ASSUME_NONNULL_END
