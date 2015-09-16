//
//  AFAppDotNetAPIClient.h
//  ApprovalSystem
//
//  Created by yto on 14-12-4.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AFAppDotNetAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
