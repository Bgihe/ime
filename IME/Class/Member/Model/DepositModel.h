//
//  DepositModel.h
//  IME
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DepositModel : NSObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSArray *diamondList;
@property (nonatomic, copy) NSArray *bonusAList;
@property (nonatomic, copy) NSArray *bonusBList;
@property (nonatomic, copy) NSArray *amountList;

@property (nonatomic, copy) NSArray *ATMList;
@property (nonatomic, copy) NSArray *CVSList;



@property (nonatomic, assign) NSInteger     amountRow;
@property (nonatomic, assign) NSInteger     payStatus;
+ (DepositModel *) instance;

@end
