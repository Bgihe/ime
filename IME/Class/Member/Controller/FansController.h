//
//  FansController.h
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FansView.h"
@interface FansController : UIViewController<FansViewDelegate>{
    FansView * _fansView;
}
@property long btnTag;
@end
