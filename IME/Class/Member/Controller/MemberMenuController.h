//
//  MemberMenuController.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberMenuView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MemberMenuController : UIViewController<MemberMenuViewDelegate>{
    MemberMenuView * _memberMenuView;
}

@end

NS_ASSUME_NONNULL_END
