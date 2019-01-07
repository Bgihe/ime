//
//  LoginPhoneController.h
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginPhoneView.h"
#import "LoginVerifyController.h"
#import "LoginModel.h"

@interface LoginPhoneController : UIViewController<LoginPhoneViewDelegate>{
    LoginPhoneView * _loginPhoneView;
}

@end
 
