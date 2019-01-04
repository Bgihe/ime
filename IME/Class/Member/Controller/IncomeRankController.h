//
//  IncomeRankController.h
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IncomeRankView.h"
@interface IncomeRankController : UIViewController<IncomeRankViewDelegate>{
    IncomeRankView * _incomeRankView;
}

@end
