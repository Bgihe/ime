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
NS_ASSUME_NONNULL_BEGIN

@interface LoginVerifyController : UIViewController<LoginVerifyViewDelegate>{
    LoginVerifyView * _loginVerifyView;
}
@end

NS_ASSUME_NONNULL_END
