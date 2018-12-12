//
//  PostController.m
//  IME
//
//  Created by MAC on 2018/12/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PostController.h"

@interface PostController ()

@end

@implementation PostController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _postView = [[PostView alloc] init];
    _postView.delegate = self;
    _postView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_postView.view];
    
    [_postView.backBtn addTarget:self action:@selector(clicBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_postView.unlockBtn addTarget:self action:@selector(clicUnlockBtn:) forControlEvents:UIControlEventTouchUpInside];
}
- (IBAction)clicBackBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clicUnlockBtn:(id)sender {
    [_postView unlockPost];
}


@end
