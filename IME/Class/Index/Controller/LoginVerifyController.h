//
//  LoginVerifyController.h
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginVerifyView.h"
#import "MainController.h"
#import "SignupController.h"

@interface LoginVerifyController : UIViewController<LoginVerifyViewDelegate>{
    LoginVerifyView * _loginVerifyView;
    NSTimer * _countdownTimer;
    BOOL _isViewLive;
}
@property NSUInteger countdownTime;
@property (strong, nonatomic) NSString * phoneNo;
@end
