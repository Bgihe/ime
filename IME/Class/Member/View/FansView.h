//
//  FansView.h
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FansView;

@protocol FansViewDelegate
- (void) addSpotLightView : (NSMutableArray *) userData ;
@end

@interface FansView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (nonatomic, weak) id<FansViewDelegate> delegate;
@property long btnTag;
@end

NS_ASSUME_NONNULL_END
