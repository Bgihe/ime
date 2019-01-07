//
//  MessageCell.m
//  IME
//
//  Created by apple on 2018/12/27.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (void)awakeFromNib {
    [super awakeFromNib];

    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor whiteColor];
    _bgView.layer.cornerRadius = 5;
    [self addSubview:_bgView];
 
    _msgLabel = [[UILabel alloc] init];
    _msgLabel.backgroundColor = [UIColor whiteColor];
    _msgLabel.font = [UIFont systemFontOfSize:15];
    _msgLabel.numberOfLines = 2;
    _msgView = [[UIView alloc] init];
    _msgView.backgroundColor = [UIColor colorWithRed:161.0f/255.0f green:195.0f/255.0f blue:203.0f/255.0f alpha:1];
    [_msgView addSubview:_msgLabel];
    [self addSubview:_msgView];

    _headBtn = [[UIButton alloc] init];
    [_headBtn setImage:[UIImage imageNamed:@"login"] forState:UIControlStateNormal];
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_headBtn.contentMode=UIViewContentModeScaleAspectFill;
        self->_headBtn.layer.cornerRadius = CGRectGetHeight(self->_headBtn.frame)/2;
        self->_headBtn.clipsToBounds = YES;
        self->_headBtn.layer.borderWidth = 1;
        self->_headBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        self->_headBtn.contentMode=UIViewContentModeScaleAspectFill;
        self->_headBtn.layer.masksToBounds = YES;
    });
    [self addSubview:_headBtn];
    
    _msgTextView =[[UITextView alloc] init];
    _msgTextView.font = [UIFont systemFontOfSize:14];
    _msgTextView.layer.cornerRadius = 5;
    _msgTextView.backgroundColor =[UIColor whiteColor];
    [self addSubview:_msgTextView];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont systemFontOfSize:10];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.text = @"19:55";
    [self addSubview:_timeLabel];
    
    _photoImg = [[UIImageView alloc] init];
    _photoImg.layer.cornerRadius = 5;
    _photoImg.clipsToBounds = true;
    [self addSubview:_photoImg];
    
    
    _bgView.alpha = 0;
    _photoImg.alpha = 0;
    _msgTextView.alpha = 0;
   // [_msgView setFrame:CGRectMake(100, 0, 50, 50)];
  
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

- (CGSize) heightForString:(NSString *)value andWidth:(float)width :(UITextView*) textView{
    //获取当前文本的属性
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:value];
    textView.attributedText = attrStr;
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

-(float)updateMsgUI:(BOOL)isMe :(int)postStatus :(NSString*) str {

    if (!isMe) {
        float height = 0.0;
        if (postStatus == 0) {
            [_headBtn setFrame:CGRectMake(10, 10, 50, 50)];
            [_msgTextView setFrame:CGRectMake(_headBtn.frame.size.width+20, 20, KScreenWidth - _headBtn.frame.size.width - 30, 20)];
            _msgTextView.text = str;
            _msgTextView.backgroundColor =[UIColor colorWithRed:32.0/255.0 green:125.0/255.0 blue:160.0/255.0 alpha:1];
            _msgTextView.scrollEnabled = NO;
            _msgTextView.editable = NO;
            CGRect frame = _msgTextView.frame;
            height = [self heightForString:str andWidth:KScreenWidth - _headBtn.frame.size.width - 30 :_msgTextView].height + 16.0;
            frame.size.height = height;
            frame.size.width = [self heightForString:str andWidth:KScreenWidth - _headBtn.frame.size.width - 30 :_msgTextView].width+16.0;\
            _msgTextView.frame = frame;

            [UIView animateWithDuration:0.5 animations:^{
                self->_msgTextView.alpha = 1;
            } completion:nil];
            
            //判斷換行
            if ([self heightForString:str andWidth:KScreenWidth - _headBtn.frame.size.width - 30 :_msgTextView].width > (KScreenWidth - _headBtn.frame.size.width - 30)*0.8) {
                [_timeLabel setFrame:CGRectMake(_headBtn.frame.size.width+20, height + 20, 40, 20)];
                height = height + 20;
                
            }else{
                [_timeLabel setFrame:CGRectMake(_msgTextView.frame.origin.x + _msgTextView.frame.size.width +10, 20, 40, height)];
            }
            //不可小於大頭貼高
            if (height < _headBtn.frame.size.height) {
                height = _headBtn.frame.size.height;
            }
        }else if (postStatus == 1){
            [_headBtn setFrame:CGRectMake(10, 10, 50, 50)];
         
            __block CGFloat topicViewHeight = .0f;
            __block float cellHeight = 0.0;
            [_photoImg sd_setImageWithURL:[NSURL URLWithString:str]
                         placeholderImage:[UIImage imageNamed:@"dialog_camera"]
                                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL){
                                    
                                    if (image == nil) {
                                        image = [UIImage imageNamed:@"dialog_camera"];
                                    }
                                    self->_photoImg.image = image;
                                    //显示高度
                                    CGFloat height =.0f;
                                    height = image.size.height * (KScreenWidth - 20) / image.size.width;
                         
                                    self->_photoImg.frame = CGRectMake(10, topicViewHeight +5, KScreenWidth - 20, height);
                                    
                                    topicViewHeight += height;
                                    topicViewHeight = topicViewHeight*(70/KScreenWidth);
                                    cellHeight = topicViewHeight;
                                    
                                     if (self.changeCellHeight) {
                                         self.changeCellHeight();
                                     }
                                    
                                }];
            DLog(@"cellHeight:%f",cellHeight);
            height = cellHeight;

            
            [_bgView setFrame:CGRectMake((_headBtn.frame.size.width + 20) + 0, 10, 70+10, topicViewHeight+10)];
            [_photoImg setFrame:CGRectMake((_headBtn.frame.size.width + 20) +5, 15, 70, topicViewHeight)];
            [_timeLabel setFrame:CGRectMake(_bgView.frame.origin.x + _bgView.frame.size.width +10, 20, 40, 20)];
            
            [UIView animateWithDuration:0.5 animations:^{
                self->_bgView.alpha = 1;
                self->_photoImg.alpha = 1;
            } completion:nil];
            
            
            if (height < _headBtn.frame.size.height) {
                height = _headBtn.frame.size.height;
            }
        }else{
            [_headBtn setFrame:CGRectMake(10, 10, 50, 50)];
            [_photoImg setFrame:CGRectMake(_headBtn.frame.size.width + 20, 15, 70, 70)];
            [_photoImg sd_setImageWithURL:[NSURL URLWithString:str]
                         placeholderImage:[UIImage imageNamed:@"dialog_camera"]
                                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL){
                                    
                                    if (image == nil) {
                                        image = [UIImage imageNamed:@"dialog_camera"];
                                    }
                                    self->_photoImg.image = image;

                                    if (self.changeCellHeight) {
                                        self.changeCellHeight();
                                    }
                                    
                                }];
            
            
            UIVisualEffectView *lightView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
            lightView.frame = CGRectMake(0, 0, _photoImg.frame.size.width, _photoImg.frame.size.height);
            lightView.layer.cornerRadius = 5;
            lightView.alpha = 0.99;
            [_photoImg addSubview:lightView];
   
            
            UIImageView * playImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dialog_video"]];
            playImg.frame = CGRectMake(_photoImg.frame.size.width/2 - _photoImg.frame.size.width/3/2, _photoImg.frame.size.height/2 - _photoImg.frame.size.height/3/2 -5, _photoImg.frame.size.width/3,  _photoImg.frame.size.width/3);
            [_photoImg addSubview:playImg];
            
            UILabel * playTimeLabel = [[UILabel alloc] init];
            playTimeLabel.text = @"30秒";
            playTimeLabel.textColor = [UIColor whiteColor];
            playTimeLabel.font = [UIFont systemFontOfSize:10];
            playTimeLabel.textAlignment = NSTextAlignmentCenter;
            playTimeLabel.frame = CGRectMake(_photoImg.frame.size.width/2 - _photoImg.frame.size.width/3/2,playImg.frame.origin.y+ playImg.frame.size.height +2 , _photoImg.frame.size.width/3,  20);
            [_photoImg addSubview:playTimeLabel];
            
            [UIView animateWithDuration:0.5 animations:^{
                self->_photoImg.alpha = 1;
            } completion:nil];
            
            height = 70;
            if (height < _headBtn.frame.size.height) {
                height = _headBtn.frame.size.height;
            }
            [_timeLabel setFrame:CGRectMake(_photoImg.frame.origin.x + _photoImg.frame.size.width +10, 20, 40, 20)];
        }
        return height;
    }else{
        float height = 0.0;
        if (postStatus == 0) {
            _headBtn.hidden = YES;
            
            [_msgTextView setFrame:CGRectMake(0, 20, 200, 20)];
            _msgTextView.text = str;
            _msgTextView.backgroundColor =[UIColor whiteColor];
            _msgTextView.scrollEnabled = NO;
            _msgTextView.editable = NO;
            CGRect frame = _msgTextView.frame;
            CGSize textViewSize = [self heightForString:str andWidth:KScreenWidth - 20 :_msgTextView];
            height = textViewSize.height + 16.0;
            float width = textViewSize.width + 16.0;
            
            
            frame.size.height = height;
            frame.size.width = width;
            frame.origin.x = KScreenWidth - width - 10;
            _msgTextView.frame = frame;
            
            [UIView animateWithDuration:0.5 animations:^{
                self->_msgTextView.alpha = 1;
            } completion:nil];
            
            //判斷換行
            if (width > KScreenWidth * 0.8) {
                [_timeLabel setFrame:CGRectMake(KScreenWidth - 40, height + 20, 40, 20)];
                height = height + 20;
            }else{
                [_timeLabel setFrame:CGRectMake(_msgTextView.frame.origin.x -50, 20, 40, height)];
            }
        }else if (postStatus == 1){
            __block CGFloat topicViewHeight = .0f;
            __block float cellHeight = 0.0;
            [_photoImg sd_setImageWithURL:[NSURL URLWithString:str]
                         placeholderImage:[UIImage imageNamed:@"dialog_camera"]
                                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL){
                                    
                                    if (image == nil) {
                                        image = [UIImage imageNamed:@"dialog_camera"];
                                    }
                                    self->_photoImg.image = image;
                                    //显示高度
                                    CGFloat height =.0f;
                                    height = image.size.height * (KScreenWidth - 20) / image.size.width;
                                    
                                    self->_photoImg.frame = CGRectMake(10, topicViewHeight +5, KScreenWidth - 20, height);
                                    
                                    topicViewHeight += height;
                                    topicViewHeight = topicViewHeight*(70/KScreenWidth);
                                    cellHeight = topicViewHeight;
                                    
                                    if (self.changeCellHeight) {
                                        self.changeCellHeight();
                                    }
                                    
                                }];
            DLog(@"cellHeight:%f",cellHeight);
            height = cellHeight;
      
            [_bgView setFrame:CGRectMake(KScreenWidth - 70 -20, 10, 70+10, topicViewHeight+10)];
            [_photoImg setFrame:CGRectMake(KScreenWidth - 70 -15, 15, 70, topicViewHeight)];
            [_timeLabel setFrame:CGRectMake(_bgView.frame.origin.x -40, 20, 40, 20)];
            
            [UIView animateWithDuration:0.5 animations:^{
                self->_bgView.alpha = 1;
                self->_photoImg.alpha = 1;
            } completion:nil];
            
        }else{
    
            [_photoImg setFrame:CGRectMake(KScreenWidth - 70 - 10, 15, 70, 70)];
            [_photoImg sd_setImageWithURL:[NSURL URLWithString:str]
                         placeholderImage:[UIImage imageNamed:@"dialog_camera"]
                                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL){
                                    
                                    if (image == nil) {
                                        image = [UIImage imageNamed:@"dialog_camera"];
                                    }
                                    self->_photoImg.image = image;
                                    
                                    if (self.changeCellHeight) {
                                        self.changeCellHeight();
                                    }
                                    
                                }];
            
            
            UIVisualEffectView *lightView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
            lightView.frame = CGRectMake(0, 0, _photoImg.frame.size.width, _photoImg.frame.size.height);
            lightView.layer.cornerRadius = 5;
            lightView.alpha = 0.99;
            [_photoImg addSubview:lightView];
            
            
            UIImageView * playImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dialog_video"]];
            playImg.frame = CGRectMake(_photoImg.frame.size.width/2 - _photoImg.frame.size.width/3/2, _photoImg.frame.size.height/2 - _photoImg.frame.size.height/3/2 -5, _photoImg.frame.size.width/3,  _photoImg.frame.size.width/3);
            [_photoImg addSubview:playImg];
            
            UILabel * playTimeLabel = [[UILabel alloc] init];
            playTimeLabel.text = @"30秒";
            playTimeLabel.textColor = [UIColor whiteColor];
            playTimeLabel.font = [UIFont systemFontOfSize:10];
            playTimeLabel.textAlignment = NSTextAlignmentCenter;
            playTimeLabel.frame = CGRectMake(_photoImg.frame.size.width/2 - _photoImg.frame.size.width/3/2,playImg.frame.origin.y+ playImg.frame.size.height +2 , _photoImg.frame.size.width/3,  20);
            [_photoImg addSubview:playTimeLabel];
            
            [UIView animateWithDuration:0.5 animations:^{
                self->_photoImg.alpha = 1;
            } completion:nil];
            
            height = 70;
            if (height < _headBtn.frame.size.height) {
                height = _headBtn.frame.size.height;
            }
            [_timeLabel setFrame:CGRectMake(_photoImg.frame.origin.x -40, 20, 40, 20)];
    
        }

        return height;
    }
    
    
    
}
@end
