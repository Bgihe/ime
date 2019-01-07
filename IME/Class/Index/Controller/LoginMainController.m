//
//  LoginMainController.m
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LoginMainController.h"

@interface LoginMainController ()

@end

@implementation LoginMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    _loginMainView = [[LoginMainView alloc] init];
    _loginMainView.delegate = self;
    _loginMainView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_loginMainView.view];
    
    [_loginMainView.phoneBtn addTarget:self action:@selector(clickPhoneBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_loginMainView.accountBtn addTarget:self action:@selector(clickAccountBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}





- (IBAction)clickPhoneBtn:(id)sender {
    LoginPhoneController * loginPhoneController = [[LoginPhoneController alloc] init];
    [self presentViewController:loginPhoneController animated:YES completion:NULL];
}

- (IBAction)clickAccountBtn:(id)sender {
    NSLog(@"account");
    LoginAccountController * loginAccountController = [[LoginAccountController alloc] init];
    [self presentViewController:loginAccountController animated:YES completion:NULL];
}


@end
