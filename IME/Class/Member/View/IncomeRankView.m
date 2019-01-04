//
//  IncomeRankView.m
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import "IncomeRankView.h"
#import "RankCell.h"
@implementation IncomeRankView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        _dataArr = [[NSMutableArray alloc] init];
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];

    
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"IncomeRankView" owner:self options:nil];
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
    //NSLog(@"%lu",(unsigned long)[_dataArr count]);
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
    cell.headBtn.hidden = YES;
    cell.msgBtn.hidden = YES;
    //cell.lightImg.hidden = YES;
    return cell;
}
@end
