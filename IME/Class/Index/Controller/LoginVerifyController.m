//
//  LoginVerifyController.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LoginVerifyController.h"

@interface LoginVerifyController ()

@end

@implementation LoginVerifyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loginVerifyView = [[LoginVerifyView alloc] init];
    _loginVerifyView.delegate = self;
    _loginVerifyView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_loginVerifyView.view];
    
    [_loginVerifyView.backBtn addTarget:self action:@selector(clickBackBtnBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_loginVerifyView.nextBtn addTarget:self action:@selector(clickNextBtn:) forControlEvents:UIControlEventTouchUpInside];
}
- (IBAction)clickBackBtnBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickNextBtn:(id)sender {
    MainController * mainController = [[MainController alloc] init];
    [self presentViewController:mainController animated:YES completion:NULL];
}

@end
