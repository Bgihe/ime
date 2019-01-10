//
//  PermissionsModel.h
//  IME
//
//  Created by apple on 2019/1/8.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PermissionsModel : NSObject
@property (nonatomic, assign) BOOL          chat_media;                 //聊天拍照錄影
@property (nonatomic, assign) BOOL          chat_with_agent;            //是否可和經濟聊天
@property (nonatomic, assign) BOOL          chat_with_anchor;           //是否可和主播聊天
@property (nonatomic, assign) BOOL          chat_with_member;           //是否可和會員聊天
@property (nonatomic, assign) BOOL          credits_setting;            //設定收的讚數
@property (nonatomic, assign) BOOL          deposit;                    //是否可儲值
@property (nonatomic, assign) BOOL          member_edit_picture;        //是否可編輯頭像
@property (nonatomic, assign) BOOL          member_set_default_pic;     //是否可設定預設頭像
@property (nonatomic, assign) BOOL          post;                       //貼文
@property (nonatomic, assign) BOOL          unlock_picture;             //購買照片
@property (nonatomic, assign) BOOL          unlock_video;               //購買影片
@property (nonatomic, assign) BOOL          view_anchor_post;           //看旗下主播發的影片/照片

+ (PermissionsModel *) instance;

@end
