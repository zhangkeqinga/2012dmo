//
//  PerNotificationVC.h
//  Power
//
//  Created by mac on 15/9/18.
//  Copyright © 2015年 huiwei. All rights reserved.
//  我的消息

#import "BasedAFNetworkController.h"

@interface PerNotificationVC : BasedAFNetworkController
<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)IBOutlet UITableView * v_tableView;

@end
