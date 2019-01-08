//
//  SignupView.h
//  IME
//
//  Created by apple on 2019/1/8.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SignupView;

@protocol SignupViewDelegate

@end

@interface SignupView : UIView
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) id<SignupViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *femaleBtn;
@property (weak, nonatomic) IBOutlet UIButton *maleBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;

@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;


@property (strong, nonatomic) IBOutlet UIView *view;
- (void) refreshSexLabel:(BOOL) isMale;
@end
