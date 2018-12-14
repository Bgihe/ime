//
//  SettingController.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingController : UIViewController<SettingViewDelegate>{
    SettingView * _settingView;

}

@end

NS_ASSUME_NONNULL_END
