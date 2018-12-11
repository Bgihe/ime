//
//  SpotLightView.h
//  IME
//
//  Created by MAC on 2018/12/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SpotLightView;

@protocol SpotLightViewDelegate

@end
@interface SpotLightView : UIView<UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (weak, nonatomic) IBOutlet UIImageView *headBgImg;
@property (weak, nonatomic) IBOutlet UIButton *headImg;
@property (weak, nonatomic) IBOutlet UIButton *chatBtn;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UIButton *postBtn;
@property (weak, nonatomic) IBOutlet UIView *statusView; //紅人, 新星, 精選..
// 滑动手势
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRec;
@property (nonatomic, weak) id<SpotLightViewDelegate> delegate;
- (void)updateIdLabel :(NSString *) name;
@end

NS_ASSUME_NONNULL_END
