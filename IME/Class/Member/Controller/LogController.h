//
//  LogController.h
//  IME
//
//  Created by apple on 2018/12/22.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogView.h"
@interface LogController : UIViewController<LogViewDelegate>{
    LogView * _logView;
}

@end
