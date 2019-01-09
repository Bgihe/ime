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
//----

//取得會員的簡介檔案
#define URL_get_profile @"/member/get-profile"
//更新活動時間與上線
#define URL_update_active_time @"/member/update-active-time"
//更新活動時間與上線
#define URL_get_setting @"/member/get-setting"
//更新會員資料
#define URL_member_update @"/member/update"
//更新喜好資料
#define URL_update_setting @"/member/update-setting"
//上傳大頭照
#define URL_upload_picture @"/member/upload-picture"
//預設大頭照
#define URL_set_default_picture @"/member/set-default-picture"





#endif /* URLMacros_h */
