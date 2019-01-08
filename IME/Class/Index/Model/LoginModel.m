//
//  LoginModel.m
//  IME
//
//  Created by apple on 2019/1/7.
//  Copyright © 2019 apple. All rights reserved.
//

#import "LoginModel.h"
 
@implementation LoginModel

+ (LoginModel *) instance
{
    static LoginModel *_default = nil;
    if (_default == nil)
    {
        _default = [[LoginModel alloc] init];
    }
    return _default;
}


/*

- (id)initWithDict:(NSDictionary *)dict {
    if(self = [super init]) {
        NSLog(@"%@",[dict allKeys]);
        
        for(NSString *key in [dict allKeys]) {
            NSString *value = [dict objectForKey:key];
            if([value isKindOfClass:[NSNumber class]]){
                value = [NSString stringWithFormat:@"%@",value];
                NSLog(@"Value%@",value);
            }else if([value isKindOfClass:[NSNull class]])
                value = @"";
            @try {
                [self setValue:value forKey:key];
            }
            @catch (NSException *exception) {
                NSLog(@"试图添加不存在的key:%@到实例:%@中.",key,NSStringFromClass([self class]));
            }
        }
    }
    return self;
}*/
@end
