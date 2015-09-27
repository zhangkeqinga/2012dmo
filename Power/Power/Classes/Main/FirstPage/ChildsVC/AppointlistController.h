//
//  AppointlistController.h
//  PowerfullDoctors
//
//  Created by mac on 15/9/3.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "BasedAFNetworkController.h"
#import "UIImageView+WebCache.h"

@interface AppointlistController : BasedAFNetworkController


@property(nonatomic,strong)IBOutlet UITableView * v_tableView;
@property (strong, nonatomic)  NSMutableArray *tableArray;


@end
