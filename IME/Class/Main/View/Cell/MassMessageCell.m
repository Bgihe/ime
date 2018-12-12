//
//  MassMessageCell.m
//  IME
//
//  Created by MAC on 2018/12/11.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MassMessageCell.h"

@implementation MassMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_headImgBtn.layer.cornerRadius = CGRectGetHeight(self->_headImgBtn.frame)/2;
        self->_headImgBtn.clipsToBounds = YES;
        
        
        //self->_postStatusImg.backgroundColor = [UIColor whiteColor];
        self->_postStatusImg.contentMode=UIViewContentModeScaleAspectFill;
        self->_postStatusImg.layer.cornerRadius = CGRectGetHeight(self->_postStatusImg.frame)/2;
        self->_postStatusImg.clipsToBounds = YES;
        //self->_postStatusImg.backgroundColor = [UIColor whiteColor];
        self->_postStatusImg.layer.borderWidth = 1;
        self->_postStatusImg.layer.borderColor = [UIColor whiteColor].CGColor;
        self->_postStatusImg.contentMode=UIViewContentModeScaleAspectFill;
        self->_postStatusImg.layer.masksToBounds = YES;
    });
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
