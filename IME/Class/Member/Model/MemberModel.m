//
//  MemberModel.m
//  IME
//
//  Created by apple on 2019/1/9.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MemberModel.h"

@implementation MemberModel
+ (MemberModel *) instance
{
    static MemberModel *_default = nil;
    if (_default == nil)
    {
        _default = [[MemberModel alloc] init];
    }
    return _default;
}
@end
