//
//  MemberEdit.m
//  IME
//
//  Created by apple on 2019/1/9.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MemberEdit.h"

@implementation MemberEdit
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
    [[NSBundle mainBundle] loadNibNamed:@"LogView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
@end
