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
        
        //_headImg.layer.cornerRadius = CGRectGetHeight(_headImg.frame)/2;
        _headImg.backgroundColor = [UIColor whiteColor];
        _headImg.contentMode=UIViewContentModeScaleAspectFill;
        _headImg.layer.cornerRadius = CGRectGetHeight(_headImg.frame)/2;
        _headImg.clipsToBounds = YES;
        
        _headImg.backgroundColor = [UIColor whiteColor];
        _headImg.layer.borderWidth = 3;
        _headImg.layer.borderColor = [UIColor whiteColor].CGColor;
        _headImg.contentMode=UIViewContentModeScaleAspectFill;
 
        _editBtn.layer.cornerRadius = CGRectGetHeight(_editBtn.frame)/2;
        
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
