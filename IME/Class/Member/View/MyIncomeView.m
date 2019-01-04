//
//  MyIncomeView.m
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import "MyIncomeView.h"
#import "IncomeCell.h"
#import "IncomeHeader.h"
@implementation MyIncomeView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        _dataArr = [[NSMutableArray alloc] init];
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];
       
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // Initialization code
        [_collectionView registerNib:[UINib nibWithNibName:@"IncomeCell" bundle:nil] forCellWithReuseIdentifier:@"IncomeCell"];
        
        //----

        //注册cell单元格
        //[_collectionView registerNib:[UINib nibWithNibName:@"ConstomCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
        //注册头视图
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"hederview"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
    
        
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"MyIncomeView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}
// 返回cell的尺寸大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    return CGSizeMake( _collectionView.frame.size.width/2-10, _collectionView.frame.size.height/4.5);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_dataArr count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    IncomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"IncomeCell" forIndexPath:indexPath];
    
    
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"群發";
        cell.quantityLabel.text = @"影片 0 /照片 0";
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"影片0/ 照片1"];
        NSRange range1 = [[str string] rangeOfString:@"0"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range1];
        NSRange range2 = [[str string] rangeOfString:@"/"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:range2];
        NSRange range3 = [[str string] rangeOfString:@"照片"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range3];
        NSRange range4 = [[str string] rangeOfString:@"1"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range4];
        cell.quantityLabel.attributedText = str;
        
    }else if(indexPath.row == 1){
        cell.titleLabel.text = @"回覆";
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"0人/ 1則"];
        NSRange range1 = [[str string] rangeOfString:@"0"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range1];
        NSRange range2 = [[str string] rangeOfString:@"人/"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range2];
        NSRange range3 = [[str string] rangeOfString:@"1"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range3];
        NSRange range4 = [[str string] rangeOfString:@"則"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range4];
        cell.quantityLabel.attributedText = str;
    
    }else{
        cell.titleLabel.text = @"通話";
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"通話時數0秒"];
        NSRange range1 = [[str string] rangeOfString:@"0"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range1];
        NSRange range2 = [[str string] rangeOfString:@"秒"];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range2];
  
        cell.quantityLabel.attributedText = str;
    }
    

    cell.layer.cornerRadius = 5;
    return cell;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(kScreenWidth, kScreenHeight*0.15);
}

///尾部高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"hederview" forIndexPath:indexPath];
        IncomeHeader * incomeHeader = [[IncomeHeader alloc] initWithFrame:CGRectMake(0, 0, _collectionView.frame.size.width, kScreenHeight*0.15-10)];
        [header addSubview:incomeHeader];
        return header;
    }else{
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor redColor];
        return footerView;
    }
}


@end
