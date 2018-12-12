//
//  MemberFavoriteView.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MemberFavoriteView;

@protocol MemberFavoriteViewDelegate

@end
@interface MemberFavoriteView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) id<MemberFavoriteViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
