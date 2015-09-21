//
//  RewardPointVC.h
//  Power
//
//  Created by mac on 15/9/18.
//  Copyright © 2015年 huiwei. All rights reserved.
//

#import "BasedAFNetworkController.h"

@interface RewardPointVC : BasedAFNetworkController
<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)IBOutlet UITableView * v_tableView;

@end
