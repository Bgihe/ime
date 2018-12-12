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

@class MassMessageController;

@protocol MassMessageControllerDelegate
-(void)addChild:(UIViewController *)vc inRect:(CGRect)rect;
@end
@interface MassMessageController : UIViewController<MassMessageViewDelegate>{
    MassMessageView * _massMessageView;
}
@property (nonatomic, weak) id<MassMessageControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
