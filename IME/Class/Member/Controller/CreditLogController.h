//
//  CreditLogController.h
//  IME
//
//  Created by apple on 2019/1/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogView.h"
@interface CreditLogController : UIViewController<LogViewDelegate>{
    LogView     * _logView;
    UIView      * _bgView;
    UIView      * _bottomLine;
    UIButton    * _postBtn;
    UIButton    * _msgBtn;
    UIButton    * _otherBtn;
}


@property (nonatomic, strong) NSString        * selectStr;
@property (nonatomic, strong) NSString        * actionStr;
-(void)refreshRect :(int)hight;
@end

