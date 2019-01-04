//
//  PostController.h
//  IME
//
//  Created by MAC on 2018/12/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainController.h"
#import "PostView.h"
#import "SpotLightController.h"
NS_ASSUME_NONNULL_BEGIN
@class PostController;

@protocol PostControllerDelegate

@end
@interface PostController : MainController<PostViewDelegate>{
    PostView * _postView;
}
@property (nonatomic, weak) id<PostControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
