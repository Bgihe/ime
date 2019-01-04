//
//  IncomeView.h
//  IME
//
//  Created by apple on 2018/12/19.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IncomeView;

@protocol IncomeViewDelegate<UICollectionViewDelegate,UICollectionViewDataSource>

@end
@interface IncomeView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;
@property (nonatomic, weak) id<IncomeViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray   *dataArr;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@end


