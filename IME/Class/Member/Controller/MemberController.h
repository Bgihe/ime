//
//  MemberController.h
//  IME
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberView.h"
#import "MemberMenuController.h"
#import "MemberPostController.h"
#import "MemberBuyController.h"
#import "MemberFavoriteController.h"

#import "IMEBaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface MemberController : IMEBaseViewController <MemberViewDelegate,MemberMenuControllerDelegate>{
    MemberView * _memberView;
}

@end

NS_ASSUME_NONNULL_END
