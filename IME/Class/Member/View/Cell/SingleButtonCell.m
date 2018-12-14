//
//  SingleButtonCell.m
//  IME
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SingleButtonCell.h"

@implementation SingleButtonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    dispatch_async(dispatch_get_main_queue(), ^{
        _centerBtn.layer.cornerRadius = CGRectGetHeight(self->_centerBtn.frame)/2;
    });
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
