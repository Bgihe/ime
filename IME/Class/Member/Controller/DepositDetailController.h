//
//  DepositDetailController.h
//  IME
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DepositDetailView.h"
#import "DepositModel.h"
@interface DepositDetailController : UIViewController<DepositDetailViewDelegate>{
    DepositDetailView * _depositDetailView;
}
@property (nonatomic, strong) DepositModel    * depositModel;
@property (nonatomic, strong) NSMutableArray  * creditsData;     //儲值資訊
@property (nonatomic, strong) NSMutableArray  * subpaymentsList; //繳款地點
@property (nonatomic, strong) NSString        * creditsName;     //儲值類型
@property (nonatomic, assign) BOOL isConfirm;
@end
