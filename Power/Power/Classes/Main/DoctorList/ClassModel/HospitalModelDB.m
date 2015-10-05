//
//  HospitalModelDB.m
//  Power
//
//  Created by mac on 15/10/4.
//  Copyright © 2015年 huiwei. All rights reserved.
//

#import "HospitalModelDB.h"

#define kUserTableName @"HospitalModelDB"

@implementation HospitalModelDB



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
        
        // TODO: 插入新的数据库
        NSString * sql = @"CREATE TABLE HospitalModelDB (uid INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL, createIp VARCHAR(50), createTime VARCHAR(100), createUser createUserName(100), hospitalAddress VARCHAR(100), hospitalArea VARCHAR(100), hospitalCity VARCHAR(100), hospitalImage VARCHAR(100), hospitalLevel VARCHAR(100), hospitalName VARCHAR(100), hospitalNational VARCHAR(100), hospitalProvince VARCHAR(100), hospitalUrl VARCHAR(100), id VARCHAR(100), isDelete VARCHAR(100) ,page VARCHAR(100),rows VARCHAR(100),sort VARCHAR(100),updateIp VARCHAR(100),updateTime VARCHAR(100),updateUser VARCHAR(100),updateUserName VARCHAR(100))";
        
        BOOL res = [_db executeUpdate:sql];
        if (!res) {
            NSLog(@"数据库创建失败");
        } else {
            NSLog(@"数据库创建成功");
        }
    }
}


//        createIp;
//        createTime;
//        createUser;
//        createUserName;
//        hospitalAddress;
//        hospitalArea;
//        hospitalCity;
//        hospitalImage;
//        hospitalLevel;
//        hospitalName;
//        hospitalNational;
//        hospitalProvince;
//        hospitalUrl;
//        id;
//        isDelete;
//        order;
//        page;
//        rows;
//        sort;
//        updateIp;
//        updateTime;
//        updateUser;
//        updateUserName;

/**
 * @brief 保存一条用户记录
 *
 * @param user 需要保存的用户数据
 */
- (void) saveHospital:(HospitalModel *) hospital_ {
    NSMutableString * query = [NSMutableString stringWithFormat:@"INSERT INTO HospitalModelDB"];
    NSMutableString * keys = [NSMutableString stringWithFormat:@" ("];
    NSMutableString * values = [NSMutableString stringWithFormat:@" ( "];
    NSMutableArray * arguments = [NSMutableArray arrayWithCapacity:5];
    
    if (hospital_.hospitalName) {
        [keys appendString:@"hospitalName,"];
        [values appendString:@"?,"];
        [arguments addObject:hospital_.hospitalName];
    }
    
    if (hospital_.id) {
        [keys appendString:@"id,"];
        [values appendString:@"?,"];
        [arguments addObject:hospital_.id];
    }
    
    if (hospital_.hospitalAddress) {
        [keys appendString:@"hospitalAddress,"];
        [values appendString:@"?,"];
        [arguments addObject:hospital_.hospitalAddress];
    }
    
    if (hospital_.hospitalArea) {
        [keys appendString:@"hospitalArea,"];
        [values appendString:@"?,"];
        [arguments addObject:hospital_.hospitalArea];
    }
    
    if (hospital_.hospitalCity) {
        [keys appendString:@"hospitalCity,"];
        [values appendString:@"?,"];
        [arguments addObject:hospital_.hospitalCity];
    }
    
    if (hospital_.hospitalImage) {
        [keys appendString:@"hospitalImage,"];
        [values appendString:@"?,"];
        [arguments addObject:hospital_.hospitalImage];
    }
    
    if (hospital_.hospitalProvince) {
        [keys appendString:@"hospitalProvince,"];
        [values appendString:@"?,"];
        [arguments addObject:hospital_.hospitalProvince];
    }
    
    if (hospital_.hospitalLevel) {
        [keys appendString:@"hospitalLevel,"];
        [values appendString:@"?,"];
        [arguments addObject:hospital_.hospitalLevel];
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


/**
 * @brief 保存 n 条用户记录
 *
 * @param HospitalModel 需要保存的用户数据
 */
- (void) saveHospitalArray:(NSMutableArray *) hospitalArray {

    if (hospitalArray) {
        if (hospitalArray.count>0) {
            for (int i =0 ; i<[hospitalArray count]; i++) {
                HospitalModel *model = [hospitalArray objectAtIndexedSubscript:i];
                [self saveHospital:model];
                
            }
        }
    }

}
/**
 * @brief 删除一条用户数据
 *
 * @param uid 需要删除的用户的id
 */
- (void) deleteUserWithId:(NSString *) uid {
    NSString * query = [NSString stringWithFormat:@"DELETE FROM HospitalModelDB WHERE uid = '%@'",uid];
    NSLog(@"删除一条数据");
    [_db executeUpdate:query];
    
}


/**
 * @brief 删除一条用户数据
 *
 * @param uid 需要删除的用户的id
 */
- (void) deleteUserWithHospitalId:(NSString *) i_id {
    NSString * query = [NSString stringWithFormat:@"DELETE FROM HospitalModelDB WHERE id = '%@'",i_id];
    NSLog(@"删除一条数据");
    [_db executeUpdate:query];
    
}

/**
 * @brief 修改用户的信息
 *
 * @param user 需要修改的用户信息
 */
- (void) mergeWithUser:(HospitalModel *) hospital_ {
    if (!hospital_.uid) {
        return;
    }
    NSString * query = @"UPDATE HospitalModelDB SET";
    NSMutableString * temp = [NSMutableString stringWithCapacity:20];
    // xxx = xxx;
    
    if (hospital_.hospitalName) {
        [temp appendFormat:@" hospitalName = '%@',",hospital_.hospitalName];
    }
    
    if (hospital_.id) {
        [temp appendFormat:@" id = '%@',",hospital_.id];

    }
    
    if (hospital_.hospitalAddress) {
        [temp appendFormat:@" hospitalAddress = '%@',",hospital_.hospitalAddress];

    }
    
    if (hospital_.hospitalArea) {
        [temp appendFormat:@" hospitalArea = '%@',",hospital_.hospitalArea];

    }
    
    if (hospital_.hospitalCity) {
        [temp appendFormat:@" hospitalCity = '%@',",hospital_.hospitalCity];

    }
    
    if (hospital_.hospitalImage) {
        [temp appendFormat:@" hospitalImage = '%@',",hospital_.hospitalImage];

    }
    
    if (hospital_.hospitalProvince) {
        [temp appendFormat:@" hospitalProvince = '%@',",hospital_.hospitalProvince];

    }
    
    if (hospital_.hospitalLevel) {
        [temp appendFormat:@" hospitalLevel = '%@',",hospital_.hospitalLevel];

    }
    
    [temp appendString:@")"];
    query = [query stringByAppendingFormat:@"%@ WHERE uid = '%@'",[temp stringByReplacingOccurrencesOfString:@",)" withString:@""],hospital_.uid];
    NSLog(@"%@",query);
    NSLog(@"修改一条数据");
    [_db executeUpdate:query];
}

/**
 * @brief 模拟分页查找数据。取uid大于某个值以后的limit个数据
 *
 * @param uid
 * @param limit 每页取多少个
 */
- (NSArray *) findWithUid:(NSString *) uid limit:(int) limit {
    NSString * query = @"SELECT * FROM HospitalModelDB";
    if (!uid) {
        query = [query stringByAppendingFormat:@" ORDER BY uid DESC limit %d",limit];
    } else {
        query = [query stringByAppendingFormat:@" WHERE uid > %@ ORDER BY uid DESC limit %d",uid,limit];
    }
    
    FMResultSet * rs = [_db executeQuery:query];
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:[rs columnCount]];
    while ([rs next]) {
        HospitalModel * hospital = [HospitalModel new];
        hospital.uid = [rs stringForColumn:@"uid"];
        hospital.hospitalName = [rs stringForColumn:@"hospitalName"];
        hospital.hospitalImage = [rs stringForColumn:@"hospitalImage"];
        [array addObject:hospital];
    }
    [rs close];
    return array;
}


@end
