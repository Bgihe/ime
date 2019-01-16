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
    
    if (!_isQuery) {
        //使用紀錄
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
    }else{
        //購買紀錄
        static NSString *CellIdentifier = @"Cell";
        DepositLogCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell ==nil) {
            NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"DepositLogCell" owner:nil options:nil];
            for (UIView *view in views ) {
                if ([view isKindOfClass:[DepositLogCell class]]) {
                    cell = (DepositLogCell *)view;
                }
            }
        }
        
        
        NSString * amount = [[NSString alloc] initWithString:[[_dataArr objectAtIndex:indexPath.row]valueForKey:@"amount"]];
        NSString * currency = [[NSString alloc] initWithString:[[_dataArr objectAtIndex:indexPath.row]valueForKey:@"currency"]];
        NSString * credits = [[NSString alloc] initWithString:[NSNumberFormatter localizedStringFromNumber:@([[[_dataArr objectAtIndex:indexPath.row]valueForKey:@"credits"] intValue])
                                                                                               numberStyle:NSNumberFormatterDecimalStyle]];
        NSString * state = [[NSString alloc] init];
        switch ([[[_dataArr objectAtIndex:indexPath.row]valueForKey:@"state"] intValue]) {
            case stateUnpaid:
                state = @"未付款";
                break;
            case statePaid:
                state = @"已付款";
                break;
            case statePayFail:
                state = @"付款失敗";
                break;
            case stateCancel:
                state = @"訂單取消";
                break;
            default:
                break;
        }
        NSString * payment = [[NSString alloc] init];
        
        NSLog(@"%@",[[_dataArr objectAtIndex:indexPath.row]valueForKey:@"payment"]);
        
        if ([[[_dataArr objectAtIndex:indexPath.row]valueForKey:@"payment"] isEqualToString:@"CVS"]) {
            payment = @"付款方式：超商代碼繳款";
        }else if ([[[_dataArr objectAtIndex:indexPath.row]valueForKey:@"payment"] isEqualToString:@"ATM"] ){
            payment = @"付款方式：自動櫃員機";
        }else if([[[_dataArr objectAtIndex:indexPath.row]valueForKey:@"payment"] isEqualToString:@"Credit"]){
            payment = @"付款方式：信用卡";
        }

        NSArray * partitionArr =[[[_dataArr objectAtIndex:indexPath.row]valueForKey:@"log_time"] componentsSeparatedByString:@" "];
        NSString * logTime = [[NSString alloc] initWithFormat:@"%@\n%@",[partitionArr objectAtIndex:0],[partitionArr objectAtIndex:1]];
 
        cell.logTimeLabel.text          = logTime;
        cell.paymentLabel.text          = payment;
        cell.amountLabel.text           = [[NSString alloc] initWithFormat:@"儲值金額：%@ %@",amount,currency];
        cell.creditsLabel.text          = credits;
        cell.stateLabel.text            = state;

        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //[_delegate presentController:[_dataArr objectAtIndex:indexPath.row]];
    [_delegate presentController:indexPath.row];
}

@end
