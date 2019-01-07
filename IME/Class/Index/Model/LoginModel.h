//
//  LoginModel.h
//  IME
//
//  Created by apple on 2019/1/7.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SuccessBlock)(NSDictionary *responseJson);
typedef void (^FailureBlock)(NSError *error);

@interface LoginModel : NSObject

@property (nonatomic, copy) NSString              * success;                 //
@property (nonatomic, copy) NSString              * msg;                     //
@property (nonatomic, copy) NSString              * valid_seconds;           //

+ (LoginModel *) instance;
- (void) postSendAuthCode : (NSMutableDictionary*) paramDict;
@end
