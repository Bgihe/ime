//
//  LoginModel.h
//  IME
//
//  Created by apple on 2019/1/7.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
 
@interface LoginModel : NSObject

@property (nonatomic, copy) NSString              * account;                 //
@property (nonatomic, copy) NSString              * no;                     //
@property (nonatomic, copy) NSString              * phone_no;           //




+ (LoginModel *) instance;

@end
