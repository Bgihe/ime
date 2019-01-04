//
//  MediaPlayerController.h
//  IME
//
//  Created by apple on 2019/1/2.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaPlayerView.h"

@interface MediaPlayerController : UIViewController<UIScrollViewDelegate,MediaPlayerViewDelegate>{
    MediaPlayerView * _mediaPlayerView;
}
@property (nonatomic, strong) UIButton                    *backBtn;
@property (nonatomic, strong) UIButton                    *headBtn;
@end
