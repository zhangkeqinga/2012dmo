//
//  ASHttpRequest.m
//  ApprovalSystem
//
//  Created by yto on 14-12-2.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import "ASHttpRequest.h"

@implementation ASHttpRequest

- (void)executeHttpRequest:(NSString *)url
                    method:(ASRequestMethod)methodType
                    params:(NSDictionary *)params
                   success:(void(^)(NSString *responseString))success
                   failure:(void(^)(NSString *responseString, NSError *error))failure {
    DLog(@"url:%@",url);
    
    [self setNetworkActivityStart];
    if (methodType == ASRequestMethodGET) {
        // get请求
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            DLog(@"GET JSON: %@", responseObject);
            [self setNetworkActivityEnd];
            if (success) {
                success(operation.responseString);
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            DLog(@"GET Error: %@", error);
            [self setNetworkActivityEnd];
            if (failure) {
                failure(operation.responseString,error);
            }
        }];

    }else {
        // post请求
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            DLog(@"POST JSON: %@", responseObject);
            [self setNetworkActivityEnd];
            if (success) {
                success(operation.responseString);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            DLog(@"POST Error: %@", error);
            [self setNetworkActivityEnd];
            if (failure) {
                failure(operation.responseString,error);
            }
        }];
        
        // 另一种post请求
//        NSString *url = @"http://121.199.46.47/api/ListLabel.aspx";
//        NSMutableDictionary *pDict = [[NSMutableDictionary alloc] init];
//        [pDict setObject:@"XY2013" forKey:@"ss"];
//        [pDict setObject:@"1036" forKey:@"topicID"];
//        
//        AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
//        NSError *error;
//        NSMutableURLRequest *request = [requestSerializer requestWithMethod:@"POST" URLString:url parameters:params error:&error];
//        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//            DLog(@"另一种 POST JSON: %@", responseObject);
//            [self setNetworkActivityEnd];
//            if (success) {
//                success(operation.responseString);
//            }
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            DLog(@"另一种 POST Error: %@", error);
//            [self setNetworkActivityEnd];
//            if (failure) {
//                failure(operation.responseString,error);
//            }
//        }];
//        [operation start];
    }
}

- (void)setNetworkActivityStart {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)setNetworkActivityEnd {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
