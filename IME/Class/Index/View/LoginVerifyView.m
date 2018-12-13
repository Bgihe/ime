//
//  LoginVerifyView.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LoginVerifyView.h"

@implementation LoginVerifyView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_verify1Label.layer.cornerRadius = 5;
            self->_verify2Label.layer.cornerRadius = 5;
            self->_verify3Label.layer.cornerRadius = 5;
            self->_verify4Label.layer.cornerRadius = 5;
            self->_verify5Label.layer.cornerRadius = 5;
            self->_verify6Label.layer.cornerRadius = 5;
            
            self->_nextBtn.layer.cornerRadius = 5;
        });
        
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"LoginVerifyView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
@end
