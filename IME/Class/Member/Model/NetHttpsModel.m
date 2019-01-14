//
//  NetHttpsModel.m
//  IME
//
//  Created by apple on 2019/1/11.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NetHttpsModel.h"
#import "AFNetworking.h"
@implementation NetHttpsModel


- (void)POSTWithUrl:(NSString *)urlStr paramDict:(NSMutableDictionary *)paramDict
{
    
    NSString * apiUrl = [URL_main stringByAppendingString:urlStr];
    /*
    paramDict = [NSMutableDictionary dictionary];
    paramDict[@"phone_no"] = @"886932106246";
    */
    if (![self isExistenceNetwork])
    {
        NSLog(@"请检查当前网络");
    }
    else
    {
        //[NetWorkManager myCookieStorage];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        [manager POST:apiUrl parameters:paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"%@",responseObject);
            NSLog(@"成功");
            [self->_delegate httpResult:responseObject :urlStr];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"失败");
        }];
        
    }
}


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
