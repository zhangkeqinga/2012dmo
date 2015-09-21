//
//  UnitPath.m
//  MDBClient
//
//  Created by jhony on 14-5-14.
//  Copyright (c) 2014年 YTO—jhony. All rights reserved.
//

#import "UnitPath.h"
//#import "KeychainItemWrapper.h"

@implementation UnitPath


+ (NSString *) UUID_DEVICE0 {
     
    return [[UIDevice currentDevice] identifierForVendor].UUIDString;
    
}

+ (NSString *) UUID_DEVICE {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyMMddHHmmss"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    int randomValue =arc4random() %[ dateString length];
    NSString *unique = [NSString stringWithFormat:@"%@.%d",dateString,randomValue];
    return unique;
    
}


+(void)set_UUID_DEVICE_save  //是设置手势密码
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[self UUID_DEVICE]  forKey:@"UUID_DEVICE_save"];
}



+(NSString *)UUID_DEVICE_save
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *string = [defaults objectForKey:@"UUID_DEVICE_save"];
    
    if ( !string  || [@"" isEqualToString:string]) {
        
        [self set_UUID_DEVICE_save];
        
        return [self UUID_DEVICE];

    }else{
        
        return string;
    }
}


//钥匙串
//-(void) setKeyChainValue
//{
//    KeychainItemWrapper *keyChainItem=[[KeychainItemWrapper alloc]initWithIdentifier:@"TestUUID" accessGroup:@"XXXXXX.h.HelloWorld"];
//    
//    NSString *strUUID = [keyChainItem objectForKey:(id)kSecValueData];
//    if (strUUID==nil||[strUUID isEqualToString:@""])
//    {
//        [keyChainItem setObject:[self gen_uuid] forKey:(id)kSecValueData];
//    }
//    
//}
//
//-(NSString *) gen_uuid
//{
//    CFUUIDRef uuid_ref=CFUUIDCreate(nil);
//    CFStringRef uuid_string_ref=CFUUIDCreateString(nil, uuid_ref);
//    CFRelease(uuid_ref);
//    NSString *uuid=[NSString stringWithString:(__bridge NSString *)(uuid_string_ref)];
//    CFRelease(uuid_string_ref);
//    return uuid;
//}


// 参数10000   显示  结果 10,000  欧美表示法
+ (NSString *)countNumAndChangeformat:(NSString *)num{
    
    if (!num) {
        return nil;
    }
    
    int count = 0;
    long long int a = num.longLongValue;
    while (a != 0){
        count++;
        a /= 10;
    }
    
    NSMutableString *string = [NSMutableString stringWithString:num];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"," atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    [newstring insertString:string atIndex:0];
    return newstring;

}

+ (float)calculateearningsWithDay:(NSInteger)day_ withMoney:(float)money_ withRate:(float)rate_;
{
    float numbers=0;
    
    if (day_ && money_ && rate_){
         numbers = day_*money_*rate_/365;
    }
    
    return numbers;
}


//判断字符串是否是图片名称 (.png .jpg  .jpeg .)
+ (BOOL)judgmentImageName:(NSString *)imageString;
{
    BOOL isImage=NO;
    if([imageString length] > 5){
        NSString * strings = [imageString substringFromIndex:[imageString length]-4];
        strings = [strings lowercaseString];
        
        if ([@".png" isEqual:strings] ||
            [@".jpg" isEqual:strings] ||
            [@".jpeg" isEqual:strings]  ) {
            
            isImage= YES;
            
        }else{
            isImage= NO;
            
        }
    }

    
    return isImage;
}


+(NSString *)logoutSystemSecondTimes
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    return [dic valueForKey:@"loginSystemTime"];
}


+(BOOL)isLoginSecondTime  //登陆是否过期   7天（NO）
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"user_detail"];
    NSString * times= [dic valueForKey:@"loginSystemTime"];
    if (!times){
        return YES;
    }
    
    else{
        int day=7;
        NSString *dayString=YTOnLineTime; //在线参数 明确时间为7天后重新登陆
        
        if (dayString) {
            day = [dayString integerValue];
        }
        
        
        if ([UnitPath afterDay:times]<day && [UnitPath afterDay:times]>-1){
            return NO;
        }else{
            return YES;
        }
        
    }
}



+ (NSArray *)currentDate{

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    now=[NSDate date];
    
    comps = [calendar components:unitFlags fromDate:now];
    
    NSInteger week = [comps weekday];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSInteger hour = [comps hour];
    NSInteger min = [comps minute];
    NSInteger sec = [comps second];
    NSInteger year = [comps year];

    NSString * weekstring=[NSString stringWithFormat:@"%ld",(long)week];
    NSString * monthtring=[NSString stringWithFormat:@"%ld",(long)month];
    NSString * daytring=[NSString stringWithFormat:@"%ld",(long)day];
    NSString * hourtring=[NSString stringWithFormat:@"%ld",(long)hour];
    NSString * mintring=[NSString stringWithFormat:@"%ld",(long)min];
    NSString * sectring=[NSString stringWithFormat:@"%ld",(long)sec];
    NSString * yeartring=[NSString stringWithFormat:@"%ld",(long)year];

    NSArray *array=[[NSArray alloc ]initWithObjects:monthtring,daytring,hourtring,mintring,sectring,weekstring, yeartring,nil];

    
    return array;
}

+ (NSString *)getYearWithDate:(NSString *)dateString{
    
    NSString *year=[NSString string];
    NSArray *arrays=[UnitPath currentDateWithDate:dateString];
    year =[arrays objectAtIndex:6];
    return year;
}


+ (NSArray *)currentDateWithDate:(NSString *)dateString {  //年月日
    
    NSDate *now=[self dateFromStr:dateString];

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    comps = [calendar components:unitFlags fromDate:now];
    
    NSInteger week = [comps weekday];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSInteger hour = [comps hour];
    NSInteger min = [comps minute];
    NSInteger sec = [comps second];
    NSInteger year = [comps year];
    
    NSString * weekstring=[NSString stringWithFormat:@"%ld",(long)week];
    NSString * monthtring=[NSString stringWithFormat:@"%ld",(long)month];
    NSString * daytring=[NSString stringWithFormat:@"%ld",(long)day];
    NSString * hourtring=[NSString stringWithFormat:@"%ld",(long)hour];
    NSString * mintring=[NSString stringWithFormat:@"%ld",(long)min];
    NSString * sectring=[NSString stringWithFormat:@"%ld",(long)sec];
    NSString * yeartring=[NSString stringWithFormat:@"%ld",(long)year];
    
    NSArray *array=[[NSArray alloc ]initWithObjects:monthtring,daytring,hourtring,mintring,sectring,weekstring, yeartring,nil];
    
    return array;
}


+ (NSString *)currentDateSecond{//年月日 时分秒
    NSDate *date=[NSDate date];
    NSString *current=[UnitPath stringFromDateSecond:date];
    return current;
}

+ (NSString *)currentDateSecondClander{    //年月日 时分秒

    NSArray *array=[self currentDate];
    NSString * monthtring=[array objectAtIndex:0];
    NSString * daytring=[array objectAtIndex:1];
    NSString * hourtring=[array objectAtIndex:2];
    NSString * mintring=[array objectAtIndex:3];
    NSString * sectring=[array objectAtIndex:4];
    NSString * yeartring=[array objectAtIndex:6];
    NSString * dates=[NSString stringWithFormat:@"%@-%@-%@ %@:%@:%@",yeartring,monthtring,daytring,hourtring,mintring,sectring];
    
    return dates;
    
}


//获取当前的时间
+ (NSString *)currentDateFormater{  //年月日
    NSDate *date=[NSDate date];
    NSString *current=[UnitPath stringFromDate:date];
    return current;
}




// 字符串转NSDate
+ (NSDate *)dateFromStr:(NSString *)dateStr{

    
    NSString *stringDate=[NSString string];
    
    NSArray *array=[dateStr componentsSeparatedByString:@"-"];
    
    if ([array count]<=2) {
        stringDate =[UnitPath currentDateFormater];
    }else{
        stringDate =[NSString stringWithFormat:@"%@-%@-%@",[array objectAtIndex:0],[array objectAtIndex:1],[array objectAtIndex:2]];
    }
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSDate *destDate= [dateFormatter dateFromString:stringDate];
    return destDate;
    
    
}
+ (NSDate *)dateFromString:(NSString *)dateString{
    
    NSString *stringDate=[NSString string];

    if ([@"" isEqual:dateString] || (NSNull *)dateString == [NSNull null]) {
        return nil;
    }
    DLog(@"dateString=%@",dateString);
    if ([@"1" isEqual:dateString]) {
        return nil;
    }
    NSArray *array=[dateString componentsSeparatedByString:@"-"];
    
    if ([array count]<=2) {
        stringDate =[UnitPath currentDateFormater];
    }else{
        stringDate =[NSString stringWithFormat:@"%@-%@-%@",[array objectAtIndex:0],[array objectAtIndex:1],[array objectAtIndex:2]];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:stringDate];
    return destDate;
}




//获取当前的时间  某年的某月总天数
+ (NSString *)mothAllDay:(NSDate *)date{  //年月日
    
    NSDate *today = date;
    NSCalendar *c = [NSCalendar currentCalendar];
    NSRange days = [c rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:today];
    NSString *string=[NSString stringWithFormat:@"%ld",(long)days.length]; //DLog(@"days=%d",days.length);
    
    return string;
}

+ (NSString * )getMonth:(NSString *)oneDate{
    NSArray *array=[oneDate componentsSeparatedByString:@"-"];
    NSString *string=[NSString string];
    if ([array count]>=2) {
        string=[NSString stringWithFormat:@"%@",[array objectAtIndex:1]];
    }else{
        string=@"01";
        DLog(@"日期错误，请修改！");
    }
    
    return string;
    
}


//获取当前的时间  某年的某月总天数
+ (NSString *)mothAllDayWithString:(NSString *)dateStr{  //年月日

    NSDate *oneDay = [self  dateFromStr:dateStr];
    return [self mothAllDay:oneDay];

}


//获取当前的时间  前一个月   月减去一
+ (NSString *)beforeOneMonthFormater{  //年月日
    
    NSString *nowDate=[self currentDateFormater];
    NSInteger startMonth = [[self getMonth:nowDate] integerValue];
    NSInteger startYear = [[self getYear:nowDate] integerValue];
    NSInteger startDay = [[[self currentDate] objectAtIndex:1] integerValue];

    if (startMonth>1) {
        startMonth = startMonth-1;
    }else{
        startMonth = 12;
        startYear = startYear-1;
    }
    
    NSString *time =[NSString string];
    NSString *timeM =[NSString string];
    NSString *timeD =[NSString string];

    if (startMonth<10) {
        timeM =[NSString stringWithFormat:@"0%ld",(long)startMonth];
    }else{
        timeM =[NSString stringWithFormat:@"%ld",(long)startMonth];
    }
    
    if (startDay<10) {
        timeD =[NSString stringWithFormat:@"0%ld",(long)startDay];
    }else{
        timeD =[NSString stringWithFormat:@"%ld",(long)startDay];
    }

    time =[NSString stringWithFormat:@"%ld-%@-%@",(long)startYear,timeM,timeD];

    return time;
}


//获取当前的时间  前30天
+ (NSString *)beforethirtyDayFormater{  //年月日
    
    int beforeDay=30;
    
    return  [self beforeSomeDay:beforeDay];
    
}


//年月日  获取当前的时间  前n天
+ (NSString *)beforeSomeDay:(int)someDay{  //年月日
    
    NSString *nowDate=[self currentDateFormater];
    return  [self beforeOneDayDate:nowDate SomeDay:someDay];
}

//获取某天的时间  前n月
+ (NSString *)beforeSomeMonth:(int)somemonth  withNowTime:(NSString *)string{
    
    NSString *date=string;
    if(!string){
        string=[self currentDateFormater];
        DLog(@"日期错误，请修改！-");
    }
    NSString *startMonth = [self getMonth:date];
    NSString *startYear = [self getYear:date];
    int year=startYear.intValue;
   
    int month=startMonth.intValue;
    
    if(somemonth/12>0){
        year = startYear.intValue-((somemonth-startMonth.intValue)/12);
        
        if (month-(somemonth%12)>0) {
            month=month-(somemonth%12);
        }else{
            month=12+month-(somemonth%12);
            year=year-1;
        }
        
    }else{
        if (month-(somemonth%12)>0) {
            month=month-(somemonth%12);
        }else{
            month=12+month-(somemonth%12);
            year=year-1;
        }
    }
    
    NSString * stringTime=[NSString string];

    if (month <10 && month>0) {
        stringTime=[NSString stringWithFormat:@"%d-0%d",year,month];
    }else{
        stringTime=[NSString stringWithFormat:@"%d-%d",year,month];
    }
    
    NSLog(@"zhang==%@",stringTime);
    return stringTime;
    
//    year=startYear.intValue-(((somemonth-startMonth.intValue)/12)+1);
//    NSString *someYear=[NSString stringWithFormat:@"%d",year];
////    NSLog(@"jing==%@",[NSString stringWithFormat:@"%@-%d",someYear,12-((somemonth-startMonth.intValue)%12)]);
//    return [NSString stringWithFormat:@"%@-%d",someYear,12-(int)fabs(((somemonth-startMonth.intValue)%12))];
    
}


//获取某天的时间  后 n月
+ (NSString *)afterSomeMonth:(int)somemonth  withTime:(NSString *)string{
    
    NSString *date=string;
    if(!string){
        string=[self currentDateFormater];
        DLog(@"日期错误，请修改！-");
    }
    NSString *startMonth = [self getMonth:date];
    NSString *startYear = [self getYear:date];
   
    if (startMonth.intValue+1<=12) {
        startMonth =[NSString stringWithFormat:@"%d",startMonth.intValue+1];
    }else{
        startMonth =[NSString stringWithFormat:@"%d",1];
        startYear  =[NSString stringWithFormat:@"%d",startYear.intValue+1];
    }
    
    NSString *timesn=[NSString string];

    if ([startMonth integerValue]<10) {
        timesn=[NSString stringWithFormat:@"%@-0%@",startYear,startMonth];
    }else {
        timesn=[NSString stringWithFormat:@"%@-%@",startYear,startMonth];
    }
    
    return timesn;
    
}

//获取当前的时间  前n月
+ (NSString *)beforeSomeMonth:(int)someDay{
    
    NSString *date=[self currentDateFormater];
    NSString *startMonth = [self getMonth:date];
    NSString *startYear = [self getYear:date];
    
    int year=startYear.intValue-(((someDay-startMonth.intValue)/12)+1);
    NSString *someYear=[NSString stringWithFormat:@"%d",year];
    
    int month=12-((someDay-startMonth.intValue)%12);
    NSString *someMonth=[NSString string];

    if (month<10) {
        someMonth=[NSString stringWithFormat:@"0%d",month];
    }else{
        someMonth=[NSString stringWithFormat:@"%d",month];
    }
    
    return [NSString stringWithFormat:@"%@-%@",someYear,someMonth];
    
}

//年月日 获取某天时间  前n天  2013-01-01
+ (NSString *)beforeOneDayDate:(NSString *)dateString SomeDay:(int)someDay{  //年月日
   
    NSTimeInterval secondsPerDay = 24 * 60 * 60*someDay;
    NSDate *today = [self dateFromStr:dateString];
    NSDate  *yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    return  [self stringFromDate:yesterday];
    
    
}



+ (NSString *)claculateYear:(int)year Month:(int)month  someDay:(int)day{
    if (month-1<=0) {
        month=12;
        if (year-1<=0) year=1;
        else  year=year-1;
    }else{
        month=month-1;
    }
    
    NSString *oneDate=[NSString stringWithFormat:@"%d-%d-%d",year,month,1];
    int allDay=[self caculateMonthDayCountWithDate:[self dateFromStr:oneDate]];
    day=allDay-day;

    if (day<=0) {
        [self claculateYear:(year) Month:(month) someDay:(-day)];
    }else{
        return [NSString stringWithFormat:@"%d-%d-%d",year,month,day];
    }
    
    return nil;
}



//获取当前的时间  前一个月 的第一天
+ (NSString *)foreMothFirstDayFormater{  //年月日
    
    NSDate *date=[NSDate date];
    NSString *current=[UnitPath stringFromDate:date];
    NSArray  *array=[current componentsSeparatedByString:@"-"];
    NSString *string1=[array objectAtIndex:0];
    NSString *string2=[array objectAtIndex:1];
    
    int number=[string2 intValue]-1;
    int number1=[string1 intValue];

    //如果是2014年1月  那么前一个月就是2013年12月
    if (number<=0) {
        number1=number1-1;
        string1=[NSString stringWithFormat:@"%d",number1];
        string2=[NSString stringWithFormat:@"12"];
        number=string2.intValue;
    }
    
    if (number<10) {
        string2=[NSString stringWithFormat:@"0%d",number];
    }else{
        string2=[NSString stringWithFormat:@"%d",number];
    }
    NSString *currentstring=[NSString stringWithFormat:@"%@-%@-01",string1,string2];
    DLog(@"currentstring=%@",currentstring);
    return currentstring;
    
}

//获取当前的时间  前一个月 的最后一天
+ (NSString *)foreMothDateFormater{  //年月日
    
    NSDate *date=[NSDate date];
    NSString *current=[UnitPath stringFromDate:date];
    NSArray  *array=[current componentsSeparatedByString:@"-"];
    NSString *string1=[array objectAtIndex:0];
    NSString *string2=[array objectAtIndex:1];
    
    int number=[string2 intValue]-1;
    int number1=[string1 intValue];
    
    //如果是2014年1月  那么前一个月就是2013年12月
    if (number<=0) {
        number1=number1-1;
        string1=[NSString stringWithFormat:@"%d",number1];
        string2=[NSString stringWithFormat:@"12"];
        number=string2.intValue;
    }
    
    if (number<10) {
        string2=[NSString stringWithFormat:@"0%d",number];
    }else{
        string2=[NSString stringWithFormat:@"%d",number];
    }
    NSString *currentstring=[NSString stringWithFormat:@"%@-%@-%@",string1,string2,[self mothAllDayWithString:[self foreMothFirstDayFormater]]];
    
    return currentstring;

}
//年-月  前一个月
+ (NSString *)foreMothFormater{
    return  [UnitPath stringFormDateMonth: [UnitPath dateFromStr:[UnitPath foreMothDateFormater]]];
}

//年-月  当前时间的第一个月
+ (NSString *)firstMothYear{
    NSString *stringYeat=[UnitPath getYearWithDate:[UnitPath foreMothDateFormater]];
    NSString *stringYeats=[stringYeat stringByAppendingString:@"-01"];
    NSLog(@"stringYeat=%@",stringYeats);
    return   stringYeats;
}
+ (NSString *)currentMothYear{           //年-月   当月
    return  [UnitPath stringFormDateMonth: [UnitPath dateFromStr:[UnitPath currentDateFormater]]];
}

+ (NSString *)currentYear{           //年-月   当月
    return  [UnitPath getYear:[UnitPath currentDateFormater]];
}


+ (NSString *)yearMonthTwoNumber:(NSString *)dateString{  //年月日  返回 12年6月
    NSArray *array=[dateString componentsSeparatedByString:@"-"];
    NSString *strings;
    if ([array count]>2) {
        NSString *string1=[array objectAtIndex:0];
        NSString *string2=[array objectAtIndex:1];
        int num1=[string1 intValue];
        int num2=[string2 intValue];
        num1=num1 %100;
        strings=[NSString stringWithFormat:@"%d年%d月",num1,num2];
    }else{
        strings=@"";
    }
    return strings;
    
}

+ (NSString *)yearMonthNumber:(NSString *)dateString{  //年月日  返回 2012年6月
    NSArray *array=[dateString componentsSeparatedByString:@"-"];
    NSString *strings;
    if ([array count]>2) {
        NSString *string1=[array objectAtIndex:0];
        NSString *string2=[array objectAtIndex:1];
        int num1=[string1 intValue];
        int num2=[string2 intValue];
        strings=[NSString stringWithFormat:@"%d年%d月",num1,num2];
    }else{
        strings=@"";
    }
    return strings;
    
}

+ (NSString *)yearMonthNumberLine:(NSString *)dateString{     //年月日  返回 2012-06

    NSArray *array=[dateString componentsSeparatedByString:@"-"];
    NSString *strings=[NSString string];
    if ([array count]>=2) {
        NSString *string1=[array objectAtIndex:0];
        NSString *string2=[array objectAtIndex:1];
        strings=[NSString stringWithFormat:@"%@-%@",string1,string2];
    }else{
        strings=@"2014-01";
        DLog(@"日期错误，请修改！");
    }
    return strings;

}

+ (NSString *)stringFromDate:(NSDate *)date{ //年月日
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
    
}

+ (NSString *)stringFromDateSecond:(NSDate *)date{//年月日 时分秒
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd  HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
    
}

+ (NSString *)stringFormDateMonth:(NSDate *)date {//年-月
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    NSInteger year = [dateComponent year];
    NSInteger month = [dateComponent month];
    
    return [UnitPath getTimeForYear:year month:month];
}

/**
 *  年月日
**/
+ (NSString *)stringFormDateMonthDay:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    NSInteger year = [dateComponent year];
    NSInteger month = [dateComponent month];
    NSInteger day = [dateComponent day];
//    DLog(@"day==%d",day);
    return [UnitPath getTimeForYearMothDay:year month:month day:day ];
}

//将秒转化为NSDate

+ (NSDate *)getDateTimeFromMilliSeconds:(long long) miliSeconds
{
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli/1000.0;
    
    return [NSDate dateWithTimeIntervalSince1970:seconds];
}


+ (long long) secondTimeWithDate:(NSString *)timeString{ //时：分 转化为分
    
    NSArray *array=[timeString  componentsSeparatedByString:@":"];
    long long sectTime=0;
    
    if ([array count]>=2) {
        sectTime=[[array objectAtIndex:0] integerValue] *60.0+[[array objectAtIndex:1] integerValue];
    }
    
    return sectTime;
}


+ (long long) secondYearTimeWithDate{ // 时:分:秒  转化为分
    
    NSString * timeString=[self currentDateSecond];
    NSArray *array=[timeString  componentsSeparatedByString:@" "];
    NSString * timeString1=[array objectAtIndex:1];
    NSArray *array1=[timeString1  componentsSeparatedByString:@":"];
    
    long long sectTime=0;
    
    if ([array1 count]>=3) {
        sectTime=[[array objectAtIndex:0] integerValue] *60.0+[[array objectAtIndex:1] integerValue];
    }
    
    return sectTime;
    
}

// 获取这个时间与1970之间的（毫秒）时间差

+ (long long)getDateTimeTOMilliSeconds:(NSDate *)datetime
{
    NSTimeInterval interval = [datetime timeIntervalSince1970];
    long long totalMilliseconds = interval*1000 ;
    return totalMilliseconds;
}


//必须带上   时分秒  是否大于 5小时
+ (BOOL)hourBeforeTime:(NSString *)dateString  thanHour:(int)moreTime{
    
    if (!dateString) {
        return NO;
    }
    
    if ([@"1" isEqual:dateString]) {
        return NO;
    
    }
    
    NSDate *_data = [UnitPath dateFromString:dateString];
    
//    NSDate *_data = [NSDate date];

    long long mill = [UnitPath getDateTimeTOMilliSeconds:_data];  // 过去的时间
    
    NSDate *date_new = [NSDate date];
    long long mill_news = [UnitPath getDateTimeTOMilliSeconds:date_new];  // 当前时间
    
    long long time_c = mill_news - mill;
    
    float h = (float) (time_c/3600000);//得出的时间间隔的单位是小时
    
//    int m = (int) ((time_c%3600000)/60000);//得出的时间间隔的单位是分钟
//    DLog(@"m==%d",m);

    
    if (h>moreTime) {
        return YES;
    }else{
        
        return NO;
    }
    
}


//必须带上   时分秒
+ (NSString *)setDatamodel:(NSString *)dateString{
    
    NSDate *_data = [UnitPath dateFromString:dateString];
    
    long long mill = [UnitPath getDateTimeTOMilliSeconds:_data];  // 过去的时间
    
    NSDate *date_new = [NSDate date];
    long long mill_news = [UnitPath getDateTimeTOMilliSeconds:date_new];  // 当前时间
    long long time_c = mill_news - mill;
    
    NSString *interval = [NSString stringWithFormat:@""];

    if(time_c/1000 < 10 && time_c/1000 >= 0) {
        interval = [NSString stringWithFormat:@"刚刚"];
        
        
    } else if(time_c/1000 < 60 && time_c/1000 > 0) {
        
        int se = (int) ((time_c%60000)/1000);
        interval = [NSString stringWithFormat:@"%d秒前",se];
        
        
    }else if(time_c/60000 < 60 && time_c/60000 > 0) {
        
        int m = (int) ((time_c%3600000)/60000);//得出的时间间隔的单位是分钟
        interval = [NSString stringWithFormat:@"%d分钟前",m];
        
    }else if(time_c/3600000 < 24 && time_c/3600000 >= 0) {
        //如果时间间隔小于24小时则显示多少小时前
        int h = (int) (time_c/3600000);//得出的时间间隔的单位是小时
        interval = [NSString stringWithFormat:@"%d小时前",h];
        
    }else if(time_c/3600000/24 < 365 && time_c/3600000/24 >= 0) {
        //如果时间间隔小于24小时则显示多少小时前
        int h = (int) (time_c/3600000/24);//得出的时间间隔的单位是tian
        interval = [NSString stringWithFormat:@"%d天前",h];
        
    }
    
    return interval;
}



//必须带上   时分秒   结果单位（天）
+ (int )afterDay:(NSString *)dateString{
    
    NSDate *_data = [UnitPath dateFromString:dateString];
    
    long long mill = [UnitPath getDateTimeTOMilliSeconds:_data];  // 过去的时间
    
    NSDate *date_new = [NSDate date];
    long long mill_news = [UnitPath getDateTimeTOMilliSeconds:date_new];  // 当前时间
    long long time_c = mill_news - mill;
   
    
    int h = (int) (time_c/3600000/24);  //得出的时间间隔的单位（天）
   
    return h;
}



// 几天之前的日期  年 月 日
+ (NSString *)beforeDayDate:(int )dayNum{
    
    NSDate *date_new = [NSDate date];
    long long mill_news = [UnitPath getDateTimeTOMilliSeconds:date_new];  // 当前时间
    long long mill = mill_news - 3600000.0*24*dayNum;
    mill=mill/1000;
    NSString *interval = [NSString stringWithFormat:@""];
    NSString *sstrings=[NSString stringWithFormat:@"%lld",mill];
    
    NSTimeInterval timeInterval = [sstrings doubleValue];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    interval=[self stringFromDate:date2];
    
    return interval;
}

+ (NSString *)beforeDayDate:(int )dayNum withOneDay:(NSString *)oneDayString{//几天之前的日期  年 月 日
    
    
    NSDate *  date_new  = [UnitPath dateFromStr:oneDayString];
    long long mill_news = [UnitPath getDateTimeTOMilliSeconds:date_new];  // 当前时间
    long long mill = mill_news - 3600000.0*24*dayNum;
    mill=mill/1000;
    
    NSString *interval = [NSString stringWithFormat:@""];
    NSString *sstrings=[NSString stringWithFormat:@"%lld",mill];
    
    NSTimeInterval timeInterval = [sstrings doubleValue];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    interval=[self stringFromDate:date2];
    
    return interval;




}


// 几天之后的时间计算  日期  年 月 日
+ (NSString *)afterDayDate:(int )dayNum{
    
    NSDate *date_new = [NSDate date];
    long long mill_news = [UnitPath getDateTimeTOMilliSeconds:date_new];  // 当前时间
    long long mill = mill_news + 3600000.0*24*dayNum;
    mill=mill/1000;
    NSString *interval = [NSString stringWithFormat:@""];
    NSString *sstrings=[NSString stringWithFormat:@"%lld",mill];
    
    NSTimeInterval timeInterval = [sstrings doubleValue];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    interval=[self stringFromDate:date2];
    
    return interval;
}



// 从某一天开始计算几天之后的  日期  年 月 日
+ (NSString *)afterDayDate:(int )dayNum  withOneDay:(NSString *)oneDayString{
    
    NSDate *  date_new  = [UnitPath dateFromStr:oneDayString];
    long long mill_news = [UnitPath getDateTimeTOMilliSeconds:date_new];  // 当前时间
    long long mill = mill_news + 3600000.0*24*dayNum;
    mill=mill/1000;

    NSString *interval = [NSString stringWithFormat:@""];
    NSString *sstrings=[NSString stringWithFormat:@"%lld",mill];
    
    NSTimeInterval timeInterval = [sstrings doubleValue];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    interval=[self stringFromDate:date2];
    
    return interval;
}



// 保留 一位小数点  单位换算到 万
+ (NSString *)calculateNuitWithNumber:(NSString *)number{
    
    NSString *string=[NSString string];
    if (number==NULL || number==nil) {
        string=@"0";
        return string;
    }
    
    double num=[number doubleValue];
    
  if (num/10000>=1) {
        string=[NSString stringWithFormat:@"%.2f",num/10000];
        string=[UnitPath interceptionStringFormIndex:string byString:@"0"];
        string=[UnitPath interceptionStringFormIndex:string byString:@"."];
        string=[NSString stringWithFormat:@"%@万",string];
        
    }else{
        
        string=[NSString stringWithFormat:@"%.0f",num];
    }
    
    return string;
    
}


// 保留 2位小数点  单位换算到 万
+ (NSString *)calculatePunishVlue:(NSString *)number{
    
    NSString *string=[NSString string];
    if (number==NULL || number==nil) {
        string=@"0";
        return string;
    }
    
    double num=[number doubleValue];
    if (num ==378380) {
        
    }
    if (num/10000>=1) {
//        string=[NSString stringWithFormat:@"%.2f",num/10000];
        
        string=[NSString stringWithFormat:@"%.2f",(round(num/100))/100];
        string=[UnitPath interceptionStringFormIndex:string byString:@"0"];
        string=[UnitPath interceptionStringFormIndex:string byString:@"."];
        string=[NSString stringWithFormat:@"%@万",string];
        
    }else{
        
        string=[NSString stringWithFormat:@"%.0f元",num];
    }
    
    return string;
    
}






// 保留 一位小数点  单位换算
+ (NSString *)calculateWanWithNumber:(NSString *)number{
    
    //42 9496 7296 // 42 万
    //21亿
    //
    //1 0000 0000 0000
    
    NSString *string=[NSString string];
    
    if (number==NULL || number==nil) {
        string=@"0";
        return string;
    }
    
    double num=[number doubleValue];
    
    if       (num/1000000000000>=1) {
        string=[NSString stringWithFormat:@"%.1f",num/1000000000000];
        string=[UnitPath interceptionStringFormIndex:string byString:@"0"];
        string=[UnitPath interceptionStringFormIndex:string byString:@"."];
        string=[NSString stringWithFormat:@"%@兆",string];
        
    }else if (num/10000000000>=1) {
        string=[NSString stringWithFormat:@"%.1f",num/10000000000];
        string=[UnitPath interceptionStringFormIndex:string byString:@"0"];
        string=[UnitPath interceptionStringFormIndex:string byString:@"."];
        string=[NSString stringWithFormat:@"%@百亿",string];

    }else if (num/100000000>=1) {
        string=[NSString stringWithFormat:@"%.1f",num/100000000];
        string=[UnitPath interceptionStringFormIndex:string byString:@"0"];
        string=[UnitPath interceptionStringFormIndex:string byString:@"."];
        string=[NSString stringWithFormat:@"%@亿件",string];

    }else if (num/1000000>=1) {
        string=[NSString stringWithFormat:@"%.1f",num/1000000];
        string=[UnitPath interceptionStringFormIndex:string byString:@"0"];
        string=[UnitPath interceptionStringFormIndex:string byString:@"."];
        string=[NSString stringWithFormat:@"%@百万",string];

    }else if (num/10000>=1) {
        string=[NSString stringWithFormat:@"%.1f",num/10000];
        string=[UnitPath interceptionStringFormIndex:string byString:@"0"];
        string=[UnitPath interceptionStringFormIndex:string byString:@"."];
        string=[NSString stringWithFormat:@"%@万",string];

    }else{
        string=[NSString stringWithFormat:@"%.0f件",num];
    }
    
    return string;
    
}





+ (NSString *)interceptionStringFormIndex:(NSString *)oldString byString:(NSString *)byString
{
    
    NSString *newString=oldString;
    NSInteger count=[oldString length];
    
    for (NSInteger i=count; i>0; i--) {
        
        NSRange range={i-1 ,1};
        NSString *string=[oldString substringWithRange:range];

        if ([byString isEqualToString:string]) {
            
            newString =[oldString substringToIndex:i-1];
            
            [UnitPath interceptionStringFormIndex:newString byString:byString];
            
        }else{
            
            break;
        }
        
    }
    
    return newString;

}


+ (float)caculateRateFishInAll:(NSString *)fish all:(NSString *)all{
    
    
    float rate=0.0;
    double fishNum=[fish doubleValue]*100;
    double allNum=[all doubleValue];
    
    if (allNum<=0) {
        rate=0.0;
        return rate;
    }
    
    rate=(fishNum/allNum)*0.010;
    
    if (rate>1.0) {
        rate=1;
    }
    
    return rate;
}

//根据年月判断 一个月的天数
+ (int)caculateMonthDayCountWithDate:(NSDate*)_dateString
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSRange daysRange =[currentCalendar rangeOfUnit:NSDayCalendarUnit
                                             inUnit:NSMonthCalendarUnit
                                            forDate:_dateString];
    return (int)daysRange.length;
}


//根据年获取  这年的第一个月 的 第一天
+ (NSString * )caculateFirstMonthWithDate:(NSString *)oneDate
{
    NSArray *array=[self currentDateWithDate:oneDate];
    NSString *yearStr=[NSString string];
    if ([array count]>=7) {
        yearStr=[array objectAtIndex:6];
    }
    yearStr=[yearStr stringByAppendingString:@"-01-01"];
    
    return yearStr;
}
+ (NSString * )currentYearFirstDay{ //第一个月的第一天
    return [self caculateFirstMonthWithDate:[self currentDateFormater]];
}


+ (NSString * )monthFirstDay:(NSString *)oneDate{             //返回年月日第一天  参数 2014-01-01

    NSArray *array=[oneDate componentsSeparatedByString:@"-"];
    NSString *string=[NSString string];
    if ([array count]>=2) {
        string=[NSString stringWithFormat:@"%@-%@-01",[array objectAtIndex:0],[array objectAtIndex:1]];
    }else{
        string=@"2014-01-01";
        DLog(@"日期错误，请修改！");
    }

    return string;

}

+ (NSString * )monthLastDay:(NSString *)oneDate{              //返回年月日第 last 天  参数 2014-01-31
    NSArray *array=[oneDate componentsSeparatedByString:@"-"];
    NSString *string=[NSString string];
    
    int allDay=[self caculateMonthDayCountWithDate:[self dateFromStr:oneDate]];
    
    if ([array count]==3) {
        string=[NSString stringWithFormat:@"%@-%@-%d",[array objectAtIndex:0],[array objectAtIndex:1],allDay];
    }else{
        string=@"2014-01-30";
        DLog(@"日期错误，请修改！");
    }
    
    return string;

}


+ (NSString * )monthAndDays:(NSString *)oneDate{                //年月日  返回  1月2日
    NSArray *array=[oneDate componentsSeparatedByString:@"-"];
    NSString *string=[NSString string];
    if ([array count]==3) {
        string=[NSString stringWithFormat:@"%@月%@日",[array objectAtIndex:1],[array objectAtIndex:2]];
    }else{
        string=@"1月1日";
        DLog(@"日期错误，请修改！");
    }
    
    return string;
}
+ (NSString * )monthAndDay:(NSString *)oneDate{                //年月日  返回  01-02
    NSArray *array=[oneDate componentsSeparatedByString:@"-"];
    NSString *string=[NSString string];
    if ([array count]==3) {
        string=[NSString stringWithFormat:@"%@-%@",[array objectAtIndex:1],[array objectAtIndex:2]];
    }else{
        string=@"01-30";
        DLog(@"日期错误，请修改！");
    }
    
    return string;
}

//date   返回  年月日
+ (NSString * )ymdString:(NSString *)dateString{
    
    NSRange range;
    range.location = 0;
    range.length = 10;

    NSString *string=[dateString substringWithRange:range];
    return string;
}



//数组倒叙
+ (NSMutableArray *)reverseEnumeratorWithArray:(NSMutableArray *)odlArray{
    NSMutableArray *newAarray=[[NSMutableArray alloc]initWithCapacity:0];
    newAarray = (NSMutableArray *)[[odlArray reverseObjectEnumerator] allObjects];
    return newAarray;
}



//计算行数  整数 除以 7
+ (int)caculateRowWithAllDays:(int )allDays{
    int  row=0;
    if (allDays%7==0){
        row= allDays/7;
    }else{
        row= 1+allDays/7;
    }
    return row;
}


// 根据年  月 获取年、月字符串
+ (NSString *)getTimeForYear:(NSInteger)year month:(NSInteger)month {
    NSString *monStr;
    if (month<10) {
        monStr = [NSString stringWithFormat:@"0%ld",(long)month];
    }else {
        monStr = [NSString stringWithFormat:@"%ld",(long)month];
    }
    NSString *timeStr = [NSString stringWithFormat:@"%ld-%@",(long)year,monStr];
    return timeStr;
}


+ (NSString *)getTimeForYearMothDay:(NSInteger)year month:(NSInteger)month  day:(NSInteger)day_{
    NSString *monStr=[NSString string];
    NSString *dayStr=[NSString string];

    if (month<10) {
        monStr = [NSString stringWithFormat:@"0%ld",(long)month];
    }else {
        monStr = [NSString stringWithFormat:@"%ld",(long)month];
    }
    
    if (day_<10) {
        dayStr = [NSString stringWithFormat:@"0%ld",(long)day_];
    }else {
        dayStr = [NSString stringWithFormat:@"%ld",(long)day_];
    }
    NSString *timeStr = [NSString stringWithFormat:@"%ld-%@-%@",(long)year,monStr,dayStr];
    return timeStr;
}

+ (NSString *)getYear:(NSString *)oneDate{
    NSArray *array=[oneDate componentsSeparatedByString:@"-"];
    NSString *string=[NSString string];
    if ([array count]>=2) {
        string=[NSString stringWithFormat:@"%@",[array objectAtIndex:0]];
    }else{
        string=@"2000";
        DLog(@"日期错误，请修改！");
    }
    
    return string;

}


+ (NSMutableArray *)retYearMonth:(NSString *)startDate{
    NSString *startMonth = [UnitPath getMonth:startDate];
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    if(startMonth.intValue == 2){
        for(int i=1;i<=28;i++){
            if(i<10){
                [arr addObject:[NSString stringWithFormat:@"%@0%d",startMonth,i]];
            }else{
                [arr addObject:[NSString stringWithFormat:@"%@%d",startMonth,i]];
            }
        }
    }else if(startMonth.intValue == 4 ||
             startMonth.intValue == 6 ||
             startMonth.intValue == 9 ||
             startMonth.intValue == 11){
        for(int i=1;i<=30;i++){
            if(i<10){
                [arr addObject:[NSString stringWithFormat:@"%@0%d",startMonth,i]];
            }else{
                [arr addObject:[NSString stringWithFormat:@"%@%d",startMonth,i]];
            }
        }
    }else {
        for(int i=1;i<=31;i++){
            if(i<10){
                [arr addObject:[NSString stringWithFormat:@"%@0%d",startMonth,i]];
            }else{
                [arr addObject:[NSString stringWithFormat:@"%@%d",startMonth,i]];
                
            }
        }

    }
    return arr;
}


+ (NSMutableArray *)getTimeForYearMoth:(NSString *)startDate endDate:(NSString *)endDate{
    
    NSString *startYear = [UnitPath getYear:[UnitPath yearMonthNumberLine:startDate]];
    NSString *endYear = [UnitPath getYear:[UnitPath yearMonthNumberLine:endDate]];
    NSString *startMonth = [UnitPath getMonth:[UnitPath yearMonthNumberLine:startDate]];
    NSString *endMonth = [UnitPath getMonth:[UnitPath yearMonthNumberLine:endDate]];
    
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    NSMutableArray *brr=[[NSMutableArray alloc]init];
    if(endYear.intValue == startYear.intValue){
        for(int i=startMonth.intValue;i<=endMonth.intValue;i++){
            [arr addObject:[NSString stringWithFormat:@"%@%d",startYear,i]];
        }
    }else if(endYear.intValue > startYear.intValue){
        for(int y=startMonth.intValue;y<=12;y++){
            if(y<10){
                [brr addObject:[NSString stringWithFormat:@"%@0%d",startYear,y]];
            }else{
                [brr addObject:[NSString stringWithFormat:@"%@%d",startYear,y]];
            }

        }
     
        for(int i=startYear.intValue+1;i<endYear.intValue;i++){
            for (int j=1;j<=12;j++){

                
                if(j<10){
                    [brr addObject:[NSString stringWithFormat:@"%d0%d",i,j]];
                }else{
                    [brr addObject:[NSString stringWithFormat:@"%d%d",i,j]];
                }
                
            }
        }
        for (int x=1;x<=endMonth.intValue;x++){
            if(x<10){
                [brr addObject:[NSString stringWithFormat:@"%@0%d",endYear,x]];
            }else{
                [brr addObject:[NSString stringWithFormat:@"%@%d",endYear,x]];
            }
        }
        arr=brr;
    }
    
    return arr;
}

// 比较开始时间 和 结束时间
+ (BOOL)compareStartTime:(NSString *)startStr endTime:(NSString *)endStr {
    NSComparisonResult result = [startStr compare:endStr];
    if (result == NSOrderedDescending) {
        return NO;
    }
    return YES;
}



+ (NSString *)clearsSpaceString:(NSString *)strings{    //清除空格
    NSString *result = [strings stringByReplacingOccurrencesOfString:@" " withString:@""];
    return result;
}


/*
 @pragm  strings    要清除的特殊字符
 @pragm  orgString  原始字符串
 @pragm             返回清除后的字符串
 */
+ (NSString *)clearsSpecialString:(NSString *)strings byString:(NSString *)orgString{
    NSString *result = [orgString stringByReplacingOccurrencesOfString:strings withString:@""];
    return result;
}

/*
 @pragm  strings    要清除的特殊字符
 @pragm  orgString  原始字符串
 @pragm             返回清除后的字符串
 */
+ (NSString *)changeNumberToImgName:(NSString *)numbtag; //将数字转化为图片名称
{
    NSString *imgstring=[NSString stringWithFormat:@"img_%@.png",numbtag];
    return imgstring;
    
}

//// 判断网络是否可用 (使用asi库判断)
//+ (BOOL)checkNetworkAvailableUseASI {
//    BOOL isExistenceNetwork = YES;
//    NSString *netstate = @"";
//    Reachability *r=[Reachability reachabilityWithHostName:@"www.apple.com"];
//    switch ([r currentReachabilityStatus]) {
//        case NotReachable: // 没有网络连接
//        {
//            netstate=@"没有网络";
//            isExistenceNetwork = NO;
//        }
//            break;
//        case ReachableViaWWAN:
//        {
//            // 使用3G网络
//            netstate=@"3G";
//            isExistenceNetwork = YES;
//        }
//            break;
//        case ReachableViaWiFi:
//        {
//            // 使用WiFi网络
//            netstate=@"WiFi";
//            isExistenceNetwork = YES;
//        }
//            break;
//    }
//    NSLog(@"netstate == :%@",netstate);
//    if (!isExistenceNetwork) {
//        
////        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
////        hud.removeFromSuperViewOnHide =YES;
////        hud.mode = MBProgressHUDModeText;
////        hud.labelText = @"当前网络不可用,获取本地数据";
////        hud.minSize = CGSizeMake(132.f, 60.0f);
////        [hud hide:YES afterDelay:3];
//        
//        return NO;
//    }
//    return isExistenceNetwork;
//}


+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}


+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((hexValue >> 16) & 0x000000FF)/255.0f
                           green:((hexValue >> 8) & 0x000000FF)/255.0f
                            blue:((hexValue) & 0x000000FF)/255.0
                           alpha:alpha];
}

//排序
+ (NSArray *)sortingArray:(NSArray *)array;{

    NSArray *resultArray = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        NSNumber *number1 = obj1;
        NSNumber *number2 = obj2;
        
        NSComparisonResult result = [number1 compare:number2];
        
        return result == NSOrderedDescending; // 升序
        //        return result == NSOrderedAscending;  // 降序
    }];
    
    return resultArray;

}


+ (NSString *)versionShortSystem{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
    
}

+ (NSString *)versionSystemBuild{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleVersion"];
    return app_Version;
    
}

+ (NSString *)deviceName{
    
    
    //设备名称
    NSString *string1= [UIDevice currentDevice].name;

    return string1;
    
}


+ (NSString *)deviceModel{
    
    //设备型号，只可得到是何设备，无法得到是第几代设备
    NSString *string2= [UIDevice currentDevice].model;
    return string2;
    
}

+ (NSString *)devicesystemVersion{
    
    //系统版本型号,如iPhone OS
    NSString *string3= [UIDevice currentDevice].systemVersion;
    return string3;
    
}

+ (NSString *)devicesystemName{
    
    //系统版本名称，如6.1.3
    NSString *string4= [UIDevice currentDevice].systemName;
    return string4;
    
}

+ (void)resetDefaults:(NSString *)key {
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
}

+ (BOOL)isFirstStartApp {
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
        NSLog(@"第一次启动");
        
        return YES;
    }else{
        NSLog(@"不是第一次启动");
        return NO;
    }
    
}



#pragma mark - 获取网络状态
+(NSString *)internetStatus {
    
    Reachability *reachability   = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    NSString *net = @"wifi";
    switch (internetStatus) {
        case ReachableViaWiFi:
            net = @"wifi";
            break;
            
        case ReachableViaWWAN:
            net = @"wwan";
            break;
            
        case NotReachable:
            net = @"notReachable";
            
        default:
            break;
    }
    
    return net;
}




+(NSString *)nameFirst:(NSString*)allName{
    NSString *string=[NSString string];
    if ([allName length]>1) {
        NSString *firstStr=[allName substringToIndex:1];
        string = [NSString stringWithFormat:@"%@**",firstStr];
    }
    
    return string;
}


+(NSString *)lastPhoneFourNum:(NSString*)phone{
    NSString *string=[NSString string];
    if (!phone || [@"" isEqual:phone]) {
        return string;
    }
    if([phone length]>10) {
        NSString *firstStr=[phone substringToIndex:3];
        NSString * strings = [phone substringFromIndex:7];//截取下标7之后的字符串
        string = [NSString stringWithFormat:@"%@***%@",firstStr,strings];
    
    }
    return string;
}


+(NSString *)lastIdentifyFourNum:(NSString*)userIndentify
{
    NSString *string=[NSString string];
    if (!userIndentify || [@"" isEqual:userIndentify]) {
        return string;
    }
    
    if([userIndentify length]>12) {
        NSString *firstStr=[userIndentify substringToIndex:6];
        NSString * strings = [userIndentify substringFromIndex:[userIndentify length]-4];//截取下标7之后的字符串
        string = [NSString stringWithFormat:@"%@***%@",firstStr,strings];
        
    }
    return string;
}





//Unicode转化为汉字
+ (NSString*) replaceUnicode:(NSString*)aUnicodeString

{
    
    NSString *tempStr1 = [aUnicodeString stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                           
                                                           mutabilityOption:NSPropertyListImmutable
                           
                                                                     format:NULL
                           
                                                           errorDescription:NULL];
    
    
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
    
}



+(NSString *) utf8ToUnicode:(NSString *)string
{
    
    NSUInteger length = [string length];
    NSMutableString *s = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++)
    {
        
        unichar _char = [string characterAtIndex:i];
        //判断是否为英文和数字
        if (_char <= '9' && _char >= '0')
        {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
        }
        else if(_char >= 'a' && _char <= 'z')
        {
            
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
            
        }
        else if(_char >= 'A' && _char <= 'Z')
        {
            
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
        }
        else
        {
            
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];
            
        }
        
    }
    
    return s;
    
}





+ (CGSize)calculateFrameWithContent:(NSString *)content {
    
    CGSize sizeFrame;
    
    if (!content) {
        return sizeFrame;
    }
    
    sizeFrame =[self calculateFrameWithContent:content withFont:12];
    return sizeFrame;
}


+ (CGSize)calculateFrameWithContent:(NSString *)content withFont:(float)fontNum {
    
    CGSize sizeFrame =[self calculateFrameWithContent:content withWidth:ScreenWidth-20 withFont:fontNum];
    return sizeFrame;
}

+ (CGSize)calculateFrameWithContent:(NSString *)content withWidth:(float)width_ withFont:(float)fontNum {
    
    CGSize constraintSize;
    constraintSize.width = width_ ;
    constraintSize.height = MAXFLOAT ;
    NSString *textContent=[NSString string];
    textContent=content;
    
//    CGSize sizeFrame =[textContent sizeWithFont:[UIFont systemFontOfSize:fontNum] constrainedToSize:constraintSize lineBreakMode:NSLineBreakByTruncatingTail];
    
    CGSize sizeFrame;
//    float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
//    if (systemVersion >= 7.0)//IOS 7.0 以上
//    {
//        sizeFrame =[self getStringRect:content withSize:constraintSize];
//    }
//    else
//    {
        sizeFrame =[self getStringRect_:content withSize:constraintSize witFout:[UIFont systemFontOfSize:fontNum]];

//    }
    
    DLog(@"sizeFrame=%f",sizeFrame.height);
    return sizeFrame;
}

//  获取字符串的大小  ios7
+ (CGSize)getStringRect:(NSString*)aString withSize:(CGSize )size_
{
    CGSize size;
    NSAttributedString* atrString = [[NSAttributedString alloc] initWithString:aString];
    NSRange range = NSMakeRange(0, atrString.length);
    
    NSDictionary* dic = [atrString attributesAtIndex:0 effectiveRange:&range];
    size = [aString boundingRectWithSize:size_ options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return  size;
    
}

//  获取字符串的大小  ios6
+ (CGSize)getStringRect_:(NSString*)aString withSize:(CGSize )size_ witFout:(UIFont *)font_
{
    CGSize size;
    UIFont *nameFont=[UIFont fontWithName:@"Helvetica" size:13];
    nameFont =font_;
    size=[aString sizeWithFont:nameFont constrainedToSize:size_ lineBreakMode:NSLineBreakByCharWrapping];
    return  size;
    
}


+(NSString *) phoneNumberTFF :(NSString *)string;
{
    NSMutableString *String1 = [NSMutableString stringWithString:string];
    
    if ([String1 length]>=7) {
        [String1  insertString:@" " atIndex:3];
        [String1  insertString:@" " atIndex:8];

    }
    
    else if ([String1 length]>=3) {
        [String1  insertString:@" " atIndex:3];
        
    }
    
    return String1;
    
}

@end
