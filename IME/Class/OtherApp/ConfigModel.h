//
//  ConfigModel.h
//  IME
//
//  Created by apple on 2019/1/8.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigModel : NSObject

@property (nonatomic, copy) NSString                * url_base;                 //相對路徑
@property (nonatomic, copy) NSString                * member_picture_url;       //照片大圖路徑
@property (nonatomic, copy) NSString                * member_thumbnail_url;     //照片縮圖路徑
@property (nonatomic, assign) BOOL                  * show_ranking;             //探索頁面是否顯示排行的按鈕
@property (nonatomic, assign) NSInteger             * avatar_mini_size;         //頭像Size
@property (nonatomic, assign) NSInteger             * avatar_thumb_size;        //頭像縮圖Size //--
@property (nonatomic, assign) NSInteger             * media_thumb_width;        //貼文縮圖寬度
@property (nonatomic, assign) NSInteger             * min_duration;             //影片最小時間
@property (nonatomic, assign) NSInteger             * max_duration;             //影片最大時間
@property (nonatomic, copy) NSDictionary            * post_credits_range;       //貼文鑽石範圍 {'min'=>0, 'max'=>240}
@property (nonatomic, copy) NSDictionary            * chat_credits_range;       //聊天收費範圍
@property (nonatomic, copy) NSDictionary            * chat_media_credits_range; //聊天發送照片/影片收費範圍
@property (nonatomic, copy) NSDictionary            * talk_credits_range;       //語音通訊收費範圍
@property (nonatomic, copy) NSDictionary            * stomp_config;             //STOMP協定
@property (nonatomic, copy) NSDictionary            * mq_config;                //MQ協定 host port user password
@property (nonatomic, copy) NSString                * version_info_url;         //版本資訊 更新用
@property (nonatomic, copy) NSDictionary            * anchor_tag;               //標籤



+ (ConfigModel *) instance;

@end

