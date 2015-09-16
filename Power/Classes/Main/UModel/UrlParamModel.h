//
//  UrlParamModel.h
//  YTongExpress
//
//  Created by yto on 14-11-6.
//  Copyright (c) 2014年 wuxiaozhen. All rights reserved.
//  对应友盟上在线参数的接口

#import <Foundation/Foundation.h>

@interface UrlParamModel : NSObject

@property (nonatomic,strong) NSString *url;             // 服务器链接
@property (nonatomic,strong) NSString *open_appkey;     // 圆通开放平台 appkey
@property (nonatomic,strong) NSString *secret_key;      // 圆通开放平台 加密key
@property (nonatomic,strong) NSString *app_key;         // YtcltMobile

@property (nonatomic,strong) NSString *onlineTime;      // YtcltMobile


@end
