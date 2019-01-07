//
//  LoginModel.m
//  IME
//
//  Created by apple on 2019/1/7.
//  Copyright © 2019 apple. All rights reserved.
//

#import "LoginModel.h"
#import "AFNetworking.h"
@implementation LoginModel
/*
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID" : @"id",
             };
}*/
+ (LoginModel *) instance
{
    // Persistent instance.
    static LoginModel *_default = nil;
    if (_default == nil)
    {
        _default = [[LoginModel alloc] init];
    }
    return _default;
}

- (void)POSTWithUrl:(NSString *)urlStr paramDict:(NSMutableDictionary *)paramDict SuccessBlock:(SuccessBlock)PostSuccess FailureBlock:(FailureBlock)PostFailure
{
    //paramDict = [NetWorkManager getLocalParm:paramDict url:urlStr];
    paramDict = [NSMutableDictionary dictionary];
    paramDict[@"phone_no"] = @"886932106246";
    
    if (![self isExistenceNetwork])
    {
        NSLog(@"请检查当前网络");
    }
    else
    {
        //[NetWorkManager myCookieStorage];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        [manager POST:urlStr parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"%@",responseObject);
            NSLog(@"成功");
            NSMutableDictionary * dic =  [[NSMutableDictionary alloc] init];
            dic = responseObject;
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"失败");
        }];
        
        
        
    }
}

#pragma mark 判断当前网络状态
- (BOOL)isExistenceNetwork
{
    BOOL isExistenceNetwork = YES;
    switch ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus)
    {
        case AFNetworkReachabilityStatusUnknown:
            isExistenceNetwork = YES;
            break;
        case AFNetworkReachabilityStatusNotReachable:
            isExistenceNetwork = NO;
            break;
        case AFNetworkReachabilityStatusReachableViaWWAN:
            isExistenceNetwork = YES;
            break;
        case AFNetworkReachabilityStatusReachableViaWiFi:
            isExistenceNetwork = YES;
            break;
            
        default:
            break;
    }
    
    return isExistenceNetwork;
}

@end
