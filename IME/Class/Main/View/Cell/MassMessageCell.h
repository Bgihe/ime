//
//  MassMessageCell.h
//  IME
//
//  Created by MAC on 2018/12/11.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MassMessageCell;

@protocol MassMessageCellDelegate<NSObject>
 
@end
@interface MassMessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *headImgBtn;

@property (weak, nonatomic) IBOutlet UIImageView *postStatusImg;
@property (weak, nonatomic) IBOutlet UIView *postStatusView;

@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UIImageView *countdownImg;
@property (weak, nonatomic) IBOutlet UIImageView *daimondImg;
@property (weak, nonatomic) IBOutlet UIButton *msgBtn;
@property (weak, nonatomic) IBOutlet UIStackView *daimondStack;

@property (nonatomic, weak) id<MassMessageCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
