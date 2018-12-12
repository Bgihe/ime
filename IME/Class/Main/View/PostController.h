//
//  PostController.h
//  IME
//
//  Created by MAC on 2018/12/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostView.h"
NS_ASSUME_NONNULL_BEGIN

@interface PostController : UIViewController<PostViewDelegate>{
    PostView * _postView;
}
 
@end

NS_ASSUME_NONNULL_END
