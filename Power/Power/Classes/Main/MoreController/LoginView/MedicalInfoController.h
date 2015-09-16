//
//  MedicalInfoController.h
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  病例详情

#import "BasedAFNetworkController.h"

@interface MedicalInfoController : BasedAFNetworkController


@property (strong, nonatomic) IBOutlet UITableView *v_tableView;
@property (strong, nonatomic)  NSMutableArray *tableArray;


@end
