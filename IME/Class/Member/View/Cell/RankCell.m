//
//  RankCell.m
//  IME
//
//  Created by apple on 2018/12/20.
//  Copyright © 2018 apple. All rights reserved.
//

#import "RankCell.h"

@implementation RankCell

- (void)awakeFromNib {
    [super awakeFromNib];
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_headBtn.contentMode=UIViewContentModeScaleAspectFill;
        self->_headBtn.layer.cornerRadius = CGRectGetHeight(self->_headBtn.frame)/2;
        self->_headBtn.clipsToBounds = YES;
        self->_headBtn.layer.borderWidth = 3;
        self->_headBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        self->_headBtn.contentMode=UIViewContentModeScaleAspectFill;
        self->_headBtn.layer.masksToBounds = YES;
    });
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
