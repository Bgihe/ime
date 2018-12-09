//
//  SearchAnchorView.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SearchAnchorView.h"
#import "PhotoCollectionViewCell.h"

#define     VIEW_WIDTH      [UIScreen mainScreen].bounds.size.width
#define     VIEW_HEIGHT     [UIScreen mainScreen].bounds.size.height
@implementation SearchAnchorView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
    
//        CGRect collectionViewFrame= CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, VIEW_HEIGHT*0.3);
//
//        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//        // 设置UICollectionView为横向滚动
//        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        // 每一行cell之间的间距
//        flowLayout.minimumLineSpacing = 20;
//        // 每一列cell之间的间距
//        // flowLayout.minimumInteritemSpacing = 10;
//        // 设置第一个cell和最后一个cell,与父控件之间的间距
//        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
////
////        //    flowLayout.minimumLineSpacing = 1;// 根据需要编写
////        //    flowLayout.minimumInteritemSpacing = 1;// 根据需要编写
////        //    flowLayout.itemSize = CGSizeMake(70, 70);// 该行代码就算不写,item也会有默认尺寸
//        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:collectionViewFrame collectionViewLayout:flowLayout];
//        //collectionView.backgroundColor = [UIColor redColor];
//        collectionView.dataSource = self;
//        collectionView.delegate = self;
//        _collectionView = collectionView;
//        [self.view addSubview:collectionView];
//
//        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//
        
        [self.collectionView registerNib:[UINib nibWithNibName:@"PhotoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PhotoCollectionViewCell"];
  
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"SearchAnchorView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
//// 返回cell的尺寸大小
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//    return CGSizeMake(VIEW_WIDTH*0.4, VIEW_HEIGHT*0.3-10);      // 让每个cell尺寸都不一样
//}
//
////// 返回Header的尺寸大小
////- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
////
////    return CGSizeMake(VIEW_WIDTH, 33);
////}
//
//// 返回Section个数
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//
//    return 2;
//}
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//
//    return 5;
//}
//// 返回cell之间行间隙
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//
//    return 10;
//}
//// 返回cell之间列间隙
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//
//    return 20;
//}
//
//- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    /*
//    UICollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    if (!cell ) {
//        NSLog(@"cell为空,创建cell");
//        cell = [[UICollectionViewCell alloc] init];
//    }
//    cell.backgroundColor = [UIColor yellowColor];
//    return cell;*/
//
//    //透過dequeueReusableCellWithReuseIdentifier:forIndexPath:訊息，
//    //將預先設計的cell樣本拿出來使用，
//    //其Identifier為cell1的樣本
////    UICollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
////    if (!cell ) {
////        NSLog(@"cell为空,创建cell");
////        cell = [[UICollectionViewCell alloc] init];
////    }
////    cell.backgroundColor = [UIColor yellowColor];
////    return cell;
//
//
//    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCollectionViewCell" forIndexPath:indexPath];
//    if (!cell ) {
//        NSLog(@"cell为空,创建cell");
//        cell = [[PhotoCollectionViewCell alloc] init];
//    }
//    //testLabel
//
//    // 设置cell
//    if (indexPath.section == 0) {
//        cell.backgroundColor = [UIColor purpleColor];
//    }else {
//        cell.backgroundColor = [UIColor darkGrayColor];
//    }
//
//
//    return cell;
//}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(VIEW_WIDTH*0.4, VIEW_HEIGHT*0.3-20);      // 让每个cell尺寸都不一样
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (PhotoCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCollectionViewCell" forIndexPath:indexPath];
   
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    NSArray *views = [cell.contentView subviews];
    UILabel *label = [views objectAtIndex:0];
    NSLog(@"Select %@",label.text);
}
@end
