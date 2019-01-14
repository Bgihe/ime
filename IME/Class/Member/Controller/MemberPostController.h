//
//  MemberPostController.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberPostView.h"
@interface MemberPostController : UIViewController<MemberPostViewDelegate>{
    MemberPostView * _memberPostView;
}
@end
