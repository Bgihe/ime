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
    
    
    MainController * mainController = [[MainController alloc] init];
    [self addChild:mainController inRect:self.view.bounds];
    /*
    [mainController dismissViewControllerAnimated:YES completion:nil];
    
    mainController.pageNumber = 2;
    [self presentViewController:mainController animated:YES completion:NULL];*/
}
- (IBAction)clickSaveBtn:(id)sender {
   
    [self dismissViewControllerAnimated:YES completion:nil];
    
  
}

@end
