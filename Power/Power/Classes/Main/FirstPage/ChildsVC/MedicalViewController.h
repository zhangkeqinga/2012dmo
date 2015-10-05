//
//  MedicalViewController.h
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  我的影像

#import "BasedAFNetworkController.h"

@interface MedicalViewController : BasedAFNetworkController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *v_tableView;
@property (strong, nonatomic)  NSMutableArray *tableArray;
@property (strong, nonatomic)  NSString *titleString;

- (void)withMangerInfo:(NSString*)title;

@end
