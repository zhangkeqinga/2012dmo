//
//  DepartmentModelDB.m
//  Power
//
//  Created by mac on 15/10/5.
//  Copyright © 2015年 huiwei. All rights reserved.
//

#import "DepartmentModelDB.h"

#define kUserTableName @"DepartmentDB"

@implementation DepartmentModelDB


- (id) init {
    self = [super init];
    if (self) {
        //========== 首先查看有没有建立message的数据库，如果未建立，则建立数据库=========
        _db = [SDBManager defaultDBManager].dataBase;
        
    }
    return self;
}

/**
 * @brief 创建数据库
 */
- (void) createDataBase {
    FMResultSet * set = [_db executeQuery:[NSString stringWithFormat:@"select count(*) from sqlite_master where type ='table' and name = '%@'",kUserTableName]];
    
    [set next];
    
    NSInteger count = [set intForColumnIndex:0];
    
    BOOL existTable = !!count;
    
    if (existTable) {
        // TODO:是否更新数据库
        NSLog(@"数据库已经存在");
        
    } else {
        
        
        //        NSString * sql =@"CREATE TABLE SUser (uid INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL, name VARCHAR(50), descriptions VARCHAR(100))";
        // TODO: 插入新的数据库
        NSString * sql = @"CREATE TABLE DepartmentModelDB (uid INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL, name VARCHAR(50),createIp VARCHAR(50), createTime VARCHAR(100), createUser createUserName(100), hospitalAddress VARCHAR(100), hospitalArea VARCHAR(100), hospitalCity VARCHAR(100), hospitalImage VARCHAR(100), hospitalLevel VARCHAR(100), hospitalName VARCHAR(100), hospitalNational VARCHAR(100), hospitalProvince VARCHAR(100), hospitalUrl VARCHAR(100), id VARCHAR(100), isDelete VARCHAR(100) ,page VARCHAR(100),rows VARCHAR(100),sort VARCHAR(100),updateIp VARCHAR(100),updateTime VARCHAR(100),updateUser VARCHAR(100),updateUserName VARCHAR(100))";
        
        BOOL res = [_db executeUpdate:sql];
        if (!res) {
            NSLog(@"数据库创建失败");
        } else {
            NSLog(@"数据库创建成功");
        }
    }
}




/**
 * @brief 保存一条用户记录
 *
 * @param user 需要保存的用户数据
 */
- (void) saveDepartment:(DepartmentModel *) department_ ;
{
    NSMutableString * query = [NSMutableString stringWithFormat:@"INSERT INTO HospitalModelDB"];
    NSMutableString * keys = [NSMutableString stringWithFormat:@" ("];
    NSMutableString * values = [NSMutableString stringWithFormat:@" ( "];
    NSMutableArray * arguments = [NSMutableArray arrayWithCapacity:5];
    
    if (department_.name) {
        [keys appendString:@"name,"];
        [values appendString:@"?,"];
        [arguments addObject:department_.name];
    }
    
    if (department_.id) {
        [keys appendString:@"id,"];
        [values appendString:@"?,"];
        [arguments addObject:department_.id];
    }
    
    
    
    [keys appendString:@")"];
    [values appendString:@")"];
    [query appendFormat:@" %@ VALUES%@",
     [keys stringByReplacingOccurrencesOfString:@",)" withString:@")"],
     [values stringByReplacingOccurrencesOfString:@",)" withString:@")"]];
    NSLog(@"%@",query);
    NSLog(@"插入一条数据");
    [_db executeUpdate:query withArgumentsInArray:arguments];
}


@end
