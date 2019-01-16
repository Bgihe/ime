//
//  SearchView.m
//  IME
//
//  Created by MAC on 2019/1/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "SearchView.h"
#import "SearchLogCell.h"
#import "MassMessageCell.h"
@implementation SearchView 
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        
        
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, KScreenWidth,20)];
        [self.view addSubview:scrollView];
        
        scrollView.contentSize = CGSizeMake(2500, 20);
        
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2000, 20)];
        view.backgroundColor = [UIColor redColor];
        [scrollView addSubview:view];

        //----搜尋紀錄View
        _searchLogView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, KScreenWidth, KScreenHeight*0.15)];
        _searchLogView.backgroundColor = [UIColor darkGrayColor];
        [self.view addSubview:_searchLogView];
        
        UIImageView * searchLogImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 10, 10)];
        searchLogImg.image = [UIImage imageNamed:@"icon_title"];
        [_searchLogView addSubview:searchLogImg];
        
        UILabel * searchLogLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(searchLogImg.frame)+10, 0, 100, 10)];
        searchLogLabel.text = @"搜尋紀錄";
        searchLogLabel.font = [UIFont systemFontOfSize:12];
        searchLogLabel.textColor = [UIColor lightGrayColor];
        [_searchLogView addSubview:searchLogLabel];
        
        UIButton * clearLogBtn = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth - 60, 0, 50, 10)];
        [clearLogBtn setTitle:@"清除" forState:UIControlStateNormal];
        clearLogBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [clearLogBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_searchLogView addSubview:clearLogBtn];

        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(clearLogBtn.frame)+10, KScreenWidth-20, _searchLogView.frame.size.height - CGRectGetMaxY(clearLogBtn.frame)-20) collectionViewLayout:layout];
        [_collectionView setDataSource:self];
        [_collectionView setDelegate:self];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_searchLogView addSubview:_collectionView];
        [_collectionView registerNib:[UINib nibWithNibName:@"SearchLogCell" bundle:nil] forCellWithReuseIdentifier:@"SearchLogCell"];

        
        //----搜尋結果View
        _searchResultView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_searchLogView.frame) +10, KScreenWidth, KScreenHeight)];
        _searchResultView.backgroundColor = [UIColor lightTextColor];
        [self.view addSubview:_searchResultView];
        
        UIImageView * searchResultImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 10, 10)];
        searchResultImg.image = [UIImage imageNamed:@"icon_title"];
        [_searchResultView addSubview:searchResultImg];
        
        UILabel * searchResultLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(searchLogImg.frame)+10, 0, 100, 10)];
        searchResultLabel.text = @"搜尋結果";
        searchResultLabel.font = [UIFont systemFontOfSize:12];
        searchResultLabel.textColor = [UIColor lightGrayColor];
        [_searchResultView addSubview:searchResultLabel];
        
        _resultTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(searchResultLabel.frame)+10, KScreenWidth-20, _searchResultView.frame.size.height - CGRectGetMaxY(searchResultLabel.frame)-20)];
        _resultTableView.dataSource = self;
        _resultTableView.delegate = self;
        [_searchResultView addSubview:_resultTableView];
        
    }
    return self;
}
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"SearchView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}

#pragma mark - collectionView
// 返回cell的尺寸大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake( _collectionView.frame.size.width/5-5, _collectionView.frame.size.width/5-5);
}
//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SearchLogCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchLogCell" forIndexPath:indexPath];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
}
 #pragma mark - tableView


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
// tableview cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MassMessageCell * cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell ==nil) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"MassMessageCell" owner:nil options:nil];
        for (UIView *view in views ) {
            if ([view isKindOfClass:[MassMessageCell class]]) {
                cell = (MassMessageCell *)view;
            }
        }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //[_delegate pushMediaPlayerView];
}
@end
