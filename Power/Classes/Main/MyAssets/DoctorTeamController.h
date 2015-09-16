//
//  DoctorTeamController.h
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  医院资源

#import "BasedAFNetworkController.h"

@interface DoctorTeamController : BasedAFNetworkController
<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *v_tableView;

@end
