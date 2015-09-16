//
//  AppointDoctorController.h
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  首页

#import "BasedViewController.h"

#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
#import "EScrollerView.h"
#import "AdvertModel.h"


@interface AppointDoctorController : BasedViewController<EScrollerViewDelegate,UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UIView *productView;

@property (strong, nonatomic) IBOutlet UITableView *v_tableView;


@end
