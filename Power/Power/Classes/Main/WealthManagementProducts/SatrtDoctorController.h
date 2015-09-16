//
//  SatrtDoctorController.h
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  明星团队

#import "BasedAFNetworkController.h"

@interface SatrtDoctorController : BasedAFNetworkController
<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *v_tableView;
@property (strong, nonatomic)  NSMutableArray *tableArray;
@property (strong, nonatomic) IBOutlet UIView *selectedView;
@property (strong, nonatomic)  UIView *showView;
@property (strong, nonatomic)  NSMutableArray *pickArray;



- (void)withManger:(DoctorModel *)doctor_;

@end
