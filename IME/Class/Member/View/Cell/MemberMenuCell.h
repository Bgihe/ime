//
//  MemberMenuCell.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MemberMenuCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftIconImg;
@property (weak, nonatomic) IBOutlet UIImageView *rightIconImg;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

//right
@end

NS_ASSUME_NONNULL_END
