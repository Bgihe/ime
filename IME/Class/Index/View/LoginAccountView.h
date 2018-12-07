//
//  LoginAccountView.h
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LoginAccountView;

@protocol LoginAccountViewDelegate

@end


@interface LoginAccountView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (nonatomic, weak) id<LoginAccountViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
