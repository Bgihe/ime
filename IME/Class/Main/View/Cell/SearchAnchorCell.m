//
//  SearchAnchorCell.m
//  IME
//
//  Created by apple on 2018/12/10.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SearchAnchorCell.h"

#define     VIEW_WIDTH      [UIScreen mainScreen].bounds.size.width
#define     VIEW_HEIGHT     [UIScreen mainScreen].bounds.size.height
@implementation SearchAnchorCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // These two are very important.
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    _nameStr = [[NSString alloc] init];
    // Initialization code
    [self.collectionView registerNib:[UINib nibWithNibName:@"PhotoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PhotoCollectionViewCell"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


//this method is used to set the data , call it in cell for row at index path in table view implementation.
- (void)setColletionData:(NSArray *)collectionData :(BOOL) isVertical
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    if (isVertical) {
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _cellHeight = CGSizeMake(VIEW_WIDTH*0.5-5, VIEW_HEIGHT/3);
    }else{
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _cellHeight = CGSizeMake(VIEW_WIDTH*0.45-5, VIEW_HEIGHT/3);
    }
    [_collectionView setCollectionViewLayout:flowLayout];
    
    
    self.mycollectionData = collectionData;
    [self.collectionView reloadData];
}
// 返回cell的尺寸大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return _cellHeight;
    //CGSizeMake(VIEW_WIDTH*0.4, VIEW_HEIGHT*0.3-10);      // 让每个cell尺寸都不一样
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%lu", (unsigned long)self.mycollectionData.count);
    
    return [self.mycollectionData count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cvcell" forIndexPath:indexPath];
//    return ccell;
  
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCollectionViewCell" forIndexPath:indexPath];
    cell.delegate = self;
  
    return cell;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
    [_delegate presentSpotLight:_dataArr :indexPath.row];

}

@end
