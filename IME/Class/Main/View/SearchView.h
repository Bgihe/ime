//
//  SearchView.h
//  IME
//
//  Created by MAC on 2019/1/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchView;

@protocol SearchViewDelegate <UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
-(BOOL) traceCheck : (long)accountNo;
@end
@interface SearchView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, weak) id<SearchViewDelegate> delegate;

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IBOutlet UITableView *resultTableView;
@property (nonatomic, strong) IBOutlet UITableView *promoTableView;

@property (nonatomic, strong) NSMutableArray                *searchLogArr;
@property (nonatomic) IBOutlet UIView                       *searchLogView;
@property (nonatomic) IBOutlet UIView                       *searchResultView;
//Search Results
@end

