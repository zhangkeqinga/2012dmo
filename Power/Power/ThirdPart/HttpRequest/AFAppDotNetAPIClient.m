//
//  AFAppDotNetAPIClient.m
//  ApprovalSystem
//
//  Created by yto on 14-12-4.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import "AFAppDotNetAPIClient.h"

//static NSString * const AFAppDotNetAPIBaseURLString = AS_Login_Service;//@"https://api.app.net/";

static NSString * const AFAppDotNetAPIBaseURLString = @"https://api.app.net/";

@implementation AFAppDotNetAPIClient

+ (instancetype)sharedClient {
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end
