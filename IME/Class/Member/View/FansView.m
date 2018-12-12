//
//  FansView.m
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import "FansView.h"

@implementation FansView

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
    [[NSBundle mainBundle] loadNibNamed:@"FansView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
    
}

@end
