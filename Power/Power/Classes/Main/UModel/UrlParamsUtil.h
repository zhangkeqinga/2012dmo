//
//  UrlParamsUtil.h
//  YTongExpress
//
//  Created by yto on 14-11-6.
//  Copyright (c) 2014年 wuxiaozhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UrlParamModel.h"

#define YT_URL_PARAMS_MODEL @"url_params_model"

@interface UrlParamsUtil : NSObject

+ (id)shareInstance;

/**
 * 保存友盟在线参数
 **/
+ (void)setParams:(id)model;

/**
 * 从userDefault中获取到 在线参数
 **/
+ (id)getParamsModel;

/**
 * 获取服务器地址
 **/
+ (NSString *)getServiceUrl;

/** 
 * 获取圆通开放平台 open_appkey
 **/
+ (NSString *)getOpenAppKey;

/**
 * 获取圆通开放平台 secret_key
 **/
+ (NSString *)getSecretKey;

/**
 * 获取YtcltMobile
 **/
+ (NSString *)getYTAppKey;

/**
 * 获取在线登陆的时间长度
 **/
+ (NSString *)getOneLineTime;

@end
