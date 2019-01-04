//
//  FansCell.h
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FansCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *headImg;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;
@property (weak, nonatomic) IBOutlet UIButton *msgBtn;

@end

