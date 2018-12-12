//
//  MemberPostCell.h
//  IME
//
//  Created by MAC on 2018/12/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MemberPostCell;

@protocol MemberPostCellDelegate

@end

@interface MemberPostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *lightImg;
@property (weak, nonatomic) IBOutlet UIImageView *lockImg;
@property (weak, nonatomic) IBOutlet UILabel *lockLabel;
@property (weak, nonatomic) IBOutlet UILabel *daimondLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) id<MemberPostCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
