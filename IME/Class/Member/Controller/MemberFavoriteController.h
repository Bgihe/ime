//
//  MemberFavoriteController.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberFavoriteView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MemberFavoriteController : UIViewController<MemberFavoriteViewDelegate>{
    MemberFavoriteView * _memberFavoriteView;
}

@end

NS_ASSUME_NONNULL_END
