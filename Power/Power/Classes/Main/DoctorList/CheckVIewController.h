//
//  CheckVIewController.h
//  PowerfullDoctors
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "BasedAFNetworkController.h"
#import "MedicalViewController.h"

#import "YMDPickerController.h"

@interface CheckVIewController : BasedAFNetworkController<UITextFieldDelegate,YMDPickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *backScrollview;
@property (weak, nonatomic) IBOutlet UITextField *searchNumber;
@property (weak, nonatomic) IBOutlet UITextField *startTime;
@property (weak, nonatomic) IBOutlet UITextField *endTime;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

//
@property(nonatomic,strong) UIView              *pickerView;
@property(nonatomic,strong) YMDPickerController *ymdPicker;

@end
