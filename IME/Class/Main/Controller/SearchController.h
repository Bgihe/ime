//
//  SearchController.h
//  IME
//
//  Created by MAC on 2019/1/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchView.h"
@interface SearchController : UIViewController<SearchViewDelegate>{
    SearchView * _searchView;
    NSMutableArray * _traceArr;
}

@end
 
