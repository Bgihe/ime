//
//  ReplyPriceView.h
//  IME
//
//  Created by apple on 2018/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ReplyPriceView;

@protocol ReplyPriceViewDelegate

@end
@interface ReplyPriceView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UILabel *msgPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *callPriceLabel;

@property (weak, nonatomic) IBOutlet UISlider *msgPriceSlider;
@property (weak, nonatomic) IBOutlet UISlider *callPriceSlider;

@property (weak, nonatomic) IBOutlet UISwitch *callPriceSwitch;


@property (nonatomic, weak) id<ReplyPriceViewDelegate> delegate;

- (void) updateMsgPriceLabel :(float) price;
- (void) updateCallPriceLabel :(float) price;
@end

