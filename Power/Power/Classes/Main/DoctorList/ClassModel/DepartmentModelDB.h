//
//  DepartmentModelDB.h
//  Power
//
//  Created by mac on 15/10/5.
//  Copyright © 2015年 huiwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDBManager.h"
#import "DepartmentModel.h"

@interface DepartmentModelDB : NSObject
{
    FMDatabase * _db;
}


/**
 * @brief 创建数据库
 */
- (void) createDataBase;
/**
 * @brief 保存一条用户记录
 *
 * @param user 需要保存的用户数据
 */
- (void) saveDepartment:(DepartmentModel *) department_ ;
//- (void) saveDepartmentArray:(NSMutableArray *) DepartmentArray ;


@end
