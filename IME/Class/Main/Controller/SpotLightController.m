//
//  SpotLightController.m
//  IME
//
//  Created by MAC on 2018/12/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SpotLightController.h"
#import "MainController.h"


@interface SpotLightController ()

@end

@implementation SpotLightController

- (void)viewDidLoad {
    [super viewDidLoad];
    //_isPageView = false;
    _spotLightView = [[SpotLightView alloc] init];
    _spotLightView.delegate = self;
    _spotLightView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_spotLightView.view];
    
    [_spotLightView.backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_spotLightView.moreBtn addTarget:self action:@selector(clickMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_spotLightView.moreMsgBtn addTarget:self action:@selector(clickMoreMsgBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [_spotLightView updateIdLabel:_nameStr];
}

- (IBAction)clickMoreMsgBtn:(id)sender{
    [_spotLightView refreshMsgRect];
}
- (IBAction)clickBackBtn:(id)sender {
    //self.tabBarController.tabBar.hidden = NO;
    //self.navigationController.navigationBarHidden=NO;
    if (_isPageView) {
        //[self removeFromParentViewController];
        //[self.view removeFromSuperview];
        //[self dismissViewControllerAnimated:YES completion:nil];
        [_delegate removeController];
    }else{
        [self.navigationController popViewControllerAnimated:NO];
    }
}
- (IBAction)clickMoreBtn:(id)sender {
    /* 動畫 1
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionFromBottom;;
    transition.subtype = kCATransitionFromLeft;
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.view.layer addAnimation:transition forKey:nil];*/
    
    [self transitionWithType:kCATransitionFade WithSubtype:@"fromBottom" ForView:self.view];

    _reportView = [[ReportView alloc] init];
    _reportView.delegate = self;
    _reportView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_reportView.view];

    [_reportView.firstBtn addTarget:self action:@selector(clickUnfollowBtnBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_reportView.secondBtn addTarget:self action:@selector(clickReportBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_reportView.cancelBtn addTarget:self action:@selector(clickCancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (IBAction)clickUnfollowBtnBtn:(id)sender {
    NSLog(@"取消追蹤動作");
}
- (IBAction)clickReportBtn:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"檢舉"
                                                                   message:@"請輸入檢舉原因"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        // optionally configure the text field
        textField.keyboardType = UIKeyboardTypeDefault;
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"送出"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action) {
                                                         //UITextField *textField = [alert.textFields firstObject];
                                                         NSLog(@"%@",[alert.textFields firstObject]);
                                                         
                                                     }];
    [alert addAction:okAction];
    
    
    [self presentViewController:alert animated:YES completion:nil];
}
- (IBAction)clickCancelBtn:(id)sender {
    [_reportView removeReportView];
    
}



#pragma CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    //设置运动时间
    animation.duration = 0.2;
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        //设置子类
        animation.subtype = subtype;
    }
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}

@end
