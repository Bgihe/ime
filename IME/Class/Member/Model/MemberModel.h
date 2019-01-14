//
//  MemberModel.h
//  IME
//
//  Created by apple on 2019/1/9.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MemberModel;

@protocol MemberModelDelegate <NSObject>
@optional

@end

@interface MemberModel : NSObject
@property (nonatomic, weak) id<MemberModelDelegate> delegate;

typedef void (^SuccessBlock)(NSDictionary *responseJson);
typedef void (^FailureBlock)(NSError *error);

@property (nonatomic, assign) NSInteger               *no;          //會員編號
@property (nonatomic, copy)   NSString                *account;     //會員帳號
@property (nonatomic, copy)   NSString                *phone_no;    //手機號碼
@property (nonatomic, assign) NSInteger               role;         //角色
@property (nonatomic, copy)   NSString                *gender;      //性別
@property (nonatomic, copy)   NSString                *introduction;//簡介
@property (nonatomic, copy)   NSString                *thumbnail;   //個人造base64
@property (nonatomic, assign) NSInteger               fans_num;     //粉絲人數
@property (nonatomic, assign) NSInteger               trace_num;    //追蹤人數
@property (nonatomic, assign) NSInteger               antifans_num; //黑粉人數
@property (nonatomic, assign) NSInteger               block_num;    //封鎖人數
@property (nonatomic, assign) NSInteger               credits;      //鑽石數
@property (nonatomic, copy)   NSDictionary            *setting;     //會員喜好設定
@property (nonatomic, copy)   NSMutableArray          *pictures;    //會員上傳的圖片

+ (MemberModel *) instance;
- (NSDictionary *)postSynchMehtod:(NSString*)method ctl:(NSString*)ctl param:(NSDictionary*)param;
@end

