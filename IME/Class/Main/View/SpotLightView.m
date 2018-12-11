//
//  SpotLightView.m
//  IME
//
//  Created by MAC on 2018/12/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SpotLightView.h"

@implementation SpotLightView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
 
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_headImg.imageView setContentMode:UIViewContentModeScaleAspectFill];
            self->_headImg.backgroundColor = [UIColor whiteColor];
            self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
            self->_headImg.layer.cornerRadius = CGRectGetHeight(self->_headImg.frame)/2;
            self->_headImg.clipsToBounds = YES;
            self->_headImg.backgroundColor = [UIColor whiteColor];
            self->_headImg.layer.borderWidth = 1;
            self->_headImg.layer.borderColor = [UIColor whiteColor].CGColor;
            self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
            self->_headImg.layer.masksToBounds = YES;
        });

        
        [_backBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [_moreBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [_postBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [_chatBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        //_editBtn.layer.cornerRadius = CGRectGetHeight(_editBtn.frame)/2;
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"SpotLightView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}

@end
