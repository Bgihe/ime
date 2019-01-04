//
//  IncomeHeader.m
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import "IncomeHeader.h"

@implementation IncomeHeader
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
    [[NSBundle mainBundle] loadNibNamed:@"IncomeHeader" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}

@end
