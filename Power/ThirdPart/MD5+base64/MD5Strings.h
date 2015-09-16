//
//  MyPostMainViewController.m
//
//  Created by YTO on 13-7-17.
//  Copyright (c) 2013年 YTO—jhony. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CommonCrypto/CommonDigest.h>
@interface MD5Strings : NSObject
+ (NSString *) md5:(NSString *)str;
+ (NSString *)MD5Base64String:(NSString *)str;
@end
