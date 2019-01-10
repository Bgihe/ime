//
//  HeadShotCell.m
//  IME
//
//  Created by apple on 2019/1/10.
//  Copyright © 2019 apple. All rights reserved.
//

#import "HeadShotCell.h"

@implementation HeadShotCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _editBtn.userInteractionEnabled = NO;
    _checkBtn.userInteractionEnabled = NO;
    _addBtn.userInteractionEnabled = NO;
    
}

@end
