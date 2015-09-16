//
//  PersionInfoController.h
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "BasedAFNetworkController.h"

@interface PersionInfoController : BasedAFNetworkController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)IBOutlet UITableView * v_tableView;
@property (strong, nonatomic)  NSMutableArray *tableArray;

@end
