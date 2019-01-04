//
//  ReplyPriceController.m
//  IME
//
//  Created by apple on 2018/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

#import "ReplyPriceController.h"

@interface ReplyPriceController ()

@end

@implementation ReplyPriceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"回覆/通話設定";
    _replyPriceView = [[ReplyPriceView alloc] init];
    _replyPriceView.delegate = self;
    _replyPriceView.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_replyPriceView.view];
    
    [_replyPriceView.msgPriceSlider addTarget:self action:@selector(msgSlider:) forControlEvents:UIControlEventValueChanged];
    [_replyPriceView.callPriceSlider addTarget:self action:@selector(callSlider:) forControlEvents:UIControlEventValueChanged];
    
}
- (IBAction)msgSlider:(id)sender {
    [_replyPriceView updateMsgPriceLabel:_replyPriceView.msgPriceSlider.value];
}
- (IBAction)callSlider:(id)sender {
    [_replyPriceView updateCallPriceLabel:_replyPriceView.callPriceSlider.value];
}

@end
