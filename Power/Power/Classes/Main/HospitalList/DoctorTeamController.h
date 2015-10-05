//
//  DoctorTeamController.h
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  医院

#import "BasedAFNetworkController.h"
#import "HospitalModel.h"
#import "ProCityPicker.h"
#import "ProviceCityAirPicker.h"

#import "DOPDropDownMenu.h"

@interface DoctorTeamController : BasedAFNetworkController
<UITableViewDataSource,UITableViewDelegate,ProCityPickerDelegate,ProviceCityAirPickerDelegate,UISearchBarDelegate>
{
    ProCityPicker *proCityPickView;
    ProviceCityAirPicker *proCityAirPickView;

}
//fillOrganizationsWithPinyin

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property(nonatomic,strong) ProCityPicker *procityPickView;
@property(nonatomic,strong) ProviceCityAirPicker *proCityAirPickView;

@property(nonatomic,strong) UIView         *pickerView;
@property (strong, nonatomic) IBOutlet UITableView *v_tableView;

@property (nonatomic, strong) DOPDropDownMenu *menu;
@property (nonatomic, copy) NSMutableArray *citys;
@property (nonatomic, copy) NSMutableArray *ages;
@property (nonatomic, copy) NSMutableArray *genders;

@property (nonatomic, strong) NSMutableArray *searchArray;

@end
