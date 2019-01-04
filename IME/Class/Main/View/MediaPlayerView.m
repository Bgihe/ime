//
//  MediaPlayerView.m
//  IME
//
//  Created by apple on 2018/12/28.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MediaPlayerView.h"
#import "AppDelegate.h"

@implementation MediaPlayerView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        ((AppDelegate *) [[UIApplication sharedApplication] delegate]).fullScreen = YES;
    }
    return self;
}
#pragma mark -- YWMediaPlayerViewDelegate

/// 点击关闭按钮
- (void)playerViewClosed:(YWMediaPlayerView *)player {
    
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight]
                                forKey:@"orientation"];
}

/// 全屏/非全屏切换
- (void)playerView:(YWMediaPlayerView *)player fullscreen:(BOOL)fullscreen {
    
    if (fullscreen == YES) {
        
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight]
                                    forKey:@"orientation"];
    } else {
        
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInt:UIInterfaceOrientationPortrait]
                                    forKey:@"orientation"];
    }
}

/// 播放失败
- (void)playerViewFailePlay:(YWMediaPlayerView *)player {
    NSLog(@"播放失败");
}

/// 准备播放
- (BOOL)playerViewWillBeginPlay:(YWMediaPlayerView *)player {
    NSLog(@"准备播放");
    return YES;
}


#pragma mark -- 加载 & 移除
- (void)showPlayerViewWithUrl:(NSString *)urlString Title:(NSString *)title {
    [self removePlayViewSubViews];
    // 开启全屏模式
    ((AppDelegate *) [[UIApplication sharedApplication] delegate]).fullScreen = YES;
    [self.mediaPlayerView playerViewWithUrl:urlString WithTitle:title WithView:self.playerView WithDelegate:self];
}

- (void)removePlayerView {
    [self removePlayViewSubViews];
    // 关闭全屏模式
    ((AppDelegate *) [[UIApplication sharedApplication] delegate]).fullScreen = YES;
}

- (void)autoPlay {
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 自动播放
        [weakSelf.mediaPlayerView.mediaControl playControl];
    });
}


#pragma mark -- private
// 移除播放器视图上面的所有子控件
- (void)removePlayViewSubViews {
    for(int i = 0; i < self.playerView.subviews.count; i++){
        [[self.playerView.subviews objectAtIndex:i] removeFromSuperview];
    }
}



#pragma mark -- getter
- (UIView *)playerView {
    if (!_playerView) {
        _playerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YWSCREEN_WIDTH, YWMinPlayerHeight)];
        _playerView.backgroundColor = [UIColor lightGrayColor];
    }
    return _playerView;
}

- (YWMediaPlayerView *)mediaPlayerView {
    if (!_mediaPlayerView) {
        _mediaPlayerView = [[YWMediaPlayerView alloc] init];
        if (_isLiveVideo) {
            _mediaPlayerView.mediaControl.totalDurationLabel.hidden = YES;
            _mediaPlayerView.mediaControl.mediaProgressSlider.hidden = YES;
            _mediaPlayerView.mediaControl.currentTimeLabel.hidden = YES;
        }else{
            
        }
        _mediaPlayerView.mediaControl.playButton.hidden = YES;
        _mediaPlayerView.mediaControl.fullScreenBtn.hidden = YES;
        
        CGFloat topPadding = 0.0;
        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIApplication.sharedApplication.keyWindow;
            topPadding = window.safeAreaInsets.top;
            /*
            CGFloat bottomPadding = window.safeAreaInsets.bottom;
            CGSize screenSize = [[UIScreen mainScreen] bounds].size;
            
            CGFloat screenHeight = screenSize.height;
            NSLog(@"%f:%f:%f",topPadding,bottomPadding,screenHeight);
            */
            
        } else {
            
        }
        
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth - 20 - 20, topPadding + 17.5, 20, 20)];
        [_backBtn setImage:[UIImage imageNamed:@"message_close"] forState:UIControlStateNormal];
        [_mediaPlayerView.mediaControl addSubview:_backBtn];
        [_backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];

        _headBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, topPadding + 10 , 35, 35)];
        [_headBtn setImage:[UIImage imageNamed:@"login"] forState:UIControlStateNormal];
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_headBtn.contentMode=UIViewContentModeScaleAspectFill;
            self->_headBtn.layer.cornerRadius = CGRectGetHeight(self->_headBtn.frame)/2;
            self->_headBtn.clipsToBounds = YES;
            self->_headBtn.layer.borderWidth = 1;
            self->_headBtn.layer.borderColor = [UIColor whiteColor].CGColor;
            self->_headBtn.contentMode=UIViewContentModeScaleAspectFill;
            self->_headBtn.layer.masksToBounds = YES;
        });
        [_mediaPlayerView.mediaControl addSubview:_headBtn];
        
        UILabel * dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(_headBtn.frame.origin.x + _headBtn.frame.size.width + 10, topPadding + 10, KScreenWidth * 0.4 , 35)];
        dateLabel.text = @"2019-01-02";
        dateLabel.font = [UIFont systemFontOfSize:12];
        dateLabel.textColor = [UIColor whiteColor];
        [_mediaPlayerView.mediaControl addSubview:dateLabel];
        
    }
    return _mediaPlayerView;
}
- (IBAction)clickBackBtn:(UIButton*)sender {
    NSLog(@"Back success");
    [_delegate popViewController];
}
@end
