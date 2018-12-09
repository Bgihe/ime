//
//  MemberMenuView.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MemberMenuView.h"
#import "MemberMenuCell.h"
@implementation MemberMenuView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        _dataArr =[[NSMutableArray alloc] init];
        [_dataArr addObject:@"回覆/通話設定"];
        [_dataArr addObject:@"我的收益"];
        [_dataArr addObject:@"我的鑽石"];
        [_dataArr addObject:@"使用紀錄"];
        [_dataArr addObject:@"邀請好友"];
        [_dataArr addObject:@"設定"];
        
        _iconArr = [[NSMutableArray alloc] init];
        [_iconArr addObject:@"person_list_call"];
        [_iconArr addObject:@"person_list_daimond"];
        [_iconArr addObject:@"person_list_income"];
        [_iconArr addObject:@"person_list_invite"];
        [_iconArr addObject:@"person_list_record"];
        [_iconArr addObject:@"person_list_setting"];
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"MemberMenuView" owner:self options:nil];
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
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenHeight = screenSize.height;
    
    return self.view.frame.size.height/9;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  
//    static NSString *cellID = @"cell";
//    //通过标识符，在tableView的重用池中找到可用的Cell（在重用池内部其实是一个可变的集合）
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    //如果重用池中没有这个标识符对应的cell，则创建一个新的，并且设置标识符
//    if (!cell) {
//        //代码块内只做Cell样式的处理，不做数据设置
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellID];
//    }
//    //对Cell做数据设置
//    //[cell.textLabel setText:[_dataArr objectAtIndex:indexPath.row]];
//    [cell.detailTextLabel setText:[_dataArr objectAtIndex:indexPath.row]];
//    return cell;
    
    
    static NSString *CellIdentifier = @"Cell";
    //----Setting_soundslider_TableViewCell
    MemberMenuCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MemberMenuCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[MemberMenuCell class]]) {
                cell = (MemberMenuCell *)view;
            }
        }
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.leftLabel.text = [_dataArr objectAtIndex:indexPath.row];
    cell.leftIconImg.image = [UIImage imageNamed:[_iconArr objectAtIndex:indexPath.row]];
    
    if (indexPath.row == 1) {
        cell.rightLabel.text = @"今日收益 0 USD";
        cell.rightLabel.textColor = [UIColor orangeColor];
        cell.rightIconImg.hidden = YES;
    }else if(indexPath.row == 2){
        cell.rightLabel.text = @"17,532";
        cell.rightIconImg.image = [UIImage imageNamed:@"person_list_daimond"];
    }else{
        cell.rightLabel.hidden = YES;
        cell.rightIconImg.hidden = YES;
    }
    return cell;
}


@end
