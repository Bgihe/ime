//
//  SearchLogCell.m
//  IME
//
//  Created by apple on 2019/1/16.
//  Copyright © 2019 apple. All rights reserved.
//

#import "SearchLogCell.h"

@implementation SearchLogCell

- (void)awakeFromNib {
    [super awakeFromNib];
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_headBtn.contentMode=UIViewContentModeScaleAspectFill;
        self->_headBtn.layer.cornerRadius = CGRectGetHeight(self->_headBtn.frame)/2;
        self->_headBtn.clipsToBounds = YES;
        self->_headBtn.layer.borderWidth = 1;
        self->_headBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        self->_headBtn.contentMode=UIViewContentModeScaleAspectFill;
        self->_headBtn.layer.masksToBounds = YES;
    });
}

@end
