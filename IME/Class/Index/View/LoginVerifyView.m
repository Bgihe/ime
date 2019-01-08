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
            self->_verifyTextField.layer.cornerRadius = 5;
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
- (void) refreshPhoneLabel:(NSString *)phone{
    _phoneLabel.text = [[NSString alloc] initWithFormat:@"+886 %@",phone];
}
- (void) refreshMsgLabel :(NSUInteger) msg{
    
    if (DevelopSever) {
        _codeMsgLabel.text = [[NSString alloc] initWithFormat:@"請在 %d 秒以內輸入認證碼",(int)msg];
    }else{
        _codeMsgLabel.text = [[NSString alloc] initWithFormat:@"此為測試環境，請在 %d 秒內隨意輸入數字",(int)msg];
    }
    
    
}
@end
