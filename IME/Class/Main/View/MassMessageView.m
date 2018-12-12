//
//  MassMessageView.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MassMessageView.h"
 
#define     VIEW_WIDTH      [UIScreen mainScreen].bounds.size.width
#define     VIEW_HEIGHT     [UIScreen mainScreen].bounds.size.height
@implementation MassMessageView

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
        [_dataArr addObject:@"4"];
        [_dataArr addObject:@"5"];
        
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"MassMessageView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_dataArr count];
}

// tableview cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenHeight = screenSize.height;
    
    
    
    return VIEW_HEIGHT/8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return 10;
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    //----Setting_soundslider_TableViewCell
    
    MassMessageCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MassMessageCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[MassMessageCell class]]) {
                cell = (MassMessageCell *)view;
            }
        }
    }
    cell.delegate = self;
 
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    [_delegate addChild];
}

@end
