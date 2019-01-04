//
//  DepositDetailView.m
//  IME
//
//  Created by apple on 2018/12/21.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DepositDetailView.h"
#import "DepositCell.h"
#import "DepositDetailCell.h"
@implementation DepositDetailView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
//        _dataArr = [[NSMutableArray alloc] init];
//        [_dataArr addObject:@""];
//        [_dataArr addObject:@""];
//        [_dataArr addObject:@""];
//        [_dataArr addObject:@""];
//        [_dataArr addObject:@""];
        _dataArr = [[NSArray alloc] init];
        _isConfirm = NO;
        
    }
    return self;
}
- (void)reloadAmountLabel{
    _daimondTopLabel.text = _diamond;
    _amountLabel.text = _amount;
    _daimondBottomLabel.text = _diamond;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"DepositDetailView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
- (void)showPaymentInfo{
    _payStatusLabel.text = @"付款資訊";
    _saveAmountView.hidden = YES;
    _confirmView.hidden = YES;

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
    if(_isConfirm){
        return [[_dataArr objectAtIndex:0]count];
    }else{
        return [_dataArr count];
    }
}


// tableview cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _tableView.frame.size.height/10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    DepositDetailCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"DepositDetailCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[DepositDetailCell class]]) {
                cell = (DepositDetailCell *)view;
            }
        }
    }
    if(_isConfirm){
        cell.leftLabel.text = [[_dataArr objectAtIndex:0] objectAtIndex:indexPath.row];
        cell.centerLabel.text = [[_dataArr objectAtIndex:1] objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{

        cell.leftLabel.text = [_dataArr objectAtIndex:indexPath.row];
        cell.centerLabel.hidden = YES;
    }
    
 
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!_isConfirm) {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    NSLog(@"%ld",(long)indexPath.row);
}


@end
