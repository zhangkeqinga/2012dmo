//
//  ASNetUtil.h
//  ApprovalSystem
//
//  Created by yto on 14-12-2.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASHttpRequest.h"
#import "SBJson.h"
#import "RMMapper.h"
#import "Base64String.h"
#import "MD5Strings.h"
#import "AFAppDotNetAPIClient.h"

@interface ASNetUtil : NSObject

/**
 * 数据请求
 **/
+ (void)sendRequestWithUrl:(NSString *)url
                    method:(ASRequestMethod)methodType
                parameters:(NSDictionary *)parameters
                   success:(void(^)(NSString *responseString))success
                   failure:(void(^)(NSString *responseString, NSError *error))failure;

/**
 * 将参数params转化成json字符串，再生成Dictionary
 * param params 需要转化的参数集
 * param key 最后生成字典的key值
 * return 字典参数集
 **/
+ (NSDictionary *)dictConversionJSONDict:(NSDictionary *)params withKey:(NSString *)key;

/**
 * 将url进行加密处理，拼接参数json
 * param url 基本url
 * param params 参数
 * param identifier 加密标识
 * return 返回完整的url
 **/
+ (NSString *)urlEncryptUrl:(NSString *)url params:(NSDictionary *)params identifier:(NSString *)identifier;


+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(id result, NSError *error))block
                                                   url:(NSString *)url
                                                method:(ASRequestMethod)methodType
                                                params:(NSDictionary *)params;

@end
