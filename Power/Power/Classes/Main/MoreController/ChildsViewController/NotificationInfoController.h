//
//  NotificationInfoController.h
//  Bull
//
//  Created by mac on 15/7/5.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  消息中心

#import "BasedViewController.h"

@interface NotificationInfoController : BasedViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *tableArray;

@end
