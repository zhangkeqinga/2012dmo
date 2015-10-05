//
//  JFDCustomerUtil.m
//  JiaFeng
//
//  Created by star  on 11/14/12.
//
//

#import "JFDCustomerUtil.h"


@implementation JFDCustomerUtil


+(NSString *)coverSqlDataToNSString:(NSString *)data{
    NSString *temp=[NSString stringWithFormat:@"%@",data];
    if (![temp isMemberOfClass:[NSNull class]]&&![temp isEqualToString:@"<null>"]&&![temp isEqualToString:@"(null)"]) {
        return temp;
    }else{
        return @"";
    }
}



@end
