//
//  FansController.h
//  IME
//
//  Created by apple on 2018/12/12.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FansView.h"
#import "SpotLightView.h"
#import "ReportView.h"
@interface FansController : UIViewController<FansViewDelegate,SpotLightViewDelegate,ReportViewDelegate>{
    FansView * _fansView;
    ReportView * _reportView;
    SpotLightView * _spotLightView;
    NSString * _fansNo;
    NSMutableArray * _fansData;
    BOOL _isLoadTableView;
    BOOL _hasTrace;
}
@property long btnTag;
@end
