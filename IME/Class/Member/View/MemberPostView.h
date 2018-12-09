//
//  MemberPostView.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MemberPostView;

@protocol MemberPostViewDelegate

@end
@interface MemberPostView : UIView
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, weak) id<MemberPostViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
