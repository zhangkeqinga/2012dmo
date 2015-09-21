//
//  UnitPath.h
//  MDBClient
//
//  Created by jhony on 14-5-14.
//  Copyright (c) 2014年 YTO—jhony. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Reachability.h"
#import "UnitPath.h"
@class ProductModel;

@interface UnitPath : NSObject

+ (NSString *) UUID_DEVICE ;
+(NSString *)UUID_DEVICE_save;

// 参数10000   显示  结果 10,000  欧美表示法
+ (NSString *)countNumAndChangeformat:(NSString *)num;

//计算收益
+ (float)calculateearningsWithDay:(NSInteger)day_ withMoney:(float)money_ withRate:(float)rate_;


//判断字符串是否是图片名称
+ (BOOL)judgmentImageName:(NSString *)imageString;

//根据内容计算尺寸
+ (CGSize)calculateFrameWithContent:(NSString *)content;
+ (CGSize)calculateFrameWithContent:(NSString *)content withFont:(float)fontNum ;
+ (CGSize)calculateFrameWithContent:(NSString *)content withWidth:(float)width_ withFont:(float)fontNum;




+(NSString *)logoutSystemSecondTimes;
+(BOOL)isLoginSecondTime;  //登陆是否过期   7天（NO）

+ (NSString *)getTimeForYearMothDay:(int)year month:(int)month day:(int)day_;
+ (NSString *)getYear:(NSString *)oneDate;//年月->年
+ (NSMutableArray *)retYearMonth:(NSString *)startDate;//年月日->日期数组
+ (NSMutableArray *)getTimeForYearMoth:(NSString *)startDate endDate:(NSString *)endDate;//起始时间,截止时间年-月, 返回之间的年—月

+ (NSArray *)currentDate;
//获取当前时间 1月2日3时4分5秒6周7年
+ (NSArray *)currentDateWithDate:(NSString *)dateString ;
//获取当前时间 1月2日3时4分5秒6周7年  根据日期
+ (NSString *)getYearWithDate:(NSString *)dateString;// 获取年
+ (NSString *)currentDateSecond;           //年月日 时分秒
+ (NSString *)currentDateSecondClander;    //年月日 时分秒
+ (NSString *)currentDateFormater;         //年月日 当前时间


//获取当前的时间  某年的某月总天数
+ (NSString *)mothAllDay:(NSDate *)date;    //月总天数  年月日
+ (NSString *)getMonth:(NSString *)oneDate; //月       年月
+ (NSString *)beforeSomeMonth:(int)someDay; //年月     前n月
//年月  前n月（年月日-年月）
+ (NSString *)beforeSomeMonth:(int)somemonth  withNowTime:(NSString *)string;
+ (NSString *)afterSomeMonth:(int)somemonth  withTime:(NSString *)string;
//年月  某时间的后n月

//获取当前的时间  某年的某月总天数
+ (NSString *)mothAllDayWithString:(NSString *)dateStr;
//allday 某年的某月总天数 （年月日）
//获取当前的时间  前一个月   月减去一
+ (NSString *)beforeOneMonthFormater;  //年月日  月减去一

+ (NSString *)beforethirtyDayFormater; //年月日     当前时间的 前30 天
+ (NSString *)beforeSomeDay:(int)someDay; //年月日  前n天
+ (NSString *)beforeOneDayDate:(NSString *)dateString SomeDay:(int)someDay;
//年月日
+ (NSString *)claculateYear:(int)year Month:(int)month  someDay:(int)day;
/*
 *  变更说明 由获取一个月前的的时间改为一个月前的第一天
 */
+ (NSString *)foreMothFirstDayFormater;   //年月日  前一个月  第一天    当前时间为参数
+ (NSString *)foreMothDateFormater;       //年月日  前一个月  最后一天  当前时间为参数
+ (NSString *)firstMothYear;              //年-月   当前时间的第一个月
+ (NSString *)foreMothFormater;           //年-月   前一个月
+ (NSString *)currentMothYear;            //年-月   当前一个月
+ (NSString *)currentYear;                //年      


+ (NSString *)yearMonthNumber:(NSString *)dateString;     //年月日  返回 2012年6月
+ (NSString *)yearMonthNumberLine:(NSString *)dateString; //年月日  返回 2012-06
+ (NSString *)yearMonthTwoNumber:(NSString *)dateString;  //年月日  返回 12年6月

// 字符串转NSDate转NSString
+ (NSDate *)dateFromStr:(NSString *)dateStr;         //年月日
+ (NSDate *)dateFromString:(NSString *)dateString;   //年月日 时分秒
+ (NSString *)stringFromDate:(NSDate *)date;         //年月日
+ (NSString *)stringFromDateSecond:(NSDate *)date;   //年月日 时分秒
+ (NSString *)stringFormDateMonth:(NSDate *)date;    //年-月
/**
 *  年月日 变更说明添加新方法
 **/
+ (NSString *)stringFormDateMonthDay:(NSDate *)date;


+ (int)caculateMonthDayCountWithDate:(NSDate*)_dateString;     //年月日  返回  一个月的天数
+ (NSString * )caculateFirstMonthWithDate:(NSString *)oneDate; //年     返回  年月日这年的第一个月的第一天
+ (NSString * )currentYearFirstDay; //第一个月的第一天

+ (NSString * )monthFirstDay:(NSString *)oneDate;              //年月日  返回  年月日第一天
+ (NSString * )monthLastDay:(NSString *)oneDate;               //年月日  返回  年月日最后一天
+ (NSString * )monthAndDays:(NSString *)oneDate;               //年月日  返回  1月2日
+ (NSString * )monthAndDay:(NSString *)oneDate;                //年月日  返回  01-02

//date   返回  年月日
+ (NSString * )ymdString:(NSString *)dateString;

+ (long long) secondTimeWithDate:(NSString *)timeString;    // 时：分 转化为分
+ (long long) secondYearTimeWithDate;                       // 时:分:秒  转化为分  当前
+ (long long) getDateTimeTOMilliSeconds:(NSDate *)datetime;                  //时间差
+ (BOOL)hourBeforeTime:(NSString *)dateString  thanHour:(int)moreTime;       //大于几小时（moreTime）

+ (int )afterDay:(NSString *)dateString;  //几天后


+ (NSString *)beforeDayDate:(int )dayNum;                                    //几天之前的日期  年 月 日
+ (NSString *)beforeDayDate:(int )dayNum withOneDay:(NSString *)oneDayString;//几天之前的日期  年 月 日
+ (NSString *)afterDayDate:(int )dayNum;                                     //几天之后的日期  年 月 日
+ (NSString *)afterDayDate:(int )dayNum withOneDay:(NSString *)oneDayString; //几天之后的日期  年 月 日
+ (NSString *)getTimeForYear:(int)year month:(int)month ;                    // 根据年、月获取年、月字符串

+ (NSMutableArray *)reverseEnumeratorWithArray:(NSMutableArray *)odlArray; //倒叙



//判断并截取字符串最后一位
+ (NSString *)interceptionStringFormIndex:(NSString *)oldString byString:(NSString *)byString;

+ (NSString *)calculateWanWithNumber:(NSString *)number; // 保留一位小数点 万、百万、亿、百亿、兆
+ (NSString *)calculateNuitWithNumber:(NSString *)number;// 保留一位小数点 万
+ (NSString *)calculatePunishVlue:(NSString *)number;// 保留 2位小数点  单位换算到 万


+ (float)caculateRateFishInAll:(NSString *)fish all:(NSString *)all; // 计算百分比
+ (int)caculateRowWithAllDays:(int )allDays; // 计算行数  整数 除以 7
+ (BOOL)compareStartTime:(NSString *)startStr endTime:(NSString *)endStr ;// 比较开始时间 和 结束时间

//+ (BOOL)checkNetworkAvailableUseASI;


+ (NSString *)changeNumberToImgName:(NSString *)numbtag; //将数字转化为图片名称




//单元测试


// 清除空格
+ (NSString *)clearsSpaceString:(NSString *)strings;
// 清除字符串
+ (NSString *)clearsSpecialString:(NSString *)strings byString:(NSString *)orgString;


// 16进制颜色值
+ (UIColor *)colorWithHexString: (NSString *)color;
+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha;

//排序
+ (NSArray *)sortingArray:(NSArray *)array;


//几秒前 几分钟前 几天前,具体时间
+ (NSString *)setDatamodel:(NSString *)dateString;

//系统版本
+ (NSString *)versionShortSystem;
+ (NSString *)versionSystemBuild;

+ (NSString *)deviceName;
+ (NSString *)deviceModel;
+ (NSString *)devicesystemVersion;
+ (NSString *)devicesystemName;
+ (void)resetDefaults:(NSString *)key ;


//判断app 第一次启动
+ (BOOL)isFirstStartApp ;

+(NSString *)internetStatus ;

#pragma mark - 姓名、电话号码、身份证、银行卡的省略写法
+(NSString *)nameFirst:(NSString*)allName;
+(NSString *)lastPhoneFourNum:(NSString*)phone;
+(NSString *)lastIdentifyFourNum:(NSString*)userIndentify;


+(NSString *) replaceUnicode:(NSString*)aUnicodeString;
+(NSString *) utf8ToUnicode:(NSString *)string;


+(NSString *) phoneNumberTFF :(NSString *)string;

@end





