//
//  SatrtDoctorController.h
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  医生列表

#import "BasedAFNetworkController.h"

#import "UIImageView+WebCache.h"


@interface SatrtDoctorController : BasedAFNetworkController
<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *v_tableView;
@property (strong, nonatomic)  NSMutableArray *tableArray;


- (void)withManger:(DoctorModel *)doctor_;

@end
