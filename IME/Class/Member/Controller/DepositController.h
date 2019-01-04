//
//  DepositController.h
//  IME
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DepositView.h"
#import "DepositModel.h"
#import "DepositDetailController.h"
@interface DepositController : UIViewController<DepositViewDelegate>{
    DepositView * _depositView;
}
@property (nonatomic, strong) DepositModel    * depositModel;
@end
