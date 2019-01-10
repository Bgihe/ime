//
//  MemberEditView.h
//  IME
//
//  Created by apple on 2019/1/10.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MemberEditView;

@protocol MemberEditViewDelegate
-(void) addReportView : (NSString*) no;
@end
@interface MemberEditView : UIView
@property (nonatomic, weak) id<MemberEditViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource> delegate;

@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *introTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UITextView *introTextView;


@property(weak, nonatomic) IBOutlet UIButton *previewBtn;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray   *dataArr;

-(void) testVoid;
@end
