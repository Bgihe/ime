//
//  NetHttpsManager.h
//  IME
//
//  Created by apple on 2019/1/7.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SuccessBlock)(NSDictionary *responseJson);
typedef void (^FailureBlock)(NSError *error);

@interface NetHttpsManager : NSObject
- (void)POSTWithParameters:(NSMutableDictionary *)paramDict SuccessBlock:(SuccessBlock)PostSuccess FailureBlock:(FailureBlock)PostFailure;


- (void)POSTWithUrl:(NSString *)urlStr paramDict:(NSMutableDictionary *)paramDict SuccessBlock:(SuccessBlock)PostSuccess FailureBlock:(FailureBlock)PostFailure;


- (BOOL)isExistenceNetwork;
@end
