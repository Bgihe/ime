//
//  MessageListView.m
//  IME
//
//  Created by apple on 2018/12/27.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MessageListView.h"

@implementation MessageListView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
      
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

    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"MessageListView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// tableview cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.height/8;//tableView.frame.size.height/8
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    //----Setting_soundslider_TableViewCell
    
    MassMessageCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.delegate = self;
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MassMessageCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[MassMessageCell class]]) {
                cell = (MassMessageCell *)view;
            }
        }
    }

    cell.postStatusImg.hidden = YES;
    cell.postStatusView.hidden = YES;
    cell.daimondImg.hidden = YES;
    cell.countdownImg.hidden = YES;
    cell.delegate = self;
    cell.rightLabel.textColor = [UIColor grayColor];
    cell.rightLabel.text = @"2018-12-22";
    cell.titleLabel.text = @"這是聊天訊息";
    cell.msgBtn.hidden = NO;
    [cell.headImgBtn addTarget:self action:@selector(clickHeadImgBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
- (IBAction)clickHeadImgBtn:(id)sender {
    [_delegate pushSpotLightController];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [_delegate pushMessageController];
}

@end
