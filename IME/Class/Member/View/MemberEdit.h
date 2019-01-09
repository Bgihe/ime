//
//  MemberEdit.h
//  IME
//
//  Created by apple on 2019/1/9.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MemberEdit;

@protocol MemberEditDelegate

@end
@interface MemberEdit : UIView
@property (nonatomic, weak) id<MemberEditDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *genderLabel;


@end
