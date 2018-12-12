//
//  PostView.m
//  IME
//
//  Created by MAC on 2018/12/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PostView.h"

@implementation PostView
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
    [[NSBundle mainBundle] loadNibNamed:@"PostView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
 

@end
