//
//  LoginAccountController.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LoginAccountController.h"

@interface LoginAccountController ()

@end

@implementation LoginAccountController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loginAccountView = [[LoginAccountView alloc] init];
    _loginAccountView.delegate = self;
    _loginAccountView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_loginAccountView.view];
    
    [_loginAccountView.backBtn addTarget:self action:@selector(clickBackBtnBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_loginAccountView.nextBtn addTarget:self action:@selector(clickNextBtn:) forControlEvents:UIControlEventTouchUpInside];
}
- (IBAction)clickBackBtnBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickNextBtn:(id)sender {
    LoginVerifyController * loginVerifyController = [[LoginVerifyController alloc] init];
    [self presentViewController:loginVerifyController animated:YES completion:NULL];
}


@end
