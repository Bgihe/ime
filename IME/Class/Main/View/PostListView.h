//
//  PostListView.h
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberPostCell.h"
NS_ASSUME_NONNULL_BEGIN
@class PostListView;

@protocol PostListViewDelegate
-(void)addPostView;
@end
@interface PostListView : UIView<MemberPostCellDelegate>
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (nonatomic, weak) id<PostListViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
