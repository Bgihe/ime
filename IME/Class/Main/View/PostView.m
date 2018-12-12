//
//  PostView.m
//  IME
//
//  Created by MAC on 2018/12/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PostView.h"
#define     VIEW_WIDTH      [UIScreen mainScreen].bounds.size.width
#define     VIEW_HEIGHT     [UIScreen mainScreen].bounds.size.height
@implementation PostView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        
        UIVisualEffectView *lightView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        lightView.frame = CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT);
        [_lockView addSubview:lightView];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_headImg.imageView setContentMode:UIViewContentModeScaleAspectFill];
            self->_headImg.backgroundColor = [UIColor whiteColor];
            self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
            self->_headImg.layer.cornerRadius = CGRectGetHeight(self->_headImg.frame)/2;
            self->_headImg.clipsToBounds = YES;
            self->_headImg.backgroundColor = [UIColor whiteColor];
            self->_headImg.layer.borderWidth = 1;
            self->_headImg.layer.borderColor = [UIColor whiteColor].CGColor;
            self->_headImg.layer.masksToBounds = YES;

            self->_unlockView.contentMode=UIViewContentModeScaleAspectFill;
            self->_unlockView.layer.cornerRadius = CGRectGetHeight(self->_unlockView.frame)/2;
            self->_unlockView.clipsToBounds = YES;
            self->_unlockView.layer.borderWidth = 1;
            self->_unlockView.layer.borderColor = [UIColor whiteColor].CGColor;
            self->_unlockView.layer.masksToBounds = YES;
            self->_textView.layer.cornerRadius = CGRectGetHeight(self->_textView.frame)/2;
            self->_textView.clipsToBounds = YES;
        });
       
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"PostView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
-(void) unlockPost{
    _unlockView.hidden = YES;
    _lockView.hidden = YES;
    _textView.hidden = YES;
}

@end
