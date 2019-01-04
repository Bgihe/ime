//
//  DiamondListView.h
//  IME
//
//  Created by apple on 2018/12/20.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DiamondListView;

@protocol DiamondListViewDelegate
- (void) clickListCell :(long) indexPath;
- (void) clickHeadBtn :(int) userId;
@end
@interface DiamondListView : UIView
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) id<DiamondListViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@end
