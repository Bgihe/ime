//
//  MemberEditView.m
//  IME
//
//  Created by apple on 2019/1/10.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MemberEditView.h"
#import "HeadShotCell.h"
#import "MemberModel.h"
#import "PermissionsModel.h"
@implementation MemberEditView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_previewBtn.layer.cornerRadius = CGRectGetHeight(self->_previewBtn.frame)/2;
            self->_previewBtn.clipsToBounds = YES;
        });

        MemberModel * memberModel = [MemberModel instance];
        _dataArr = [[NSMutableArray alloc] init];
        _dataArr = memberModel.pictures;
   
        NSLog(@"%@",[_dataArr valueForKey:@"no"]);

        [_collectionView registerNib:[UINib nibWithNibName:@"HeadShotCell" bundle:nil] forCellWithReuseIdentifier:@"HeadShotCell"];
        
        [self updateIntroduction];
    
    }
    return self;
}

- (void) reloadCollectionView{
    MemberModel * memberModel = [MemberModel instance];
    _dataArr = [[NSMutableArray alloc] init];
    _dataArr = memberModel.pictures;
    
    
    
    [_collectionView reloadData];
}

- (void)updateIntroduction{
    MemberModel * memberModel = [MemberModel instance];
    NSLog(@"%@",memberModel.introduction);
    NSLog(@"%@",memberModel.gender);
    //_introLabel.text = memberModel.introduction;
    _introTextView.text = memberModel.introduction;
    
    if ([memberModel.gender isEqualToString:@"F"]) {
        _genderLabel.text = @"女";
    }else if([memberModel.gender isEqualToString:@"M"]){
        _genderLabel.text = @"男";
    }
}
    
- (void)commonInit
{
    [[NSBundle mainBundle] loadNibNamed:@"MemberEditView" owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame=self.bounds;
}

-(void) testVoid{
    
    CGRect rect            = _collectionView.frame;
    rect.size.height       = 22.5;
    [_collectionView setFrame:rect];
    
}
// 返回cell的尺寸大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake( _collectionView.frame.size.height/2-2, _collectionView.frame.size.height/2-2);
}
//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
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
    return 6; //[_dataArr count]
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeadShotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HeadShotCell" forIndexPath:indexPath];
    if(indexPath.row < [_dataArr count]){
        cell.headImg.hidden = NO;
        NSArray *partitionArr = [[NSArray alloc]init];
        MemberModel * memberModel = [MemberModel instance];
        NSMutableArray * arr = [[ NSMutableArray alloc] init];
        arr = memberModel.pictures;
        
        
        if ([[[memberModel.pictures objectAtIndex:indexPath.row] objectForKey:@"default_pic"] boolValue]) {
            cell.checkBtn.hidden = NO;
        }else{
            cell.checkBtn.hidden = YES;
        }
        if ([[memberModel.pictures objectAtIndex:indexPath.row] objectForKey:@"thumbnail"]) {
            partitionArr =[[[memberModel.pictures objectAtIndex:indexPath.row] objectForKey:@"thumbnail"] componentsSeparatedByString:@","];
            NSData *decodedImageData = [[NSData alloc]
                                        initWithBase64EncodedString:[partitionArr objectAtIndex:1] options:NSDataBase64DecodingIgnoreUnknownCharacters];

            //cell.headImg.image = [UIImage imageWithData:decodedImageData];
            
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation: UIStatusBarAnimationSlide];
            UIImage *image=[UIImage imageWithData:decodedImageData];
            CGFloat fixelW = CGImageGetWidth(image.CGImage);
            CGRect rect = CGRectMake(0, 0, fixelW, fixelW);//创建矩形框
            cell.headImg.image=[UIImage imageWithCGImage:CGImageCreateWithImageInRect([image CGImage], rect)];
            
        }
        
        PermissionsModel * permissionsModel = [PermissionsModel instance];
        if (permissionsModel.member_edit_picture) {
            cell.editBtn.hidden = NO;
        }else{
            cell.editBtn.hidden = YES;
        }
    }else{
        cell.editBtn.hidden = YES;
        cell.headImg.hidden = YES;
        cell.checkBtn.hidden = YES;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
    
    if (indexPath.row >= [_dataArr count])  {
        [_delegate addPicture];
    }else{
        MemberModel * memberModel = [MemberModel instance];
        if ([[memberModel.pictures objectAtIndex:indexPath.row] objectForKey:@"no"]) {
            [_delegate addReportView:[[memberModel.pictures objectAtIndex:indexPath.row] objectForKey:@"no"]];
        }
    }
}

/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(kScreenWidth, kScreenHeight*0.15);
}*/

///尾部高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}



@end
