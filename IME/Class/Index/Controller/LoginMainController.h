//
//  LoginMainController.h
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginMainView.h"
#import "LoginPhoneController.h"
#import "LoginAccountController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginMainController : UIViewController<LoginMainViewDelegate>{
    LoginMainView * _loginMainView;
}

@end

NS_ASSUME_NONNULL_END
