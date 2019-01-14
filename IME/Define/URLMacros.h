//
//  URLMacros.h
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/18.
//  Copyright © 2017年 徐阳. All rights reserved.
//



#ifndef URLMacros_h
#define URLMacros_h


//内部版本号 每次发版递增
#define KVersionCode 1
/*
 
 将项目中所有的接口写在这里,方便统一管理,降低耦合
 
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */

#define DevelopSever    0
#define TestSever       1
#define ProductSever    0

#if DevelopSever

/**开发服务器*/
#define URL_main @"http://api.i-me.live/api-v1"
//#define URL_main @"http://api.ga8877.com/api-v1"

#elif TestSever

/**测试服务器*/
#define URL_main @"http://api.ga8877.com/api-v1"

#elif ProductSever

/**生产服务器*/
#define URL_main @"http://192.168.20.31:20000/shark-miai-service2"
#endif



#pragma mark - ——————— 详细接口地址 ————————

//测试接口
//NSString *const URL_Test = @"api/recharge/price/list";
#define URL_Test @"/api/cast/home/start"


#pragma mark - ——————— 用户相关 ————————

//0107
//系統config
#define URL_config @"/config"
//登入與認證碼
#define URL_send_auth_code @"/auth/send-auth-code"
//手機號碼登入
#define URL_phone_login @"/auth/phone-login"
//檢查認證碼
#define URL_check @"/auth/check"
//註冊
#define URL_set_account @"/member/set-account"
//登出
#define URL_logout @"/auth/logout"
//取得個人的完整資料
#define URL_get_my_data @"/member/get-my-data"
//取得會員的簡介檔案
#define URL_get_profile @"/member/get-profile"
//更新活動時間與上線 (暫時不用)
#define URL_update_active_time @"/member/update-active-time"
//更新活動時間與上線 (暫時不用)
#define URL_get_setting @"/member/get-setting"
//更新會員資料
#define URL_member_update @"/member/update"
//更新喜好資料
#define URL_update_setting @"/member/update-setting"
//上傳大頭照
#define URL_upload_picture @"/member/upload-picture"
//預設大頭照
#define URL_set_default_picture @"/member/set-default-picture"
//刪除大頭照
#define URL_del_picture @"/member/del-picture"

//0113
//追蹤
#define URL_trace_add @"/member-trace/add"
//移除追蹤
#define URL_trace_remove @"/member-trace/remove"
//取得粉絲清單
#define URL_get_fans_data @"/member-trace/get-fans-data"
//取得追蹤清單
#define URL_get_trace_data @"/member-trace/get-member-data"
//取得追蹤主播的最新貼文 (main的全部訊息)
#define URL_get_trace_new_post @"/member-trace/get-new-post"
//新增封鎖 (暫時不用)
#define URL_block_add @"/member-block/add"
//解除封鎖 (暫時不用)
#define URL_block_remove @"/member-block/remove"
//取得封鎖清單 (暫時不用)
#define URL_get_block_data @"/member-block/get-member-data"
//----紀錄點
//鑽石紀錄
#define URL_get_credits @"/credits/get-credits"
//取得點數的使用歷程
#define URL_get_credits_log @"/credits/get-logs"
//取得所有付款方式和點數資料
#define URL_deposit_get_all_plan @"/deposit/get-all-deposit-plan"
//儲值
#define URL_deposit_query @"/deposit/query"
//取得封鎖清單
#define URL_explore_search_anchor @"/explore/search-anchor"
//取得搜尋的推薦清單
#define URL_explore_promo_search @"/explore/get-promo-search"
//貼文
#define URL_post_publish @"/post/publish"
//取得貼文的資料
#define URL_get_post_data @"/post/get-post-data"
//解鎖文章
#define URL_post_unlock @"/post/unlock"
//取得自己的文章
#define URL_post_get_my_record @"/post/get-my-record"
//取得主播的文章
#define URL_post_get_record @"/post/get-record"
//取得已解鎖的文章
#define URL_post_get_unlock @"/post/get-unlock"
//將已解鎖文章加入收藏
#define URL_post_add_favorite @"/post/add-favorite"
//取消收藏的解鎖文章
#define URL_post_remove_favorite @"/post/remove-favorite"

#endif /* URLMacros_h */
