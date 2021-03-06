//
//  SpotLightView.m
//  IME
//
//  Created by MAC on 2018/12/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SpotLightView.h"


@implementation SpotLightView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];

        _statusView.layer.cornerRadius = 5;
        [_backBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [_moreBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];


        int safeBottomPadding = 0.0;
        int safeTopPadding = 0.0;
        if (@available(iOS 11.0, *)) {
            safeBottomPadding = kSafeBottomPadding;
            safeTopPadding = kSafeTopPadding;
        } else {
            // Fallback on earlier versions
        }

        _bottomBgMask = [[UILabel alloc] initWithFrame:CGRectMake(0, KScreenHeight/2, KScreenWidth , KScreenHeight/2)];//CGRectGetMinY(_bottomBgView.frame) - KScreenHeight/2
        [self.view addSubview:_bottomBgMask];
        _topBgMask = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth , KScreenHeight/2)];//CGRectGetMinY(_bottomBgView.frame) - KScreenHeight/2
        [self.view addSubview:_topBgMask];
        
        
        
        _bottomBgView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight-KScreenHeight*0.06 -safeBottomPadding, KScreenWidth, KScreenHeight*0.06 + safeBottomPadding)];
        _bottomBgView.backgroundColor =[UIColor colorWithRed:40.0/255.0 green:158.0/255.0 blue:163.0/255.0 alpha:0.5];
        [self.view addSubview:_bottomBgView];
        
        CATransition *transition = [CATransition animation];
        transition.duration = 0;
        transition.type = kCATransitionFromBottom;;
        transition.subtype = kCATransitionFromLeft;
        [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];

        _bottomBgMask.clipsToBounds = YES;
        _bottomBgMask.layer.masksToBounds = YES;
        //漸層光澤
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = _bottomBgMask.bounds;
        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.0] CGColor], (id)[[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.5] CGColor], nil]; // 由上到下的漸層顏色
        [_bottomBgMask.layer insertSublayer:gradient atIndex:0];
        [_bottomBgMask.layer addAnimation:transition forKey:nil];

        _topBgMask.clipsToBounds = YES;
        _topBgMask.layer.masksToBounds = YES;
        //漸層光澤
        gradient = [CAGradientLayer layer];
        gradient.frame = _bottomBgMask.bounds;
        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.5] CGColor], (id)[[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.0] CGColor], nil]; // 由上到下的漸層顏色
        [_topBgMask.layer insertSublayer:gradient atIndex:0];
        [_topBgMask.layer addAnimation:transition forKey:nil];
        
        
        
        _postBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, (_bottomBgView.frame.size.height- safeBottomPadding)*0.25, _bottomBgView.frame.size.width/2, (_bottomBgView.frame.size.height- safeBottomPadding)*0.5 )];
        _postBtn.tintColor = [UIColor whiteColor];
        [_postBtn setTitle:@"貼文" forState:UIControlStateNormal];
        [_postBtn setImage:[UIImage imageNamed:@"streamer_post2"] forState:UIControlStateNormal];
        [_postBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        
        _chatBtn = [[UIButton alloc] initWithFrame:CGRectMake(_bottomBgView.frame.size.width/2, (_bottomBgView.frame.size.height- safeBottomPadding)*0.25, _bottomBgView.frame.size.width/2, (_bottomBgView.frame.size.height- safeBottomPadding)*0.5)];
        _chatBtn.tintColor = [UIColor whiteColor];
        [_chatBtn setTitle:@"聊天" forState:UIControlStateNormal];
        [_chatBtn setImage:[UIImage imageNamed:@"streamer_chat2"] forState:UIControlStateNormal];
        [_chatBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [_bottomBgView addSubview:_postBtn];
        [_bottomBgView addSubview:_chatBtn];
        
        _followBtn = [[UIButton alloc] initWithFrame:CGRectMake(_bottomBgView.frame.size.width/4 , (_bottomBgView.frame.size.height- safeBottomPadding)*0.25, _bottomBgView.frame.size.width/2, (_bottomBgView.frame.size.height- safeBottomPadding)*0.5)];
        [_followBtn setTitle:@"追蹤" forState:UIControlStateNormal];
        [_followBtn setImage:[UIImage imageNamed:@"streamer_follow"] forState:UIControlStateNormal];
        [_followBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [_bottomBgView addSubview:_followBtn];

        _headImg = [[UIButton alloc] initWithFrame:CGRectMake(20, _bottomBgView.frame.origin.y -30 -50 , 50, 50)];
        [_headImg setImage:[UIImage imageNamed:@"test_img"] forState:UIControlStateNormal];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_headImg.imageView setContentMode:UIViewContentModeScaleAspectFill];
            self->_headImg.backgroundColor = [UIColor whiteColor];
            self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
            self->_headImg.layer.cornerRadius = CGRectGetHeight(self->_headImg.frame)/2;
            self->_headImg.clipsToBounds = YES;
            self->_headImg.backgroundColor = [UIColor whiteColor];
            self->_headImg.layer.borderWidth = 1;
            self->_headImg.layer.borderColor = [UIColor whiteColor].CGColor;
            self->_headImg.contentMode=UIViewContentModeScaleAspectFill;
            self->_headImg.layer.masksToBounds = YES;
        });
        [self.view addSubview:_headImg];
        
        _moreMsgBtn = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth - 20 -50, _bottomBgView.frame.origin.y -30 -20 , 50, 20)];
        [_moreMsgBtn setTitle:@"...更多" forState:UIControlStateNormal];
        _moreMsgBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_moreMsgBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [self.view addSubview:_moreMsgBtn];
 

        _msgTextView = [[UITextView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+10, _bottomBgView.frame.origin.y -20 -45, CGRectGetMinX(_moreMsgBtn.frame) - CGRectGetMaxX(_headImg.frame)-20, 45)];
        _msgTextView.font = [UIFont systemFontOfSize:15];
        _msgTextView.backgroundColor = [UIColor clearColor];
        _msgTextView.textColor = [UIColor whiteColor];
        
    
        _msgTextView.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";

        [self.view addSubview:_msgTextView];

        _idLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+10, CGRectGetMinY(_msgTextView.frame) -10, CGRectGetMinX(_moreMsgBtn.frame) - CGRectGetMaxX(_headImg.frame)-20, 20)];
        _idLabel.text = @"Icy_50203er";
        _idLabel.textColor = [UIColor whiteColor];

        _idLabel.font = [UIFont systemFontOfSize:15];
        [_idLabel sizeToFit];
        [self.view addSubview:_idLabel];

        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth - 40 , safeTopPadding + 20, 20, 20)];
        [_backBtn setImage:[UIImage imageNamed:@"message_close"] forState:UIControlStateNormal];
        _moreBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMinX(_backBtn.frame) - 40, safeTopPadding +20, 20, 20)];
        [_moreBtn setImage:[UIImage imageNamed:@"icon_more"] forState:UIControlStateNormal];
        [self.view addSubview:_backBtn];
        [self.view addSubview:_moreBtn];
    }
    return self;
}

- (void) refreshFollowBtn : (BOOL) isFollow{
    if (isFollow) {
        _followBtn.hidden = YES;
        _chatBtn.hidden = NO;
        _postBtn.hidden = NO;
    }else{
        _followBtn.hidden = NO;
        _chatBtn.hidden = YES;
        _postBtn.hidden = YES;
    }
}

- (void) refreshMsgRect{
    float height = 0.0;
    [_msgTextView setFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+10, _bottomBgView.frame.origin.y -30 -50, CGRectGetMinX(_moreMsgBtn.frame) - CGRectGetMaxX(_headImg.frame)-20, 50)];
    _msgTextView.scrollEnabled = NO;
    _msgTextView.editable = NO;

    CGRect frame = _msgTextView.frame;
    if ([_msgTextView.text isEqualToString:@""]) {
        _moreMsgBtn.hidden = YES;
        //_bottomBgView.hidden = YES;
        return;
    }else{
        height = [self heightForString:_msgTextView.text andWidth:CGRectGetMinX(_moreMsgBtn.frame) - CGRectGetMaxX(_headImg.frame)-20 :_msgTextView].height + 16.0;
    }
    frame.size.height = height;
    frame.origin.y = _bottomBgView.frame.origin.y -30 -height;
    _msgTextView.frame = frame;
    [_idLabel setFrame:CGRectMake(CGRectGetMaxX(_headImg.frame)+10, CGRectGetMinY(_msgTextView.frame) -20, CGRectGetMinX(_moreMsgBtn.frame) - CGRectGetMaxX(_headImg.frame)-20, 20)];
    _moreMsgBtn.hidden = YES;
}

- (CGSize) heightForString:(NSString *)value andWidth:(float)width :(UITextView*) textView{
 
    NSDictionary *dictAttr0 = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    NSAttributedString *attrStr = [[NSAttributedString alloc]initWithString:value attributes:dictAttr0];
    textView.attributedText = attrStr;
    textView.textColor = [UIColor whiteColor];
    NSRange range = NSMakeRange(0, attrStr.length);
    
    
    // 获取该段attributedString的属性字典
    NSDictionary *dic = [attrStr attributesAtIndex:0 effectiveRange:&range];
    // 计算文本的大小
    CGSize sizeToFit = [value boundingRectWithSize:CGSizeMake(width - 16.0, MAXFLOAT) // 用于计算文本绘制时占据的矩形块
                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading // 文本绘制时的附加选项
                                        attributes:dic        // 文字的属性
                                           context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil

    return sizeToFit;
}

-(int)numberOfRows:(NSString *)string inView:(UITextView*)txtView
{
    CGSize maximumLabelSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine |
    NSStringDrawingUsesLineFragmentOrigin;
    NSString *new = [string stringByReplacingOccurrencesOfString: @"n" withString:@""];
    NSDictionary *attr = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};
    CGRect bounds = [string boundingRectWithSize:maximumLabelSize
                                      options:options
                                   attributes:attr
                                      context:nil];
    CGSize viewSize = bounds.size;
    int row = floor(txtView.contentSize.height/viewSize.height ) ;
    return row;
}



- (void)refreshRect{
     CATransition *transition = [CATransition animation];
     transition.duration = 0;
     transition.type = kCATransitionFromBottom;;
     transition.subtype = kCATransitionFromLeft;
     [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
     //[self.view.layer addAnimation:transition forKey:nil];

    _bottomBgMask.clipsToBounds = YES;
    _bottomBgMask.layer.masksToBounds = YES;
    //漸層光澤
    CAGradientLayer *gradient = [CAGradientLayer layer];

    gradient.frame = _bottomBgMask.bounds;
    
    //CGRectGetMaxY(_bottomBgView.frame)
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.0] CGColor], (id)[[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.5] CGColor], nil]; // 由上到下的漸層顏色
    [_bottomBgMask.layer insertSublayer:gradient atIndex:0];
    [_bottomBgMask.layer addAnimation:transition forKey:nil];
}

- (void)onTapBlank:(UITapGestureRecognizer *)tap
{
    NSLog(@"Success!!");
    if (tap.state == UIGestureRecognizerStateEnded)
    {
        
    }
}

- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"SpotLightView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
- (void) updateIdLabel :(NSString *) name{
    _idLabel.text = name;
}

- (void) updateMsgTextHeight :(float) height{
    
    [_msgTextView setFrame:CGRectMake(0, 0, 0, 0)];
}


-(void) refreshUI : (UIImage*) headImg :(UIImage*) bgHeadImg :(NSString*) msgStr :(NSString*) memberAccount :(BOOL) showBottom{
    NSLog(@"%@:%@:%@",headImg,msgStr,memberAccount);

    [_headImg setImage:headImg forState:UIControlStateNormal];
    [_headBgImg setImage:bgHeadImg];

    if (![msgStr isEqualToString:@""]) {
        if ([self heightForString:msgStr andWidth:CGRectGetMinX(_moreMsgBtn.frame) - CGRectGetMaxX(_headImg.frame)-20 :_msgTextView].height / [self heightForString:@"一行文字" andWidth:CGRectGetMinX(_moreMsgBtn.frame) - CGRectGetMaxX(_headImg.frame)-20 :_msgTextView].height > 2) {
            _moreMsgBtn.hidden = NO;
        }else{
            _moreMsgBtn.hidden = YES;
        }
    }else{
        _moreMsgBtn.hidden = YES;
    }
    _msgTextView.text = msgStr;
    
    _idLabel.text = memberAccount;
    if (!showBottom) {
        _moreMsgBtn.hidden = YES;
        _bottomBgView.hidden = YES;
        _moreMsgBtn.hidden = NO;
    }
}
@end
