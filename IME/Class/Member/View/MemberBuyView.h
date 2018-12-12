//
//  MemberBuyView.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MemberBuyView;

@protocol MemberBuyViewDelegate

@end
@interface MemberBuyView : UIView
@property (weak, nonatomic) IBOutlet UIButton *selectTimeBtn;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) id<MemberBuyViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
