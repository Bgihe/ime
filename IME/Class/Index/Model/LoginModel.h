//
//  LoginModel.h
//  IME
//
//  Created by apple on 2019/1/7.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
 
@interface LoginModel : NSObject

@property (nonatomic, copy) NSString                *token;                //認證copy
@property (nonatomic, assign) NSInteger             no;                    //編號
@property (nonatomic, copy) NSString                * account;             //帳號
@property (nonatomic, copy) NSString                * phone_no;            //電話
@property (nonatomic, assign) NSInteger             role;                  //身份 1會員 2主播 3經濟
 


+ (LoginModel *) instance;

@end
