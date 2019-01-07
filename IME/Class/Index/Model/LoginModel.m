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
    // Persistent instance.
    static LoginModel *_default = nil;
    if (_default == nil)
    {
        _default = [[LoginModel alloc] init];
    }
    return _default;
}
 
@end
