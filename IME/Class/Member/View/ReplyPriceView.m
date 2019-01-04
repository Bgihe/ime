//
//  ReplyPriceView.m
//  IME
//
//  Created by apple on 2018/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "ReplyPriceView.h"

@implementation ReplyPriceView

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
    [[NSBundle mainBundle] loadNibNamed:@"ReplyPriceView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}

- (void) updateMsgPriceLabel :(float) price{
    _msgPriceLabel.text = [[NSString alloc] initWithFormat:@"%f",price];
}
- (void) updateCallPriceLabel :(float) price{
    _callPriceLabel.text = [[NSString alloc] initWithFormat:@"%f",price];
}

@end
