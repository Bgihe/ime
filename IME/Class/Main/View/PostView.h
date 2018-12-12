//
//  PostView.h
//  IME
//
//  Created by MAC on 2018/12/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class PostView;

@protocol PostViewDelegate

@end
@interface PostView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, weak) id<PostViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
