//
//  MediaPlayerView.h
//  IME
//
//  Created by apple on 2018/12/28.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YWMediaPlayerView.h"

@class MediaPlayerView;

@protocol MediaPlayerViewDelegate
-(void)popViewController;
@end

@interface MediaPlayerView : UIView <YWMediaPlayerViewDelegate>
@property (nonatomic, strong) UIView                    *playerView;      //播放器背景图片
@property (nonatomic, strong) YWMediaPlayerView         *mediaPlayerView; //播放器
@property (nonatomic, assign) BOOL                      isLiveVideo;      // 是否是视频直播
@property (nonatomic, weak) id<MediaPlayerViewDelegate> delegate;

@property (nonatomic, strong) UIButton                    *backBtn;
@property (nonatomic, strong) UIButton                    *headBtn;


// 加载播放器视图
- (void)showPlayerViewWithUrl:(NSString *)urlString Title:(NSString *)title;
// 移除播放器视图
- (void)removePlayerView;
// 自动播放
- (void)autoPlay;

@end
