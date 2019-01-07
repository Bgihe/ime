//
//  NetHttpsManager.m
//  IME
//
//  Created by apple on 2019/1/7.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NetHttpsManager.h"
#import "AFNetworking.h"
@implementation NetHttpsManager


#pragma mark - ----------------------- 请求网络方法 -----------------------
/**
 POST异步请求方法一
 
 @param paramDict 请求参数
 @param PostSuccess 成功回调
 @param PostFailure 失败回调
 */
- (void)POSTWithParameters:(NSMutableDictionary *)paramDict SuccessBlock:(SuccessBlock)PostSuccess FailureBlock:(FailureBlock)PostFailure
{
    [self POSTWithUrl:@"http://api.ga8877.com/api-v1/auth/send-auth-code" paramDict:paramDict SuccessBlock:PostSuccess FailureBlock:PostFailure];
}

/**
 POST异步请求方法二
 
 @param urlStr 接口基本地址
 @param paramDict 请求参数
 @param PostSuccess 成功回调
 @param PostFailure 失败回调
 */
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
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
            NSLog(@"失败");
        }];
 
    }
}

/*
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
 
 //[NetWorkManager doResult:responseObject url:urlStr paramDict:paramDict successBlock:PostSuccess successBlock2:nil failureBlock:PostFailure failureBlock2:nil];
 NSLog(@"%@",responseObject);
 NSLog(@"成功");
 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
 
 //[NetWorkManager updateErrorToServiceWithUrl:urlStr paramDict:paramDict errorString:[NSString stringWithFormat:@"%@",error]];
 NSLog(@"失败");
 }];
 
 
 

}
}
 */



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
