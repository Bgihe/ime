//
//  LoginAccountController.h
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginAccountView.h"
#import "LoginVerifyController.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginAccountController : UIViewController<LoginAccountViewDelegate>{
    LoginAccountView * _loginAccountView;
}

@end

NS_ASSUME_NONNULL_END
