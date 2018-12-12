//
//  FansView.h
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FansView;

@protocol FansViewDelegate

@end

@interface FansView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;

@property (nonatomic, weak) id<FansViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
