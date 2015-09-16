//
//  MyPostMainViewController.m
//
//  Created by YTO on 13-7-17.
//  Copyright (c) 2013年 YTO—jhony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValidateUtil : NSObject

+ (BOOL)validateNumber:(NSString *)inputVal;  //验证码测试


+ (BOOL)validateEmptyString:(NSString *)inputVal;
+ (BOOL)validateEqualString:(NSString *)oneVal equal:(NSString *) twoVal;

+ (BOOL)validateNameLengthString:(NSString *)inputVal;
+ (BOOL)validatePwdLengthString:(NSString *)inputVal;
+ (BOOL)validatePhoneLengthString:(NSString *)inputVal;
+ (BOOL)validateEmailLengthString:(NSString *)inputVal;
+ (BOOL)validateCustomNameLengthString:(NSString *)inputVal;

//+ (BOOL)validateLoginNameString:(NSString *)inputVal;
+ (BOOL)validateLoginNameLengthString:(NSString *)inputVal;
+ (BOOL)validateLoginPwdLengthString:(NSString *)inputVal;


//邮箱验证
+ (BOOL)validateEmail:(NSString *)email;
+ (BOOL)validateMobile:(NSString *)mobile;

+(BOOL)isMobilePhone:(NSString *)mobileNum;
//利用正则表达式判断一个11位数是否为一个合法的手机号码
+(BOOL)isMobileNumber:(NSString *)mobileNum;
//密码验证
+(BOOL )secretCodeLegal:(NSString *)code;

#pragma 正则匹配用户身份证号
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
+ (BOOL)checkUserIdCard: (NSString *) idCard;
+ (BOOL)checkBankIdCard: (NSString *) idCard; //银行卡验证




@end
