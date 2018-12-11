//
//  ReportView.m
//  IME
//
//  Created by apple on 2018/12/11.
//  Copyright © 2018 apple. All rights reserved.
//

#import "ReportView.h"

@implementation ReportView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_unfollowBtn.layer.cornerRadius = CGRectGetHeight(self->_unfollowBtn.frame)/2;
            self->_unfollowBtn.clipsToBounds = YES;
            self->_unfollowBtn.layer.masksToBounds = YES;
            self->_reportBtn.layer.cornerRadius = CGRectGetHeight(self->_reportBtn.frame)/2;
            self->_reportBtn.clipsToBounds = YES;
            self->_reportBtn.layer.masksToBounds = YES;
            self->_cancelBtn.layer.cornerRadius = CGRectGetHeight(self->_cancelBtn.frame)/2;
            self->_cancelBtn.clipsToBounds = YES;
            self->_cancelBtn.layer.masksToBounds = YES;
        });
     
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"ReportView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
-(void) removeReportView{
    [self.view removeFromSuperview];
}
@end
