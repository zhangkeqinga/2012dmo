//
//  MedicalViewController.h
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  我的病例

#import "BasedAFNetworkController.h"

@interface MedicalViewController : BasedAFNetworkController

@property (strong, nonatomic) IBOutlet UITableView *v_tableView;
@property (strong, nonatomic)  NSMutableArray *tableArray;


@end
