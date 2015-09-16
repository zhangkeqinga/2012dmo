//
//  MyPostMainViewController.m
//
//  Created by YTO on 13-7-17.
//  Copyright (c) 2013年 YTO—jhony. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "MD5Strings.h"
#import "GTMBase64.h"

@implementation MD5Strings
+ (NSString *) md5:(NSString *)str
{
    
    const char *original_str = [str UTF8String];
    unsigned char result[16];
    CC_MD5(original_str, strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
    
}


+ (NSString *)MD5Base64String:(NSString *)str

{
    const char *original_str = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);

//    unsigned char result[CC_MD5_DIGEST_LENGTH];
//    
//    CC_MD5([[str dataUsingEncoding:NSUTF8StringEncoding] bytes], [str length], result);
    
    NSData *data = [NSData dataWithBytes:result length:CC_MD5_DIGEST_LENGTH];
    
    data = [GTMBase64 encodeData:data];
    
    NSString * base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return base64String;
    
}

@end
