//
//  SignupView.m
//  IME
//
//  Created by apple on 2019/1/8.
//  Copyright © 2019 apple. All rights reserved.
//

#import "SignupView.h"

@implementation SignupView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_maleBtn.contentMode=UIViewContentModeScaleAspectFill;
            self->_maleBtn.layer.cornerRadius = CGRectGetHeight(self->_maleBtn.frame)/2;
            self->_maleBtn.clipsToBounds = YES;
            self->_maleBtn.layer.masksToBounds = YES;
            
            self->_femaleBtn.contentMode=UIViewContentModeScaleAspectFill;
            self->_femaleBtn.layer.cornerRadius = CGRectGetHeight(self->_femaleBtn.frame)/2;
            self->_femaleBtn.clipsToBounds = YES;
            self->_femaleBtn.layer.masksToBounds = YES;
            
            self->_nameTextField.contentMode=UIViewContentModeScaleAspectFill;
            self->_nameTextField.layer.cornerRadius = CGRectGetHeight(self->_nameTextField.frame)/2;
            self->_nameTextField.clipsToBounds = YES;
            self->_nameTextField.layer.masksToBounds = YES;
            
            self->_nextBtn.contentMode=UIViewContentModeScaleAspectFill;
            self->_nextBtn.layer.cornerRadius = CGRectGetHeight(self->_nameTextField.frame)/2;
            self->_nextBtn.clipsToBounds = YES;
            self->_nextBtn.layer.masksToBounds = YES;
    
        });

        _nameTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
        _nameTextField.leftViewMode = UITextFieldViewModeAlways;
       
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"SignupView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
- (void) refreshSexLabel:(BOOL) isMale{
    if (isMale) {
        _sexLabel.text = [[NSString alloc] initWithFormat:@"我的性別是... 女"];
    }else{
        _sexLabel.text = [[NSString alloc] initWithFormat:@"我的性別是... 男"];
    }
}


@end
