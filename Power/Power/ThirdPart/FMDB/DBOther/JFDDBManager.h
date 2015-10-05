//
//  JFDDBManager.h
//  TaiShou
//
//  Created by zhgz on 12-6-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DBAccess.h"

#import "DoctorModel.h"

#import "JFDCustomerUtil.h"
#import "HospitalModel.h"

@interface JFDDBManager : NSObject{
    
}

+ (JFDDBManager *)sharedInstance;

- (DoctorModel *)doctorList:(NSString*)doctorId_;

- (NSMutableArray *)allHospitalList;
- (void)insertHospital:(HospitalModel *)hospital_;



@end

