//
//  PostView.h
//  IME
//
//  Created by MAC on 2018/12/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberPostCell.h"
NS_ASSUME_NONNULL_BEGIN
@class PostView;

@protocol PostViewDelegate

@end
@interface PostView : UIView<MemberPostCellDelegate>
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *lockView;


@property (weak, nonatomic) IBOutlet UIButton *headBtn;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIView *textView;


//----
@property (weak, nonatomic) IBOutlet UIView *unlockView;
@property (weak, nonatomic) IBOutlet UIButton *unlockBtn;
@property (weak, nonatomic) IBOutlet UILabel *unlockLabel;

@property (nonatomic, weak) id<PostViewDelegate> delegate;
-(void) unlockPost;
@end

NS_ASSUME_NONNULL_END
