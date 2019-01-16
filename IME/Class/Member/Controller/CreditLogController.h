//
//  CreditLogController.h
//  IME
//
//  Created by apple on 2019/1/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogView.h"
#import "DepositDetailView.h"
@interface CreditLogController : UIViewController<LogViewDelegate,DepositDetailViewDelegate>{
    LogView              * _logView;
    DepositDetailView    * _depositDetailView;
    UIView               * _bgView;
    UIView               * _bottomLine;
    UIButton             * _postBtn;
    UIButton             * _msgBtn;
    UIButton             * _otherBtn;
}


@property (nonatomic, strong) NSString        * selectStr;
@property (nonatomic, strong) NSString        * actionStr;
@property (nonatomic, strong) NSMutableArray  * dataArr;
@property                     BOOL              isQuery;
-(void)refreshRect :(int)hight;
@end

