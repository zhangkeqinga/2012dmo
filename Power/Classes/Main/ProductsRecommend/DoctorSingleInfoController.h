//
//  DoctorSingleInfoController.h
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  医生个人信息

#import "BasedAFNetworkController.h"

@interface DoctorSingleInfoController : BasedAFNetworkController
<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *v_tableView;

- (void)withManger:(DoctorModel *)doctor_;

@end
