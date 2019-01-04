//
//  IncomeController.h
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IncomeView.h"
@interface IncomeController : UIViewController<IncomeViewDelegate>{
    IncomeView * _incomeView;
}

@end
