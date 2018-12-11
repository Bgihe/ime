//
//  SpotLightController.h
//  IME
//
//  Created by MAC on 2018/12/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpotLightView.h"
#import "ReportView.h"
NS_ASSUME_NONNULL_BEGIN

@interface SpotLightController : UIViewController<SpotLightViewDelegate,ReportViewDelegate>{
    SpotLightView * _spotLightView;
    ReportView * _reportView;
}
@property (strong, nonatomic) NSString * nameStr;
@end

NS_ASSUME_NONNULL_END
