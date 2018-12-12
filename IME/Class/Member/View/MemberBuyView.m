//
//  MemberBuyView.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MemberBuyView.h"
#import "MemberPostCell.h"
@implementation MemberBuyView


- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        _dataArr = [[NSMutableArray alloc] init];
        [_dataArr addObject:@"1"];
        [_dataArr addObject:@"2"];
        [_dataArr addObject:@"3"];
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"MemberBuyView" owner:self options:nil];
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
    cell.lightImg.hidden = YES;
    return cell;
}
@end
