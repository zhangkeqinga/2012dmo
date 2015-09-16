//
//  ASHttpRequest.h
//  ApprovalSystem
//
//  Created by yto on 14-12-2.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef enum {
    /** GET请求 **/
    ASRequestMethodGET,
    /** POST请求**/
    ASRequestMethodPOST
}ASRequestMethod;

@interface ASHttpRequest : NSObject

- (void)executeHttpRequest:(NSString *)url
                    method:(ASRequestMethod)methodType
                    params:(NSDictionary *)params
                   success:(void(^)(NSString *responseString))success
                   failure:(void(^)(NSString *responseString, NSError *error))failure;
@end
