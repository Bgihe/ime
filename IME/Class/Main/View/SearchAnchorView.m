//
//  SearchAnchorView.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SearchAnchorView.h"

@implementation SearchAnchorView

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
    [[NSBundle mainBundle] loadNibNamed:@"SearchAnchorView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}

@end
