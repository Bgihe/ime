//
//  FansCell.m
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import "FansCell.h"

@implementation FansCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //self->_postStatusImg.backgroundColor = [UIColor whiteColor];
        self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
        self->_headImg.layer.cornerRadius = CGRectGetHeight(self->_headImg.frame)/2;
        self->_headImg.clipsToBounds = YES;
        //self->_postStatusImg.backgroundColor = [UIColor whiteColor];
        self->_headImg.layer.borderWidth = 3;
        self->_headImg.layer.borderColor = [UIColor whiteColor].CGColor;
        self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
        self->_headImg.layer.masksToBounds = YES;
        
        
        self->_followBtn.layer.borderWidth = 1;
        self->_followBtn.layer.borderColor = [UIColor blackColor].CGColor;
        self->_followBtn.layer.cornerRadius = 5;
    });
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
