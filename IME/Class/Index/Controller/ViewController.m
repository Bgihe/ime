//
//  ViewController.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "ViewController.h"
#import "LoginMainController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

    
}
- (IBAction)clickTestBtn:(id)sender {
    
    KPostNotification(KNotificationLoginStateChange, @YES);
    
    /*
    LoginMainController * loginMainController = [[LoginMainController alloc] init];
    [self presentViewController:loginMainController animated:YES completion:NULL];*/
    
}

-(void)viewWillAppear:(BOOL)animated{

    
}
@end
