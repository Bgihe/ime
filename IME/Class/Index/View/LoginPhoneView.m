//
//  LoginPhoneView.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LoginPhoneView.h"

@implementation LoginPhoneView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_phoneView.layer.cornerRadius = CGRectGetHeight(self->_phoneView.frame)/2;
            self->_phoneView.clipsToBounds = YES;
            self->_phoneView.layer.masksToBounds = YES;
        });
        _nextBtn.layer.cornerRadius = 5;

    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"LoginPhoneView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
@end
