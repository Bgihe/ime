//
//  SettingView.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SettingView;

@protocol SettingViewDelegate

@end
@interface SettingView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *headBgImg;
 @property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;
@property (weak, nonatomic) IBOutlet UIButton *fanBtn;

@property (nonatomic, weak) id<SettingViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
