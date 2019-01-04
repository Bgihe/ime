//
//  DepositLogController.h
//  IME
//
//  Created by apple on 2018/12/22.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DepositLogView.h"
@interface DepositLogController : UIViewController<DepositLogViewDelegate>{
    DepositLogView * _depositLogView;
}

@end

