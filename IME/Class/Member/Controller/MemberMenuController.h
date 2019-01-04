//
//  MemberMenuController.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberMenuView.h"

@class MemberMenuController;

@protocol MemberMenuControllerDelegate<MemberMenuViewDelegate>
//-(void)addController;
- (void)presentController :(long)indexRow;
@end
@interface MemberMenuController : UIViewController<MemberMenuViewDelegate>{
    MemberMenuView * _memberMenuView;
}
@property (nonatomic, weak) id<MemberMenuControllerDelegate> delegate;
@end


