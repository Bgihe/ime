//
//  PermissionsModel.m
//  IME
//
//  Created by apple on 2019/1/8.
//  Copyright © 2019 apple. All rights reserved.
//

#import "PermissionsModel.h"

@implementation PermissionsModel
 
+ (PermissionsModel *) instance
{
    static PermissionsModel *_default = nil;
    if (_default == nil)
    {
        _default = [[PermissionsModel alloc] init];
    }
    return _default;
}

@end
