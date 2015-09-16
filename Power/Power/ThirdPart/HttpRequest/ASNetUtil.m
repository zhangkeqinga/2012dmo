//
//  ASNetUtil.m
//  ApprovalSystem
//
//  Created by yto on 14-12-2.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import "ASNetUtil.h"
//#import "ASDownloadUtil.h"

@implementation ASNetUtil

/*
 发送异步请求
 */
+ (void)sendRequestWithUrl:(NSString *)url
                    method:(ASRequestMethod)methodType
                parameters:(NSDictionary *)parameters
                   success:(void(^)(NSString *responseString))success
                   failure:(void(^)(NSString *responseString, NSError *error))failure {
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(aQueue, ^{
        @autoreleasepool {
            ASHttpRequest *request = [[ASHttpRequest alloc] init];
            [request executeHttpRequest:url method:methodType params:parameters success:success failure:failure];
        }
    });
}

/**
 * 将参数params转化成json字符串，再生成Dictionary
 * param params 需要转化的参数集
 * param key 最后生成字典的key值
 * return 字典参数集
 **/
+ (NSDictionary *)dictConversionJSONDict:(NSDictionary *)params withKey:(NSString *)key {
    NSString *xmlStr = [params JSONRepresentation];
//    xmlStr = [Base64String URLencode:xmlStr stringEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *pDict = [[NSMutableDictionary alloc] init];
    [pDict setObject:xmlStr forKey:key];
    return pDict;
}

/**
 * 将url进行加密处理，拼接参数json
 * param url 基本url
 * param params 参数
 * param identifier 加密标识
 * return 返回完整的url
 **/

+ (NSString *)urlEncryptUrl:(NSString *)url params:(NSDictionary *)params identifier:(NSString *)identifier {
    NSString *xmlStr = [params JSONRepresentation];
    NSString *dataStr = [NSString stringWithFormat:@"%@%@",xmlStr,identifier];
    dataStr = [Base64String URLencode:[MD5Strings MD5Base64String:dataStr] stringEncoding:NSUTF8StringEncoding];
    NSString *fullUrl = [NSString stringWithFormat:url,dataStr];
    return fullUrl;
}

+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(id result, NSError *error))block
          url:(NSString *)url
       method:(ASRequestMethod)methodType
       params:(NSDictionary *)params {
    
    if (methodType == ASRequestMethodGET) {
        return [[AFAppDotNetAPIClient sharedClient] GET:url parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
            if (block) {
                block(JSON, nil);
            }
        } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
            if (block) {
                block(nil, error);
            }
        }];
    }else {
        return [[AFAppDotNetAPIClient sharedClient] POST:url parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
            if (block) {
                block(JSON, nil);
            }
        } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
            if (block) {
                block(nil, error);
            }
        }];
    }
}

@end
