//
//  IncomeController.m
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import "IncomeController.h"

@interface IncomeController ()

@end

@implementation IncomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    _incomeView = [[IncomeView alloc] init];
    _incomeView.delegate = self;
    _incomeView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_incomeView.view];
    
    
   /*
    double money = 1;
    double amount = 0.000001;
    double combo = 0;
    for (int i = 0; i < 100000; i++) {
        int random = arc4random() % 1000;//1000
        NSLog(@"random:%d",random);
        if (random <= 495) {//99
            combo = combo +1;
            money = money + amount;//10
            NSLog(@"WIN:%f,Amount:%f",money,amount);
            amount = 0.000001; //0.001
        }else{
            combo = 0;
            money = money - amount;
            amount = amount + (amount* 1);//0.1
            NSLog(@"LOSE:%f,Amount:%f",money,amount);
        }
        if (money < 0) {
            NSLog(@"END:%f,Count:%d",money,i);
            break;
        }
    }*/
}



@end
