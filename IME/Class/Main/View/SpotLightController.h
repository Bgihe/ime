//
//  SpotLightController.h
//  IME
//
//  Created by MAC on 2018/12/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpotLightView.h"
NS_ASSUME_NONNULL_BEGIN

@interface SpotLightController : UIViewController<SpotLightViewDelegate>{
    SpotLightView * _spotLightView;
}

@end

NS_ASSUME_NONNULL_END
