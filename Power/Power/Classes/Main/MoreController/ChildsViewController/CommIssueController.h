//
//  CommIssueController.h
//  Bull
//
//  Created by mac on 15/7/5.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  常见问题

#import "BasedViewController.h"

@interface CommIssueController : BasedViewController
<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)IBOutlet UITableView *v_tableView;
@property(nonatomic,strong) NSArray *tableArray;


@end
