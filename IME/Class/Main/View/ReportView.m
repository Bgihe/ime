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
            self->_firstBtn.layer.cornerRadius = CGRectGetHeight(self->_firstBtn.frame)/2;
            self->_firstBtn.clipsToBounds = YES;
            self->_firstBtn.layer.masksToBounds = YES;
            self->_secondBtn.layer.cornerRadius = CGRectGetHeight(self->_secondBtn.frame)/2;
            self->_secondBtn.clipsToBounds = YES;
            self->_secondBtn.layer.masksToBounds = YES;
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
