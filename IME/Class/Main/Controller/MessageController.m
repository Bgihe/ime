//
//  MessageController.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MessageController.h"
#import "MediaPlayerController.h"
@interface MessageController (){
    double keyboardDuration;
    UITapGestureRecognizer *tapRecognizer;
}

@end

@implementation MessageController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_messageView.tableView reloadData];
}
- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear");
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:19 inSection:0];
    [_messageView.tableView scrollToRowAtIndexPath:indexPath
                                  atScrollPosition:UITableViewScrollPositionBottom
                                          animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _messageView = [[MessageView alloc] init];
    _messageView.delegate = self;
    _messageView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_messageView.view];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    NSLog(@"MessageController viewDidLoad");
}
/*
#pragma mark - 平移动画
- (void)do_move:(UIView *)view
{
    CABasicAnimation * moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake([[UIScreen mainScreen] bounds].size.width / 2.0f, [[UIScreen mainScreen] bounds].size.height / 2.0f)];
    moveAnimation.duration = 3.0f;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.repeatCount = 1;
    moveAnimation.delegate = self;
    moveAnimation.fillMode = kCAFillModeForwards;
    [moveAnimation setValue:@"moveAnimation" forKey:@"moveAnimation"];
    
    [view.layer addAnimation:moveAnimation forKey:@"moveAnimation"];
}
- (void)do_rotation:(UIView *)view
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * -1.0];
    rotationAnimation.duration = 0.2f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = INT_MAX;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)dimissKeyboard {
    [self.view endEditing:YES];
}

- (void)keyboardWillShow:(NSNotification *)notification{
    
    CGSize keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGFloat keyboardHeight = keyboardFrame.height;
    keyboardDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    DLog(@"升起:%f",keyboardHeight);
    [_messageView reloadSendViewUI:keyboardHeight];

    
    
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dimissKeyboard)];
    [self.view addGestureRecognizer:tapRecognizer];
}



- (void)keyboardWillHide:(NSNotification*)notification {
    DLog(@"降落");
    [_messageView reloadSendViewUI:0];
    [self.view removeGestureRecognizer:tapRecognizer];
}

-(void) pushMediaPlayerView{
    MediaPlayerController * mediaPlayerController = [[MediaPlayerController alloc] init];
    self.navigationController.navigationBarHidden=YES;
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController: mediaPlayerController animated:YES];
}




@end
