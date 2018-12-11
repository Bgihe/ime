//
//  SearchAnchorView.h
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchAnchorCell.h"

NS_ASSUME_NONNULL_BEGIN
@class SearchAnchorView;

@protocol SearchAnchorViewDelegate
-(void) presentSpotLight;
@end
@interface SearchAnchorView : UIView<UITableViewDataSource,SearchAnchorCellDelegate>{
 
    
}
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) id<SearchAnchorViewDelegate> delegate;

-(void) voidTestThisA;
@end

NS_ASSUME_NONNULL_END
