//
//  MyPostMainViewController.m
//
//  Created by YTO on 13-7-17.
//  Copyright (c) 2013年 YTO—jhony. All rights reserved.
//

#import "ValidateUtil.h"

@implementation ValidateUtil


+ (BOOL)validateNumber:(NSString *)inputVal //验证码测试
{
    
    NSString *emailRegex =  @"[0-9]{6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:inputVal];
}

+ (BOOL)validateEmptyString:(NSString *)inputVal {
    
    if (inputVal == nil) {
        return NO;
    }
    
    if ([inputVal isEqualToString:@""]) {
        return NO;
    }
    
    return YES;
}

+ (BOOL)validateNameLengthString:(NSString *)inputVal
{
    if ([inputVal length]> 50)
    {
        return NO;
    }
    return YES;
}

+ (BOOL)validateLoginPwdLengthString:(NSString *)inputVal
{
    if ([inputVal length]> 18 || [inputVal length] <6)
//    if([inputVal length] > 50)
    {
        return NO;
    }
    return YES;
}

+ (BOOL)validateLoginNameLengthString:(NSString *)inputVal
{
    if ([inputVal length] > 50 || [inputVal length] < 6)
    {
        return NO;
    }
    return YES;
}

+ (BOOL)validatePwdLengthString:(NSString *)inputVal
{
    if ([inputVal length] > 20)
    {
        return NO;
    }
    return YES;
}
+ (BOOL)validatePhoneLengthString:(NSString *)inputVal
{
    if ([inputVal length] == 11)
    {
        return YES;
    }
    return NO;
}
+ (BOOL)validateEmailLengthString:(NSString *)inputVal
{
    if ([inputVal length] > 50)
    {
        return NO;
    }
    return YES;
}



+ (BOOL)validateCustomNameLengthString:(NSString *)inputVal
{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSUInteger le1 = [inputVal lengthOfBytesUsingEncoding:enc];
    
//    NSLog(@"length: %d", le1);
    if (le1 > 20)
    {
        return NO;
    }
    return YES;
}



+ (BOOL)validateEqualString:(NSString *)oneVal equal:(NSString *) twoVal {
    
    if (oneVal == nil || twoVal == nil) {
        return NO;
    }
    
    if ([oneVal isEqualToString:@""]
        || [twoVal isEqualToString:@""]) {
        return NO;
    }
    
    if ([oneVal isEqualToString:twoVal]) {
        return YES;
    }
    
    return NO;
}

//判断邮箱
+ (BOOL)validateEmail:(NSString *)email {
    NSString *emailRegex =  @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}



+ (BOOL)validateMobile:(NSString *)mobile {
    BOOL result = NO;
    NSString *mobileRegex = @"((\\d{11})|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$)";
    
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRegex];
    result = [mobileTest evaluateWithObject:mobile];
    if(!result){
        mobileRegex = @"^(400)\\d{7}$";
        mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRegex];
        result = [mobileTest evaluateWithObject:mobile];
    }
    return result;
}


+(BOOL)isMobilePhone:(NSString *)mobileNum
{
    NSString * mobile = @"^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSPredicate * regextTestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",mobile];
    
    if(([regextTestMobile evaluateWithObject:mobileNum]==YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


//^[1][3-8]+\\d{9}     ^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$
//利用正则表达式判断一个11位数是否为一个合法的手机号码
+(BOOL)isMobileNumber:(NSString *)mobileNum
{
    NSString * mobile = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * cm = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * cu = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * ct = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSPredicate * regextTestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",mobile];
    NSPredicate * regextTextCm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",cm];
    NSPredicate * regextTextCu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",cu];
    NSPredicate * regextTextCt = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",ct];
    
    if(([regextTestMobile evaluateWithObject:mobileNum]==YES)||([regextTextCm evaluateWithObject:mobileNum]==YES)||([regextTextCu evaluateWithObject:mobileNum]==YES)||([regextTextCt evaluateWithObject:mobileNum]==YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//(?!^\\d+$)不能全是数字
//(?!^[a-zA-Z]+$)不能全是字母
//(?!^[_#@]+$)不能全是符号（这里只列出了部分符号，可自己增加，有的符号可能需要转义）
//.{8,}长度不能少于8位
//合起来就是
//(?!^\\d+$)(?!^[a-zA-Z]+$)(?!^[_#@]+$).{8,}

//判断密码是否合法
+(BOOL )secretCodeLegal:(NSString *)code
{
    //
    NSString *regex = @"[A-Z0-9a-z]{6,18}";//
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    if ([predicate evaluateWithObject:code] == YES && code.length>5 && code.length<17)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma 正则匹配用户身份证号
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

#pragma 正则匹配用户身份证号15或18位
+ (BOOL)checkUserIdCard: (NSString *) idCard
{
    NSString *pattern = @"^[0-9]{15}$)|([0-9]{17}([0-9]|X)$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}


+ (BOOL)checkBankIdCard: (NSString *) idCard
{
    NSString *pattern = @"^([0-9]{16}|[0-9]{19})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}

@end
