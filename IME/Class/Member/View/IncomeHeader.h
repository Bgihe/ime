//
//  IncomeHeader.h
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IncomeHeader;

@protocol IncomeHeaderDelegate

@end

@interface IncomeHeader : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *bgImg;
@property (weak, nonatomic) IBOutlet UIButton *todayIncomeBtn;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (nonatomic, weak) id<IncomeHeaderDelegate> delegate;
@end
