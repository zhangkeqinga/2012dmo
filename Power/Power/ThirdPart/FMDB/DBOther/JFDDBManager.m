//
//  JFDDBManager.m
//  TaiShou
//
//  Created by zhgz on 12-6-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "JFDDBManager.h"


static JFDDBManager *dbManager = nil;

@implementation JFDDBManager


+ (JFDDBManager *)sharedInstance {
    
    if (!dbManager) {
        dbManager = [[JFDDBManager alloc] init];
    }
    return dbManager;
}


/**
 @abstract 得到医生列表
 @param NSString  doctorId_
 @return DoctorModel
 @author by 张克清
 */

- (DoctorModel *)doctorList:(NSString*)doctorId_{
    
    NSString *sql=[NSString stringWithFormat:@"select * from doctor s where s.id='%@'",doctorId_];
    //    DLog(@"%@",sqlString);
    
    DoctorModel *doctor=[[DoctorModel alloc]init];

    if ([[DBAccess sharedInstance]queryDataToObj:sql type:NSClassFromString(@"DoctorModel")]) {
        doctor = [[DBAccess sharedInstance]queryDataToObj:sql type:NSClassFromString(@"DoctorModel")];
        
    }
    
    return doctor;
}



/**
 @abstract 得到医院列表
 @param
 @return DoctorModel
 @author by 张克清
 */

- (NSMutableArray *)allHospitalList{
    
    NSString *sql=[NSString stringWithFormat:@"select * from hospital"];
    
    NSMutableArray *hospitalList=[[NSMutableArray alloc]init];
    
    if ([[DBAccess sharedInstance] queryDataToObjArrary:sql type:NSClassFromString(@"hospital")]) {
        hospitalList=[[DBAccess sharedInstance] queryDataToObjArrary:sql type:NSClassFromString(@"DoctorModel")];
        
    }
    
    return hospitalList;
}

//

/**
 @abstract 插入医院数据
 @param
 @return DoctorModel
 @author by 张克清
 */

-(void)insertHospital:(HospitalModel *)hospital_{
    NSDate * today = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSString *dateString = [NSString stringWithFormat:@"%@", [formatter stringFromDate:today]];
    hospital_.updateTime = dateString;
    
    
    NSString *sql=[NSString stringWithFormat:@"insert into  hospital(createTime,createUser,createUserName,hospitalAddress,hospitalArea,hospitalCity,hospitalImage,hospitalLevel,hospitalName,hospitalNational,hospitalProvince,hospitalUrl,isDelete,order,page,rows,sort,updateIp,updateTime,updateUser,updateUserName) values('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@'')",hospital_.createTime,hospital_.createUser,hospital_.createUserName,hospital_.hospitalAddress,hospital_.hospitalArea,hospital_.hospitalCity,hospital_.hospitalImage,hospital_.hospitalLevel,hospital_.hospitalName,hospital_.hospitalNational,hospital_.hospitalProvince,hospital_.hospitalUrl,hospital_.isDelete,hospital_.order,hospital_.page,hospital_.rows,hospital_.sort,hospital_.updateIp,hospital_.updateTime,hospital_.updateUser,hospital_.updateUserName];
    
    [[DBAccess sharedInstance]runSQL:sql];
    
}




@end
