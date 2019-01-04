//
//  RankCell.h
//  IME
//
//  Created by apple on 2018/12/20.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RankCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *rankBtn;
@property (weak, nonatomic) IBOutlet UIButton *headBtn;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *diamondLabel;
@property (weak, nonatomic) IBOutlet UILabel *lockLabel;
@property (weak, nonatomic) IBOutlet UIButton *msgBtn;

@end
