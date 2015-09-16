//
//  PersionInfoController.h
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "BasedAFNetworkController.h"
#import "NameViewController.h"

#import "SinglePickerVC.h"
#import "YearMonthPickerController.h"
#import "PersionInfoEditeVC.h"


@interface PersionInfoController : BasedAFNetworkController<UITableViewDataSource,UITableViewDelegate,NameViewControllerDelegate,SinglePickerVCDelegate,YearMonthPickerControllerDelegate,PersionInfoEditeVCDelegate>

@property(nonatomic,strong)IBOutlet UITableView * v_tableView;
@property (strong, nonatomic)  NSMutableArray *tableArray;
@property (strong, nonatomic)  NSMutableDictionary * tableDic;

@property(nonatomic,strong) SinglePickerVC *procityPickView;
@property(nonatomic,strong) UIView         *pickerView;

@property(nonatomic,strong) YearMonthPickerController *ymPicker;

@end
