//
//  LoginVerifyView.h
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LoginVerifyView;

@protocol LoginVerifyViewDelegate

@end

@interface LoginVerifyView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (nonatomic, weak) id<LoginVerifyViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *verify1Label;
@property (weak, nonatomic) IBOutlet UITextField *verify2Label;
@property (weak, nonatomic) IBOutlet UITextField *verify3Label;
@property (weak, nonatomic) IBOutlet UITextField *verify4Label;
@property (weak, nonatomic) IBOutlet UITextField *verify5Label;
@property (weak, nonatomic) IBOutlet UITextField *verify6Label;
@property (weak, nonatomic) IBOutlet UILabel *codeMsgLabel;

- (void) refreshMsgLabel :(NSUInteger) msg;
@end

NS_ASSUME_NONNULL_END
