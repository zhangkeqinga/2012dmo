//
//  ReservationVC.h
//  Power
//
//  Created by mac on 15/10/1.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//  我的预约

#import <UIKit/UIKit.h>
#import "BasedAFNetworkController.h"
#import "UIImageView+WebCache.h"

@interface ReservationVC : BasedAFNetworkController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *v_tableView;
@property (strong, nonatomic)  NSMutableArray *tableArray;
@property (strong, nonatomic)  NSString *titleString;

- (void)withMangerInfo:(NSString*)title;


@end
