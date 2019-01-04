//
//  DiamondRankController.h
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DiamondRankController;

@protocol DiamondRankControllerDelegate
- (void)pushViewController :(long)indexRow;
@end

@interface DiamondRankController : UIViewController{
}
@property (nonatomic, weak) id<DiamondRankControllerDelegate> delegate;
@end
