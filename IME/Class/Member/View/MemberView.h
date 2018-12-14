//
//  MemberView.h
//  IME
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MemberView;

@protocol MemberViewDelegate

@end
@interface MemberView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *headBgImg;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;
@property (weak, nonatomic) IBOutlet UIButton *fanBtn;

@property (nonatomic, weak) id<MemberViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
