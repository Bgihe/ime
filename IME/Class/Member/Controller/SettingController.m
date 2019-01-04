//
//  SettingController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SettingController.h"
#import "MainController.h"
@interface SettingController ()

@end

@implementation SettingController



- (void)viewDidLoad {
    [super viewDidLoad];
    _settingView = [[SettingView alloc] init];
    _settingView.delegate = self;
    _settingView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_settingView.view];

    [_settingView.backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_settingView.saveBtn addTarget:self action:@selector(clickSaveBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)clickBackBtn:(id)sender {
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController popViewControllerAnimated:YES];

    /*
    MainController * mainController = [[MainController alloc] init];
    self.navigationController.navigationBarHidden=YES;
    [self.navigationController pushViewController: mainController animated:YES];*/
}
- (IBAction)clickSaveBtn:(id)sender {
   
    [self dismissViewControllerAnimated:YES completion:nil];
    
  
}

@end
