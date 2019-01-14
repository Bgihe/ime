//
//  NetHttpsModel.h
//  IME
//
//  Created by apple on 2019/1/11.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@class NetHttpsModel;

@protocol NetHttpsModelDelegate <NSObject>
@optional
 
- (void)httpResult: (NSDictionary*) responseObject :(NSString *) url ;
@end

@interface NetHttpsModel : NSObject
@property (nonatomic, weak) id<NetHttpsModelDelegate> delegate;

- (void)POSTWithUrl:(NSString *)urlStr paramDict:(NSMutableDictionary *)paramDict;


@end
