//
//  MassMessageView.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MassMessageView;

@protocol MassMessageViewDelegate

@end

@interface MassMessageView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, weak) id<MassMessageViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
