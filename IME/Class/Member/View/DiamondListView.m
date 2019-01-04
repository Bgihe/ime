//
//  DiamondListView.m
//  IME
//
//  Created by apple on 2018/12/20.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DiamondListView.h"
#import "RankCell.h"
@implementation DiamondListView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        /*
        _dataArr = [[NSMutableArray alloc] init];
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];*/
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"DiamondListView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
#pragma mark - TableView Config
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//----改tableview header
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return 0;
}
//-----Header 高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArr count];
}


// tableview cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _tableView.frame.size.height/10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"Cell";
    //----Setting_soundslider_TableViewCell
    RankCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"RankCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[RankCell class]]) {
                cell = (RankCell *)view;
            }
        }
    }
    switch (indexPath.row) {
        case 0:
            [cell.rankBtn setBackgroundImage:[UIImage imageNamed:@"icon_rank1"] forState:UIControlStateNormal];
            break;
        case 1:
            [cell.rankBtn setBackgroundImage:[UIImage imageNamed:@"icon_rank2"] forState:UIControlStateNormal];
            break;
        case 2:
            [cell.rankBtn setBackgroundImage:[UIImage imageNamed:@"icon_rank3"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    [cell.rankBtn setTitle:[[NSString alloc]initWithFormat:@"%ld",(long)indexPath.row +1] forState:UIControlStateNormal];
    
    cell.lockLabel.hidden = YES;
    [cell.headBtn addTarget:self action:@selector(clickHeadBtn:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
   
   [_delegate clickListCell:indexPath.row];
}
- (void)clickHeadBtn:(UIButton*)sender{
     [_delegate clickHeadBtn:(int)sender.tag];
}
@end
