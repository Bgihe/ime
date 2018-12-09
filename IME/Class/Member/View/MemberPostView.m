//
//  MemberPostView.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MemberPostView.h"
#import "MemberPostCell.h"
@implementation MemberPostView

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
        [_dataArr addObject:@""];
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"MemberPostView" owner:self options:nil];
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
    
    return self.view.frame.size.height/5;
    
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
    MemberPostCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MemberPostCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[MemberPostCell class]]) {
                cell = (MemberPostCell *)view;
            }
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        cell.headImg.backgroundColor = [UIColor whiteColor];
        cell.headImg.contentMode=UIViewContentModeScaleAspectFill;
        cell.headImg.layer.cornerRadius = CGRectGetHeight(cell.headImg.frame)/2;
        cell.headImg.clipsToBounds = YES;
        cell.headImg.backgroundColor = [UIColor whiteColor];
        cell.headImg.layer.borderWidth = 3;
        cell.headImg.layer.borderColor = [UIColor whiteColor].CGColor;
        cell.headImg.contentMode=UIViewContentModeScaleAspectFill;
        cell.headImg.layer.masksToBounds = YES;
 
//        // WARNING: is the cell still using the same data by this point??
//
//        cell.headImg.backgroundColor = [UIColor whiteColor];
//        cell.headImg.contentMode=UIViewContentModeScaleAspectFill;
//        cell.headImg.layer.cornerRadius = CGRectGetHeight(cell.headImg.frame)/2;
//        cell.headImg.clipsToBounds = YES;
        
    });
    return cell;
}
@end
