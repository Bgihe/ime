//
//  SettingView.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SettingView.h"

@implementation SettingView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_headImg.backgroundColor = [UIColor whiteColor];
            self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
            self->_headImg.layer.cornerRadius = CGRectGetHeight(self->_headImg.frame)/2;
            self->_headImg.clipsToBounds = YES;
            self->_headImg.backgroundColor = [UIColor whiteColor];
            self->_headImg.layer.borderWidth = 3;
            self->_headImg.layer.borderColor = [UIColor whiteColor].CGColor;
            self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
        });
        _editBtn.layer.cornerRadius = CGRectGetHeight(_editBtn.frame)/2;
        
        _followBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _fanBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [_followBtn.titleLabel setTextAlignment:UITextAlignmentCenter];
        [_fanBtn.titleLabel setTextAlignment:UITextAlignmentCenter];
        [_followBtn setTitle:@"追蹤 \n 1" forState:UIControlStateNormal];
        [_fanBtn setTitle:@"粉絲 \n 1" forState:UIControlStateNormal];
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"SettingView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}


@end
