//
//  FansView.m
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import "FansView.h"
#import "FansCell.h"

@implementation FansView

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
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"FansView" owner:self options:nil];
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
    return tableView.frame.size.height/10.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    //----Setting_soundslider_TableViewCell
    FansCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"FansCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[FansCell class]]) {
                cell = (FansCell *)view;
            }
        }
    }
    if (_btnTag == 300) {
        cell.followBtn.hidden = YES;
    }else{
        cell.followBtn.hidden = NO;
    }
    [cell.followBtn addTarget:self action:@selector(followBtClicked:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [_delegate pushSpotLightView];
}

- (void)followBtClicked:(UIButton*)sender{
    NSLog(@"work!");
    //[sender setImage:[UIImage imageNamed:@"followed.png"] forState:UIControlStateNormal];
    //sender.backgroundColor = [UIColor grayColor];
    [sender setTitle:@"+追蹤" forState:UIControlStateNormal];
}
@end
