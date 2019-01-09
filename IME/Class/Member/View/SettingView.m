//
//  SettingView.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SettingView.h"
#import "SwitchCell.h"
#import "SingleButtonCell.h"
@implementation SettingView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];

        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        
        NSMutableArray * sectionA = [[NSMutableArray alloc] init];
        [sectionA addObject:@"顯示訊息內容"];
        [sectionA addObject:@"訊息通知"];
        [sectionA addObject:@"回覆通知"];
        [sectionA addObject:@"追蹤通知"];
        [sectionA addObject:@"探索頁喜好"];
        
        NSMutableArray * sectionB = [[NSMutableArray alloc] init];
        [sectionB addObject:@"封鎖好友"];
        [sectionB addObject:@"常見問題"];
        [sectionB addObject:@"聯繫客服"];
        [sectionB addObject:@"隱私權政策"];
        [sectionB addObject:@"服務條款"];
        [sectionB addObject:[[NSString alloc]initWithFormat:@"版本 %@",app_Version]];
        [sectionB addObject:@"登出"];
        _dataArr =[[NSMutableArray alloc] init];
        [_dataArr addObject:sectionA];
        [_dataArr addObject:sectionB];
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"SettingView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}

#pragma mark - TableView Config
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_dataArr count];
}

//-----Header 高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else{
        return 30;
    }
    
}
//----改tableview header
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,tableView.bounds.size.width, 30)];
    if (section) {
        //headerView.layer.cornerRadius = 8;
        [headerView setBackgroundColor:[UIColor colorWithRed:(212/255.0) green:(231/255.0) blue:(234/255.0) alpha:0]];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30*0.6+15, 5, tableView.bounds.size.width - 10, 18)] ;
        NSString *header = [[NSString alloc] init];
  

        switch (section) {
            case 0:
                header = @"紅人";
                break;
            case 1:
                header = @"";
                break;
            case 2:
                header = @"精選";
                break;
            case 3:
                header = @"新人";
                break;
            case 4:
                header = @"熱門";
                break;
                
            default:
                header = @"更多";
                break;
        }
        label.text = header;
        //label.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1];
        label.backgroundColor = [UIColor colorWithRed:(212/255.0) green:(231/255.0) blue:(234/255.0) alpha:0];
        [headerView addSubview:label];
    }

    return headerView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"%lu",(unsigned long)[_dataArr count]);
    return [[_dataArr objectAtIndex:section] count];
}


// tableview cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenHeight = screenSize.height;
    
    return tableView.frame.size.height/14;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //SingleButtonCell.h
    
    
    if (indexPath.section == 1 && indexPath.row == 6) {
        static NSString *CellIdentifier = @"Cell";
        SingleButtonCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell ==nil) {
            NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SingleButtonCell" owner:nil options:nil];
            for (UIView *view in views ) {
                if ([view isKindOfClass:[SingleButtonCell class]]) {
                    cell = (SingleButtonCell *)view;
                }
            }
        }
        
        [cell.centerBtn addTarget:self action:@selector(clickLogoutBtn:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else{
        static NSString *CellIdentifier = @"Cell";
        SwitchCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell ==nil) {
            NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SwitchCell" owner:nil options:nil];
            for (UIView *view in views ) {
                if ([view isKindOfClass:[SwitchCell class]]) {
                    cell = (SwitchCell *)view;
                }
            }
        }
        
        if (indexPath.section == 0) {
            if (indexPath.row == 4) {
                cell.rightSwitch.hidden = YES;
                cell.rightLabel.hidden = NO;
                cell.rightLabel.text = @"男";
            }
        }else{
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            cell.rightSwitch.hidden = YES;
        }
        cell.leftLabel.text = [[_dataArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
        return cell;
    }
    
}
- (IBAction)clickLogoutBtn:(UIButton *)sender {
    [_delegate memberLogout];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
   
}

@end
