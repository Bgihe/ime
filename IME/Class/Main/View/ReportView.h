//
//  ReportView.h
//  IME
//
//  Created by apple on 2018/12/11.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ReportView;

@protocol ReportViewDelegate

@end
@interface ReportView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *unfollowBtn;
@property (weak, nonatomic) IBOutlet UIButton *reportBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIStackView *btnStack;
@property (nonatomic, weak) id<ReportViewDelegate> delegate;

-(void) removeReportView;
@end

NS_ASSUME_NONNULL_END
