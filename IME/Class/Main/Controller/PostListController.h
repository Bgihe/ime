//
//  PostListController.h
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainController.h"
#import "PostListView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostListController : UIViewController<PostListViewDelegate>{
    PostListView * _postListView;
}

@end

NS_ASSUME_NONNULL_END
