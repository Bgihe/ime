//
//  MemberView.h
//  IME
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MemberView;

@protocol MemberViewDelegate

@end
@interface MemberView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *headBgImg;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;

 
@property (weak, nonatomic) IBOutlet UIButton *traceBtn;
@property (weak, nonatomic) IBOutlet UIButton *fanBtn;


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) id<MemberViewDelegate> delegate;

- (void)reloadMemberUI;
@end


