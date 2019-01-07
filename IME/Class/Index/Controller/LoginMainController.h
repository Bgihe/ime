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
//#import "NetHttpsManager.h"
#import "LoginModel.h"

typedef void (^SuccessBlock)(NSDictionary *responseJson);
typedef void (^FailureBlock)(NSError *error);

@interface LoginMainController : UIViewController<LoginMainViewDelegate>{
    LoginMainView * _loginMainView;
    //NetHttpsManager * _netHttpsManager;
}

@end

