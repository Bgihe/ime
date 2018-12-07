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
