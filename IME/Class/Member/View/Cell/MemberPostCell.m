//
//  MemberPostCell.m
//  IME
//
//  Created by MAC on 2018/12/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MemberPostCell.h"

@implementation MemberPostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    dispatch_async(dispatch_get_main_queue(), ^{
  
        //self->_postStatusImg.backgroundColor = [UIColor whiteColor];
        self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
        self->_headImg.layer.cornerRadius = CGRectGetHeight(self->_headImg.frame)/2;
        self->_headImg.clipsToBounds = YES;
        //self->_postStatusImg.backgroundColor = [UIColor whiteColor];
        self->_headImg.layer.borderWidth = 2;
        self->_headImg.layer.borderColor = [UIColor whiteColor].CGColor;
        self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
        self->_headImg.layer.masksToBounds = YES;
    });
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
