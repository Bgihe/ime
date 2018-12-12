//
//  PostListView.m
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import "PostListView.h"
#define     VIEW_WIDTH      [UIScreen mainScreen].bounds.size.width
#define     VIEW_HEIGHT     [UIScreen mainScreen].bounds.size.height
@implementation PostListView
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
    [[NSBundle mainBundle] loadNibNamed:@"PostListView" owner:self options:nil];
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
    
    return tableView.frame.size.height/9;
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
    
    MemberPostCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MemberPostCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[MemberPostCell class]]) {
                cell = (MemberPostCell *)view;
            }
        }
    }
    cell.delegate = self;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSLog(@"success");
    [_delegate addPostView];
}

@end
