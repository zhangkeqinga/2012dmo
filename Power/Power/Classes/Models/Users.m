//
//  UserInfo.m
//  View
//
//  Created by YTO on 13-7-22.
//  Copyright (c) 2013年 YTO—jhony. All rights reserved.
//

#import "Users.h"

@implementation Users


//dayIncomes = "0.00";
//idCard = "341202******3652";
//phone = "138****6764";
//totalBuyMoney = "0.00";
//totalIncomes = "0.00";
//totalWealth = 0;
//user = "\U738b**";




+(NSString *)userId
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    return [NSString stringWithFormat:@"%@",[dic objectForKey:@"id"]];
}

+(NSString *)userName
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    return [dic objectForKey:@"createUser"];
}

+(NSString *)phoneNumber
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    return [NSString stringWithFormat:@"%@",[dic valueForKey:@"userPhone"]];
}

+(NSString *)userBirthday
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    return [dic objectForKey:@"userAge"];
}


+(NSString *)userHealthDescription
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    return [dic objectForKey:@"health"];
}


+(NSString *)userIdentify; //身份证号码
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    return [dic valueForKey:@"idCard"];
    
}

+(NSString *)totalBuyMoney; //总收益
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    return [NSString stringWithFormat:@"%@",[dic valueForKey:@"totalBuyMoney"]];
    
}

+(NSString *)dayIncomes; //日收益
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    return [NSString stringWithFormat:@"%@",[dic valueForKey:@"dayIncomes"]];
    
}

+(NSString *)totalIncomes; //累计收益
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    return [NSString stringWithFormat:@"%@",[dic valueForKey:@"totalIncomes"]];
    
}

+(NSString *)totalWealth; //总资产
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    return [NSString stringWithFormat:@"%@",[dic valueForKey:@"totalWealth"]];
    
}


+(NSString *)loginDevice;  //
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    
    return [dic valueForKey:@"loginDevice"];

}
+(NSString *)loginIp;      //
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    
    return [NSString stringWithFormat:@"%@",[dic valueForKey:@"loginIp"]];

}
+(NSString *)loginTime;    //
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    
    return [NSString stringWithFormat:@"%@",[dic valueForKey:@"loginTime"]];

}



+(NSString *)tokenString
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"tokenstring"];
}


+(void)settokenString:(NSString *)token
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([@"" isEqual:token]) {
        DLog(@"token=====");
    }else{
        [defaults setObject:token forKey:@"tokenstring"];
    }
}


+(NSString *)sexString
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    
    return [dic valueForKey:@"sexString"];
}


+(NSString *)wealth
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    
    return [NSString stringWithFormat:@"%@",[dic valueForKey:@"wealth"]];
}

+(NSString *)secrity
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    
    return [NSString stringWithFormat:@"%@",[dic valueForKey:@"secrity"]];
}



// ----------------------------
+(BOOL)isLoginSystem  //是否登录
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *logNumber = [defaults objectForKey:@"user_isLogin"];
    
    return [logNumber boolValue];
}


+(BOOL)logLoginSystem  //是设置手势密码
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:YES]  forKey:@"user_isLogin"];
    return YES;
}

// ----------------------------
+(BOOL)isPaySecrity   //是设置支付密码
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *logNumber = [defaults objectForKey:@"isPaySecrity"];
    
    return [logNumber boolValue];
}

+(BOOL)logPaySecrity  //是设置手势密码
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:YES]  forKey:@"isPaySecrity"];
    return YES;
}


// ----------------------------
+(BOOL)isAddBank      //是添加银行账号
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *logNumber = [defaults objectForKey:@"isAddBank"];
    return [logNumber boolValue];
}

+(BOOL)logAddBank  //是设置手势密码
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:YES]  forKey:@"isAddBank"];
    return YES;
}


// ----------------------------
+(BOOL)isGusterSecrity  //是否设置手势密码
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *logNumber = [defaults objectForKey:@"isGusterSecrity"];
    return [logNumber boolValue];
}

+(BOOL)logGusterSecrity  //设置手势密码
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:YES]  forKey:@"isGusterSecrity"];
    return YES;
}

+(NSDictionary *)loginUserDetail
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    
    return dic;
}

+(NSArray *)loginUserData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *arr = [defaults objectForKey:@"userdata"];
    
    return arr;
}

+(BOOL)loginSystem:(NSDictionary *)dic
{
    NSUserDefaults*defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:YES]  forKey:@"user_isLogin"];
    [defaults setObject:dic  forKey:@"user_detail"];
    
    return YES;
}

+(BOOL)logoutSystem
{
    NSUserDefaults*defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:[NSNumber numberWithBool:NO]  forKey:@"user_isLogin"];
    [defaults setObject:[NSNumber numberWithBool:NO]  forKey:@"isPaySecrity"];
    [defaults setObject:[NSNumber numberWithBool:NO]  forKey:@"isGusterSecrity"];
    [defaults setObject:[NSNumber numberWithBool:NO]  forKey:@"isAddBank"];
    [defaults setObject:[NSNumber numberWithBool:NO]  forKey:@"id"];

    [defaults setObject:nil  forKey:@"user_detail"];

    [defaults synchronize];
    
    return YES;
}



+(void)historySelect:(NSMutableArray *)dic withKey:(NSString *)key_;
{
    
    NSData * dataobject = [NSKeyedArchiver archivedDataWithRootObject:dic];
    NSUserDefaults*defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:dataobject  forKey:key_];
//    [defaults synchronize];

}


+(NSMutableArray *)historySelectKey:(NSString *)key_;     //科室 ....
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData * dataobject = [defaults objectForKey:key_];
    NSMutableArray * arr = [NSKeyedUnarchiver unarchiveObjectWithData:dataobject];

    return arr;
    
}








@end
