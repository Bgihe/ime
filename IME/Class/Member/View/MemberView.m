//
//  MemberView.m
//  IME
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MemberView.h"
#import "MemberModel.h"
@implementation MemberView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        UIVisualEffectView *lightView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        lightView.layer.cornerRadius = 5;
        lightView.alpha = 0.99;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_headImg.backgroundColor = [UIColor whiteColor];
            self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
            self->_headImg.layer.cornerRadius = CGRectGetHeight(self->_headImg.frame)/2;
            self->_headImg.clipsToBounds = YES;
            self->_headImg.backgroundColor = [UIColor whiteColor];
            self->_headImg.layer.borderWidth = 3;
            self->_headImg.layer.borderColor = [UIColor whiteColor].CGColor;
            self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
            
            
            [self->_editBtn setFrame:CGRectMake(CGRectGetMaxX(self->_headImg.frame)-(self->_headImg.frame.size.width*0.3), CGRectGetMaxY(self->_headImg.frame)-(self->_headImg.frame.size.width*0.3), (self->_headImg.frame.size.width*0.3), (self->_headImg.frame.size.width*0.3))];
            
            self->_editBtn.layer.cornerRadius = CGRectGetHeight(self->_editBtn.frame)/2;
            self->_editBtn.clipsToBounds = YES;
            self->_editBtn.layer.masksToBounds = YES;
            self->_editBtn.contentMode=UIViewContentModeScaleAspectFill;

            lightView.frame = CGRectMake(0, 0, self->_headBgImg.frame.size.width, self->_headBgImg.frame.size.height);
            [self->_headBgImg addSubview:lightView];
        });
 
        _traceBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _fanBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [_traceBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_fanBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_traceBtn setTitle:@"追蹤 \n 1" forState:UIControlStateNormal];
        [_fanBtn setTitle:@"粉絲 \n 1" forState:UIControlStateNormal];
    }
    return self;
}

- (void)reloadMemberUI{
    MemberModel * memberModel = [MemberModel instance];
  
    [_fanBtn setTitle:[[NSString alloc]initWithFormat:@"粉絲\n%ld",(long)memberModel.fans_num] forState:UIControlStateNormal];
    [_traceBtn setTitle:[[NSString alloc]initWithFormat:@"追蹤\n%ld",(long)memberModel.trace_num] forState:UIControlStateNormal];
    [_nameLabel setText:memberModel.account];

    if (memberModel.thumbnail) {
        NSArray *partitionArr = [[NSArray alloc]init];
        partitionArr =[memberModel.thumbnail componentsSeparatedByString:@","];
        NSData *decodedImageData = [[NSData alloc]
                                    initWithBase64EncodedString:[partitionArr objectAtIndex:1] options:NSDataBase64DecodingIgnoreUnknownCharacters];
        
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation: UIStatusBarAnimationSlide];
        UIImage *image=[UIImage imageWithData:decodedImageData];
        CGFloat fixelW = CGImageGetWidth(image.CGImage);
        CGRect rect = CGRectMake(0, 0, fixelW, fixelW);//创建矩形框
 
        [_headImg setImage:[UIImage imageWithCGImage:CGImageCreateWithImageInRect([image CGImage], rect)]];
        [_headBgImg setImage:[UIImage imageWithCGImage:CGImageCreateWithImageInRect([image CGImage], rect)]];
 
    }
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"MemberView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
@end
