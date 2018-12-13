//
//  LoginMainView.h
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginMainView;

@protocol LoginMainViewDelegate

@end
@interface LoginMainView : UIView

@property (weak, nonatomic) IBOutlet UIButton *phoneBtn;
@property (weak, nonatomic) IBOutlet UIButton *accountBtn;
@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UIView *memberView;
@property (weak, nonatomic) IBOutlet UIView *loginView;

@property (nonatomic, weak) id<LoginMainViewDelegate> delegate;


@end


