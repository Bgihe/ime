//
//  LoginMainView.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LoginMainView.h"
NS_ASSUME_NONNULL_BEGIN
@interface LoginMainView ()

@end
@implementation LoginMainView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        NSLog(@"456");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_phoneView.clipsToBounds = YES;
            self->_phoneView.layer.borderWidth = 1;
            self->_phoneView.layer.borderColor = [UIColor whiteColor].CGColor;
            self->_phoneView.layer.masksToBounds = YES;
            self->_phoneView.layer.cornerRadius = CGRectGetHeight(self->_phoneView.frame)/2;
            
            self->_memberView.clipsToBounds = YES;
            self->_memberView.layer.borderWidth = 1;
            self->_memberView.layer.borderColor = [UIColor whiteColor].CGColor;
            self->_memberView.layer.masksToBounds = YES;
            self->_memberView.layer.cornerRadius = CGRectGetHeight(self->_phoneView.frame)/2;

        });
        
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"LoginMainView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
    
}

@end

NS_ASSUME_NONNULL_END
