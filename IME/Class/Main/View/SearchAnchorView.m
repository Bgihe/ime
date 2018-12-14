//
//  SearchAnchorView.m
//  IME
//
//  Created by apple on 2018/12/7.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SearchAnchorView.h"

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

-(void) presentSpotLight :(NSMutableArray*) spotLightList :(int) row{
    [_delegate presentSpotLight:spotLightList :row];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_dataArr count];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,tableView.bounds.size.width, 30)];
    //headerView.layer.cornerRadius = 8;
    [headerView setBackgroundColor:[UIColor whiteColor]];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30*0.6+15, 5, tableView.bounds.size.width - 10, 18)] ;
    NSString *header = [[NSString alloc] init];
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30*0.4/2, 30*0.6, 30*0.6)];
    
    
    
    switch (section) {
        case 0:
            header = @"紅人";
            imageView.image = [UIImage imageNamed:@"streamer_tag_hot2"];
            break;
        case 1:
            header = @"新星";
            imageView.image = [UIImage imageNamed:@"streamer_tag_choice2"];
            break;
        case 2:
            header = @"精選";
            imageView.image = [UIImage imageNamed:@"streamer_tag_hot2"];
            break;
        case 3:
            header = @"新人";
            imageView.image = [UIImage imageNamed:@"streamer_tag_choice2"];
            break;
        case 4:
            header = @"熱門";
            imageView.image = [UIImage imageNamed:@"streamer_tag_hot2"];
            break;
            
        default:
            header = @"更多";
            imageView.image = [UIImage imageNamed:@"streamer_tag_more2"];
            break;
    }
    [headerView addSubview:imageView];
    
    label.text = header;
    //label.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1];
    label.backgroundColor = [UIColor colorWithRed:(22/255.0) green:(73/255.0) blue:(77/255.0) alpha:0];
    [headerView addSubview:label];
    return headerView;

}



// tableview cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenHeight = screenSize.height;

    if (indexPath.section == 5) {
        float collectHeight = [[_dataArr objectAtIndex:indexPath.section] count];
        return (VIEW_HEIGHT/3+10)*ceil(collectHeight/2);
    }else{
        return VIEW_HEIGHT/3;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return 10;
    return 1;
}
 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    //----Setting_soundslider_TableViewCell
    
    SearchAnchorCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"SearchAnchorCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[SearchAnchorCell class]]) {
                cell = (SearchAnchorCell *)view;
            }
        }
    }
    cell.delegate = self;
    cell.nameStr = [[_dataArr objectAtIndex:indexPath.section]objectAtIndex: indexPath.row ];
    cell.dataArr = [_dataArr objectAtIndex:indexPath.section];

    if (indexPath.row == 0) {
        if (indexPath.section == 5) {
            [cell setColletionData:[_dataArr objectAtIndex:indexPath.section] :YES];
        }else{
            [cell setColletionData:[_dataArr objectAtIndex:indexPath.section] :NO];
        }
    }
    
    
    return cell;
}
//----
//
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//
//    return 2;
//}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//    return CGSizeMake(VIEW_WIDTH*0.4, VIEW_HEIGHT*0.3-20);      // 让每个cell尺寸都不一样
//}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return 20;
//}
//
//- (PhotoCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCollectionViewCell" forIndexPath:indexPath];
//   
//    return cell;
//}
//
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
//    NSArray *views = [cell.contentView subviews];
//    UILabel *label = [views objectAtIndex:0];
//    NSLog(@"Select %@",label.text);
//}
@end
