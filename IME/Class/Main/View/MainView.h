//
//  MainView.h
//  IME
//
//  Created by apple on 2018/12/6.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MainView;

@protocol MainViewDelegate

@end

@interface MainView : UIView

@property (weak, nonatomic) IBOutlet UIButton *massMsgBtn;
@property (weak, nonatomic) IBOutlet UIButton *msgBtn;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UIButton *settingBtn;
@property (weak, nonatomic) IBOutlet UIButton *cameraBtn;

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *subView;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, weak) id<MainViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
