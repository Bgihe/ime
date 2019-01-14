//
//  FansView.h
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FansView;

@protocol FansViewDelegate
- (void) addSpotLightView : (NSMutableArray *) userData ;
- (void) removeTrace : (NSString*) memberNo;
- (void) addTrace : (NSString*) memberNo;
@end

@interface FansView : UIView
@property (nonatomic, strong) IBOutlet UIView *view;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (nonatomic, weak) id<FansViewDelegate> delegate;
@property long btnTag;
@end
