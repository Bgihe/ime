//
//  SpotLightView.h
//  IME
//
//  Created by MAC on 2018/12/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
 
@class SpotLightView;

@protocol SpotLightViewDelegate

@end
@interface SpotLightView : UIView<UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (nonatomic) IBOutlet UIButton *moreMsgBtn;

@property (weak, nonatomic) IBOutlet UIImageView *headBgImg;
@property (nonatomic) IBOutlet UIButton *headImg;
@property (nonatomic) IBOutlet UILabel *idLabel;
@property (nonatomic) IBOutlet UIButton *chatBtn;
@property (nonatomic) IBOutlet UIButton *postBtn;
@property (weak, nonatomic) IBOutlet UIView *statusView; //紅人, 新星, 精選..
@property (nonatomic) IBOutlet UITextView *msgTextView;
@property (weak, nonatomic) IBOutlet UIStackView *msgStackView;

@property (nonatomic) IBOutlet  UIView *bottomBgView;

// 滑动手势
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRec;

@property (weak, nonatomic) IBOutlet UILabel *topBgMask;
@property (nonatomic) IBOutlet UILabel *bottomBgMask;


@property (nonatomic, weak) id<SpotLightViewDelegate> delegate;
- (void)updateIdLabel :(NSString *) name;
- (void) refreshMsgRect;
@end

