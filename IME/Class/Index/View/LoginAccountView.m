//
//  LoginAccountView.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LoginAccountView.h"

@implementation LoginAccountView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"LoginAccountView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}




@end
