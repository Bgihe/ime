//
//  SearchAnchorCell.h
//  IME
//
//  Created by apple on 2018/12/10.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@class SearchAnchorCell;

@protocol SearchAnchorCellDelegate<NSObject>
-(void) presentSpotLight :(NSMutableArray*) spotLightList :(int) row;
@end


@interface SearchAnchorCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,PhotoCollectionViewCellDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonnull,nonatomic) NSArray *mycollectionData;
@property CGSize cellHeight;
@property (nonatomic, weak) id<SearchAnchorCellDelegate> delegate;
@property (strong, nonatomic) NSString * nameStr;

@property (strong, nonatomic) NSMutableArray * dataArr;
//CGSize c=CGSizeMake(width, height);

//- (void)setColletionData :(nonnull NSArray *)collectionData;
- (void)setColletionData:(NSArray *)collectionData :(BOOL) isVertical;
@end

NS_ASSUME_NONNULL_END
