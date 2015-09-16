//
//  UrlParamsUtil.m
//  YTongExpress
//
//  Created by yto on 14-11-6.
//  Copyright (c) 2014年 wuxiaozhen. All rights reserved.
//

#import "UrlParamsUtil.h"

@implementation UrlParamsUtil

+ (id)shareInstance {
    static id paramsUtil = nil;
    if (! paramsUtil) {
        @synchronized(self) {
            if (!paramsUtil) {
                paramsUtil = [[self alloc] init];
            }
        }
    }
    return paramsUtil;
}

+ (void)setParams:(id)model {
    NSUserDefaults*defaults = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:model];
    [defaults setObject:myEncodedObject forKey:YT_URL_PARAMS_MODEL];
}

+ (id)getParamsModel {
    NSUserDefaults*defaults = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [defaults objectForKey:YT_URL_PARAMS_MODEL];
    UrlParamModel *bModel = [NSKeyedUnarchiver unarchiveObjectWithData:myEncodedObject];
    return bModel;
}

+ (NSString *)getServiceUrl {
    UrlParamModel *aModel = [UrlParamsUtil getParamsModel];
    return aModel.url;
}

+ (NSString *)getOpenAppKey {
    UrlParamModel *aModel = [UrlParamsUtil getParamsModel];
    return aModel.open_appkey;
}

+ (NSString *)getSecretKey {
    UrlParamModel *aModel = [UrlParamsUtil getParamsModel];
    return aModel.secret_key;
}

+ (NSString *)getYTAppKey {
    UrlParamModel *aModel = [UrlParamsUtil getParamsModel];
    return aModel.app_key;
}

+ (NSString *)getOneLineTime {
    UrlParamModel *aModel = [UrlParamsUtil getParamsModel];
    return aModel.onlineTime;
}



@end
