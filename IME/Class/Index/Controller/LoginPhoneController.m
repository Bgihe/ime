//
//  LoginPhoneController.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LoginPhoneController.h"


@interface LoginPhoneController ()

@end

@implementation LoginPhoneController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loginPhoneView = [[LoginPhoneView alloc] init];
    _loginPhoneView.delegate = self;
    _loginPhoneView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_loginPhoneView.view];
    
    [_loginPhoneView.backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_loginPhoneView.nextBtn addTarget:self action:@selector(clickNextBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)clickBackBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickNextBtn:(id)sender {
    LoginVerifyController * loginVerifyController = [[LoginVerifyController alloc] init];
    [self presentViewController:loginVerifyController animated:YES completion:NULL];
}

@end
