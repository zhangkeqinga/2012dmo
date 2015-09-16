//
//  RelationController.h
//  Bull
//
//  Created by mac on 15/7/5.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  联系我们

#import "BasedViewController.h"

@interface RelationController : BasedViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)IBOutlet UITableView *v_tableView;

@property(nonatomic,strong) NSArray *tableArray;

@end
