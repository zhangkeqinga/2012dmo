//
//  DoctorListController.h
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  医生列表

#import "BasedAFNetworkController.h"
#import "CheckVIewController.h"

@interface DoctorListController : BasedAFNetworkController
<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *v_tableView;
@property (strong, nonatomic) NSMutableArray * tableArray;
- (void)withManger:(DoctorModel *)doctor_;


@end
