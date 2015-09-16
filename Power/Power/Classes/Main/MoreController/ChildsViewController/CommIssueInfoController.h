//
//  CommIssueInfoController.h
//  Bull
//
//  Created by mac on 15/7/18.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "BasedViewController.h"
#import "Masonry.h"

@interface CommIssueInfoController : BasedViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)IBOutlet UITableView *v_tableView;
@property(nonatomic,strong) NSArray *tableArray;


- (void)withTableDataArray:(NSDictionary *)dic_;

@end
