//
//  MainView.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MainView.h"

@implementation MainView
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
    [[NSBundle mainBundle] loadNibNamed:@"MainView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}


@end
