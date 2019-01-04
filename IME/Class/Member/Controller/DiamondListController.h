//
//  DiamondListController.h
//  IME
//
//  Created by apple on 2018/12/20.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiamondListView.h"
@class DiamondListController;

@protocol DiamondListControllerDelegate
-(void)pushSpotLightController;
@end
@interface DiamondListController : UIViewController<DiamondListViewDelegate>{
    DiamondListView * _diamondListView;
}
@property (nonatomic, weak) id<DiamondListControllerDelegate> delegate;
@end
