//
//  MediaPlayerController.m
//  IME
//
//  Created by apple on 2019/1/2.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MediaPlayerController.h"

@interface MediaPlayerController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *images;
@end

@implementation MediaPlayerController
- (void)viewDidLoad {
    [super viewDidLoad];

    /* 多部影片 scrollview success
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate        = self;
    self.scrollView.pagingEnabled   = YES;
    self.scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.scrollView];
    
    CGFloat scrollW = self.scrollView.frame.size.width;
    CGFloat scrollH = self.scrollView.frame.size.height;
    
    for (NSInteger i = 0; i < 5; i++) {
        _mediaPlayerView = [[MediaPlayerView alloc] init];
        _mediaPlayerView.frame = CGRectMake(i * scrollW, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.self.scrollView addSubview:_mediaPlayerView];
        
        
        _mediaPlayerView.backgroundColor = [UIColor whiteColor];
        _mediaPlayerView.isLiveVideo = YES;
        _mediaPlayerView.playerView.frame = CGRectMake(i * scrollW, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        
        
        [self.self.scrollView addSubview:_mediaPlayerView.playerView];
        
        NSString *testUrl = @"http://183.207.249.7/PLTV/2/224/3221226047/index.m3u8";
        [_mediaPlayerView showPlayerViewWithUrl:testUrl Title:@"视频的标题"];
        // 自动播放
        [_mediaPlayerView autoPlay];
        
 
    }
    [self.scrollView setContentSize:CGSizeMake(self.images.count * scrollW, 0)];
    */

    _mediaPlayerView = [[MediaPlayerView alloc] init];
    _mediaPlayerView.delegate = self;
    _mediaPlayerView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [_mediaPlayerView.playerView addSubview:_mediaPlayerView];

    _mediaPlayerView.backgroundColor = [UIColor whiteColor];
    _mediaPlayerView.isLiveVideo = YES;
    _mediaPlayerView.playerView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_mediaPlayerView.playerView];
    

    //[_mediaPlayerView.backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSString *testUrl = @"http://183.207.249.7/PLTV/2/224/3221226047/index.m3u8";
    [_mediaPlayerView showPlayerViewWithUrl:testUrl Title:@"视频的标题"];
    // 自动播放
    [_mediaPlayerView autoPlay];
 
}

-(void)popViewController{
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
