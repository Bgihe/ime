//
//  SignupController.h
//  IME
//
//  Created by apple on 2019/1/8.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignupView.h"


@interface SignupController : UIViewController<SignupViewDelegate>{
    SignupView * _signupView;
    NSString * _genderStr;
}

@end
