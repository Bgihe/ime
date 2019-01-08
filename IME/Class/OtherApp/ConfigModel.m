//
//  ConfigModel.m
//  IME
//
//  Created by apple on 2019/1/8.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ConfigModel.h"

@implementation ConfigModel
+ (ConfigModel *) instance
{
    static ConfigModel *_default = nil;
    if (_default == nil)
    {
        _default = [[ConfigModel alloc] init];
    }
    return _default;
}
@end
