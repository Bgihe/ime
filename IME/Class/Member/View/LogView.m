//
//  LogView.m
//  IME
//
//  Created by apple on 2018/12/22.
//  Copyright © 2018 apple. All rights reserved.
//

#import "LogView.h"
#import "DepositLogCell.h"
@implementation LogView
 
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"LogView" owner:self options:nil];
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
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle
                                      reuseIdentifier: CellIdentifier];
    }

    UILabel * rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    rightLabel.text = [NSNumberFormatter localizedStringFromNumber:@([[[_dataArr objectAtIndex:indexPath.row]valueForKey:@"credits"] intValue])
                                                       numberStyle:NSNumberFormatterDecimalStyle];
    rightLabel.textAlignment = NSTextAlignmentRight;
    rightLabel.textColor = [UIColor colorWithRed:133.0/255.0 green:216.0/255.0 blue:215.0/255.0 alpha:1];
   
    cell.accessoryView = rightLabel;
    cell.textLabel.text = [[_dataArr objectAtIndex:indexPath.row]valueForKey:@"note"];
    cell.detailTextLabel.text = [[_dataArr objectAtIndex:indexPath.row]valueForKey:@"log_time"];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    
    return cell;
    
    /*
    static NSString *CellIdentifier = @"Cell";
    //----Setting_soundslider_TableViewCell
    DepositLogCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"DepositLogCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[DepositLogCell class]]) {
                cell = (DepositLogCell *)view;
            }
        }
    }
    
    cell.dateLabel.text          = [[_dataArr objectAtIndex:0] objectAtIndex:indexPath.row];
    cell.payMentLabel.text       = [[_dataArr objectAtIndex:1] objectAtIndex:indexPath.row];
    cell.amountLabel.text        = [[_dataArr objectAtIndex:2] objectAtIndex:indexPath.row];
    cell.daimondAmountLabel.text = [[_dataArr objectAtIndex:3] objectAtIndex:indexPath.row];
    cell.statusLabel.text        = [[_dataArr objectAtIndex:4] objectAtIndex:indexPath.row];
    
    return cell;*/
}
@end
