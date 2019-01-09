//
//  MessageView.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MessageView.h"

@implementation MessageView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        
        cellHight = 0;
        _tableView.separatorStyle = NO;
//        //_tableView.allowsSelection = YES;
//        _tableView.allowsSelection = NO;
        
        _tableView.userInteractionEnabled = YES;
        _tableView.allowsSelection = YES;
        
        
       // [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        
        _dataArr = [[NSMutableArray alloc] init];
        [_dataArr addObject:@"中文"];
        [_dataArr addObject:@"中文中文"];
        [_dataArr addObject:@"中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文中文中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文中文中文中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文文中文中文中文中文中中文中文中文文中文中文中文中文中中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文文中文中文中文中文中中文中文中文中文中文中文中文中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文文中文中文中文中文中中文中文中文中文中文中文中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文中文中文中文中文中文文中文中文中文中文中中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文中文"];
        [_dataArr addObject:@"中文中文中文中文中文文文中文中文中文中文中中文中文中文中文中中文中文中文中文"];
    
        _testImgArr = [[NSMutableArray alloc] init];
        [_testImgArr addObject:@"https://i.ytimg.com/vi/M-CBulIEzss/maxresdefault.jpg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*zfGXokjS3fyx54cFyRgGMw.jpeg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*sz29HspR-iBdkZZmAGS9cA.jpeg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*lDPNbXb8fdWRvHobBR5UZw.jpeg"];
        [_testImgArr addObject:@"https://i.ytimg.com/vi/M-CBulIEzss/maxresdefault.jpg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*zfGXokjS3fyx54cFyRgGMw.jpeg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*sz29HspR-iBdkZZmAGS9cA.jpeg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*lDPNbXb8fdWRvHobBR5UZw.jpeg"];
        [_testImgArr addObject:@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3ahIW-5H0WbN4duuteK4_DcHvDFqhekDhiG4tNLdEKBfs17Nm"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*zfGXokjS3fyx54cFyRgGMw.jpeg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*sz29HspR-iBdkZZmAGS9cA.jpeg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*lDPNbXb8fdWRvHobBR5UZw.jpeg"];
        [_testImgArr addObject:@"https://www.penghu-nsa.gov.tw/FileDownload/Album/Big/20161012162551758864338.jpg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*zfGXokjS3fyx54cFyRgGMw.jpeg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*sz29HspR-iBdkZZmAGS9cA.jpeg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*lDPNbXb8fdWRvHobBR5UZw.jpeg"];
        [_testImgArr addObject:@"https://www.penghu-nsa.gov.tw/FileDownload/Album/Big/20161012162551758864338.jpg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*zfGXokjS3fyx54cFyRgGMw.jpeg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*sz29HspR-iBdkZZmAGS9cA.jpeg"];
        [_testImgArr addObject:@"https://cdn-images-1.medium.com/max/1600/1*lDPNbXb8fdWRvHobBR5UZw.jpeg"];
        
        _cellHightArr = [[NSMutableArray alloc] init];
      
        _testStatusArr = [[NSMutableArray alloc] init];
        [_testStatusArr addObject:@"2"];
        [_testStatusArr addObject:@"1"];
        [_testStatusArr addObject:@"0"];
        [_testStatusArr addObject:@"0"];
        [_testStatusArr addObject:@"2"];
        [_testStatusArr addObject:@"0"];
        [_testStatusArr addObject:@"1"];
        [_testStatusArr addObject:@"2"];
        [_testStatusArr addObject:@"0"];
        [_testStatusArr addObject:@"0"];
        [_testStatusArr addObject:@"1"];
        [_testStatusArr addObject:@"2"];
        [_testStatusArr addObject:@"0"];
        [_testStatusArr addObject:@"1"];
        [_testStatusArr addObject:@"0"];
        [_testStatusArr addObject:@"0"];
        [_testStatusArr addObject:@"2"];
        [_testStatusArr addObject:@"0"];
        [_testStatusArr addObject:@"1"];
        [_testStatusArr addObject:@"0"];
        
        _testMeArr = [[NSMutableArray alloc] init];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"1"];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"1"];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"1"];
        [_testMeArr addObject:@"1"];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"1"];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"1"];
        [_testMeArr addObject:@"0"];
        [_testMeArr addObject:@"1"];
 
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_msgTextView.contentMode=UIViewContentModeScaleAspectFill;
            self->_msgTextView.layer.cornerRadius = CGRectGetHeight(self->_msgTextView.frame)/2;
            self->_msgTextView.clipsToBounds = YES;
            self->_msgTextView.layer.borderWidth = 1;
            self->_msgTextView.layer.borderColor = [UIColor colorWithRed:32.0/255.0 green:125.0/255.0 blue:160.0/255.0 alpha:1].CGColor;
            self->_msgTextView.contentMode=UIViewContentModeScaleAspectFill;
            self->_msgTextView.layer.masksToBounds = YES;
        });
        _msgTextView.textContainerInset = UIEdgeInsetsMake(5, 10, 20, 0);
        
        //[self scrollToBottomAnimated:NO];
        
        
    }
    
  
    return self;
}



- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"MessageView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(void) reloadSendViewUI :(float) keyboardHeight{
    
    CGFloat bottomPadding = 0;
    if (keyboardHeight == 0) {
        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIApplication.sharedApplication.keyWindow;
            bottomPadding = window.safeAreaInsets.bottom;
            DLog(@"%f",bottomPadding);
        }
        _takePhotoBtn.hidden = NO;
        _sendBtn.hidden = YES;
        
        _takePhotoBtn.alpha = 1;
        _sendBtn.alpha = 0;
     
    }else{
        _takePhotoBtn.hidden = YES;
        _sendBtn.hidden = NO;
        
        _takePhotoBtn.alpha = 0;
        _sendBtn.alpha = 1;
    }
    
    
    CGRect sendViewRect            = _sendView.frame;
    sendViewRect.origin.y          = self.view.frame.size.height - sendViewRect.size.height - keyboardHeight - bottomPadding ;
    self->_sendView.frame = sendViewRect;
    
    CGRect tableViewRect           = _tableView.frame;
    tableViewRect.size.height      = self.view.frame.size.height - _sendView.frame.size.height - keyboardHeight - bottomPadding;
    self->_tableView.frame = tableViewRect;
    
    NSIndexPath *indexPath10 = [NSIndexPath indexPathForRow:19 inSection:0];
    [_tableView scrollToRowAtIndexPath:indexPath10
                                  atScrollPosition:UITableViewScrollPositionBottom
                                          animated:NO];
    /*
    [UIView animateWithDuration:0.01 animations:^{
        self->_sendView.frame = rect;
    }];*/
    
}
-(void) reloadCellHight : (float) hight{
    cellHight = hight;
}
// tableview cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    //return tableView.frame.size.height/3;//tableView.frame.size.height/8
    //_cellHightArr
    
    
    NSLog(@"%ld",(long)indexPath.row);
    NSLog(@"%ld",(long)[_cellHightArr count]);
    
    /*
    if ([_cellHightArr count] > indexPath.row) {
        //[_cellHightArr replaceObjectAtIndex:indexPath.row withObject:[[NSString alloc]initWithFormat:@"%f",cellHight]];
        return [[_cellHightArr objectAtIndex:indexPath.row] floatValue] +30;
    }else{
        [_cellHightArr addObject:[[NSString alloc]initWithFormat:@"%d",30]];
        return 30 +30;
    }*/
    
    /*
    if ([_cellHightArr count]-1 < indexPath.row) {
         return [[_cellHightArr objectAtIndex:indexPath.row] floatValue] +30;
    }else{
         return 30 +30;
    }
    */
    if ([_cellHightArr count]-1 < indexPath.row) {
        return 300+30;
    }else{
        return [[_cellHightArr objectAtIndex:indexPath.row] floatValue]+30;
    }
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";

    MessageCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MessageCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[MessageCell class]]) {
                cell = (MessageCell *)view;
            }
        }
    }
    
    cell.delegate = self;
    
    
    //0 msg /1 photo /2 video
    //cellHight = [cell updateMsgUI:YES :2 :[_testImgArr objectAtIndex:indexPath.row]]; //_dataArr
    cellHight = [cell updateMsgUI:[[_testMeArr objectAtIndex:indexPath.row]intValue] :[[_testStatusArr objectAtIndex:indexPath.row]intValue] :[_testImgArr objectAtIndex:indexPath.row]]; //_dataArr
    
    if ([_cellHightArr count] > indexPath.row) {
        [_cellHightArr replaceObjectAtIndex:indexPath.row withObject:[[NSString alloc]initWithFormat:@"%f",cellHight]];
    }else{
        [_cellHightArr addObject:[[NSString alloc]initWithFormat:@"%f",cellHight]];
    }
    
    cell.changeCellHeight = ^{
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    };
    cell.msgTextView.editable = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [_delegate pushMediaPlayerView];
}
@end
