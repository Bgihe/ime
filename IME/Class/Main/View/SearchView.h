//
//  SearchView.h
//  IME
//
//  Created by MAC on 2019/1/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchView;

@protocol SearchViewDelegate

@end
@interface SearchView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, weak) id<SearchViewDelegate> delegate;
@end

