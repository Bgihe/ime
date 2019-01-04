//
//  MyIncomeView.h
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyIncomeView;

@protocol MyIncomeViewDelegate

@end

@interface MyIncomeView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (nonatomic, weak) id<MyIncomeViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
