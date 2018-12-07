//
//  SearchAnchorController.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchAnchorView.h"
NS_ASSUME_NONNULL_BEGIN

@interface SearchAnchorController : UIViewController<SearchAnchorViewDelegate>{
    SearchAnchorView * _searchAnchorView;
}

@end

NS_ASSUME_NONNULL_END
