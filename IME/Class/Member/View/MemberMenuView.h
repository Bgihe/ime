//
//  MemberMenuView.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MemberMenuView;

@protocol MemberMenuViewDelegate
- (void)presentController :(NSString*) cellTitle;
- (void)addController;
@end
@interface MemberMenuView : UIView
@property (nonatomic, strong) IBOutlet UIView *view;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (nonatomic, strong) NSMutableArray   *iconArr;
@property (nonatomic, assign) int              credits;
@property (nonatomic, weak) id<MemberMenuViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
