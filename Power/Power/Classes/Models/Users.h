//
//  UserInfo.h
//  View
//
//  Created by YTO on 13-7-22.
//  Copyright (c) 2013年 YTO—jhony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Users : NSObject

+(BOOL)isLoginSystem;
+(BOOL)isPaySecrity;     //是设置支付密码
+(BOOL)isAddBank;        //是添加银行账号
+(BOOL)isGusterSecrity;  //是否设置手势密码


+(BOOL)logLoginSystem ;   //是设置手势密码
+(BOOL)logPaySecrity ;   //
+(BOOL)logAddBank  ;     //
+(BOOL)logGusterSecrity ;//设置手势密码


+(NSDictionary *)loginUserDetail;
+(BOOL)loginSystem:(NSDictionary *)dic;
+(BOOL)logoutSystem;

+(NSString *)userId;       //ID
+(NSString *)userName;     //姓名
+(NSString *)phoneNumber;  //电话
+(NSString *)userBirthday;
+(NSString *)userHealthDescription;
+(NSString *)userIdentify; //身份证号码


+(NSString *)totalBuyMoney; //总收益
+(NSString *)dayIncomes;    //日收益
+(NSString *)totalIncomes;  //累计收益
+(NSString *)totalWealth;   //总资产


+(NSString *)loginDevice;  //
+(NSString *)loginIp;      //
+(NSString *)loginTime;    //


+(NSString *)tokenString;      //
+(void)settokenString:(NSString *)token;

+(NSString *)sexString;    //性别
+(NSString *)wealth;       //资产
+(NSString *)secrity;      //资产



+(void)historySelect:(NSMutableArray *)dic withKey:(NSString *)key_;
+(NSMutableArray *)historySelectKey:(NSString *)key_;     //科室


@end



