//
//  PhotoCollectionViewCell.h
//  IME
//
//  Created by MAC on 2018/12/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class PhotoCollectionViewCell;

@protocol PhotoCollectionViewCellDelegate<NSObject>

@end
@interface PhotoCollectionViewCell : UICollectionViewCell
 
@property (nonatomic, weak) id<PhotoCollectionViewCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
