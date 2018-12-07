//
//  MemberBuyController.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberBuyView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MemberBuyController : UIViewController<MemberBuyViewDelegate>{
    MemberBuyView * _memberBuyView;
}

@end

NS_ASSUME_NONNULL_END
