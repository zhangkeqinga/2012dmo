//
//  YMDPickerController.m
//  PasswordApp
//
//  Created by yto on 14-8-5.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import "YMDPickerController.h"

@interface YMDPickerController ()

@end

@implementation YMDPickerController
@synthesize hiddenTextField;
@synthesize delegate;
@synthesize isShowTwoTime;
@synthesize picker;


#pragma mark - init
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        hiddenTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        
        hiddenTextField.inputView = self.view;
        [self initView];

        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView {
    picker = [[UIDatePicker alloc] init];
    [picker setDatePickerMode:UIDatePickerModeDate];
    [self.view addSubview:picker];
    [picker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self createTextStatusBar];
}



- (void)setIsShowTwoTime:(BOOL)_isShowTwoTime {
    isShowTwoTime = _isShowTwoTime;
    if (_isShowTwoTime) {
        [self createTextStatusBar];
    }else {
        [self createTextOkButton];
    }
}


#define btnFont 14

- (void)createTextOkButton {
    UIToolbar *buttonBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    buttonBar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(clickCancel:)];

    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStyleBordered target:self action:@selector(clickConfirm:)];
    
    buttonBar.items = [NSArray arrayWithObjects:leftItem,spaceItem,rightItem, nil];
    
    self.hiddenTextField.inputAccessoryView = buttonBar;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{ //当点触textField内部，开始编辑都会调用这个方法。textField将成为first responder
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    frame.origin.y -=216;
    frame.size.height +=216;
    self.view.frame = frame;
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
}


#pragma mark - mthod
- (void)createTextStatusBar {
    NSLog(@"%s",__FUNCTION__);
    UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [barView setBackgroundColor:COLOR(66.0, 66.0, 66.0, 1.0)];
    
    startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startBtn setFrame:CGRectMake(80, 0, 80, 44)];
    [startBtn setTitle:@"起始日期" forState:UIControlStateNormal];
    [startBtn.titleLabel setFont:[UIFont systemFontOfSize:btnFont]];
    [startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startBtn setTitleColor:COLORO(231, 92, 33) forState:UIControlStateSelected];
    [startBtn addTarget:self action:@selector(clickSelect:) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:startBtn];
    
    endBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [endBtn setFrame:CGRectMake(160, 0, 80, 44)];
    [endBtn setTitle:@"截止日期" forState:UIControlStateNormal];
    [endBtn.titleLabel setFont:[UIFont systemFontOfSize:btnFont]];
    [endBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [endBtn setTitleColor:COLORO(231, 92, 33) forState:UIControlStateSelected];
    [endBtn addTarget:self action:@selector(clickSelect:) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:endBtn];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setFrame:CGRectMake(10, 0, 60, 44)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn.titleLabel setFont:[UIFont systemFontOfSize:btnFont]];
    [cancelBtn addTarget:self action:@selector(clickCancel:) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:cancelBtn];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBtn setFrame:CGRectMake(250, 0, 60, 44)];
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [confirmBtn.titleLabel setFont:[UIFont systemFontOfSize:btnFont]];
    [confirmBtn addTarget:self action:@selector(clickConfirm:) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:confirmBtn];
    
    self.hiddenTextField.inputAccessoryView = barView;
}

- (void)showStatusButton:(DateType)_type {
    dType = _type;
    switch (_type) {
        case DateTypeStart:
        {
            startBtn.selected = YES;
            endBtn.selected = NO;
        }
            break;
        case DateTypeEnd:
        {
            startBtn.selected = NO;
            endBtn.selected = YES;
        }
            break;
        default:
            break;
    }
}

// 转化时区
- (NSDate *)changeTimeZoneForDate:(NSDate *)_date {
    NSTimeZone *zone = [NSTimeZone localTimeZone];//[NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: _date];
    NSDate *tempDate = [_date dateByAddingTimeInterval: interval];
    return tempDate;
    
    return _date;
}

- (void)setMaxDate:(NSDate *)_date {
    [picker setMaximumDate:_date];
}

- (void)setMinDate:(NSDate *)_date {
    [picker setMinimumDate:_date];
}

- (void)displayView {
    // 默认显示开始时间
    
    if (self.isShowTwoTime) {
        // 默认显示开始时间
        [self showStatusButton:DateTypeStart];
    }

    [hiddenTextField becomeFirstResponder];
}

- (void)hideView {
    [hiddenTextField resignFirstResponder];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerHiddenKeyboard)]) {
        [delegate pickerHiddenKeyboard];
    }

}

- (void)setDateStart:(NSDate *)date animated:(BOOL)animated {
    [self showStatusButton:DateTypeStart];
    startDate = date;
    [picker setDate:date animated:animated];
    [self setMaxMinDate:date];
}

- (void)setDateEnd:(NSDate *)date animated:(BOOL)animated {
    [self showStatusButton:DateTypeStart];
    endDate = date;
    [picker setDate:date animated:animated];
    [self setMaxMinDate:date];
}



- (void)setMaxMinDate:(NSDate *)_date {
    
    if (self.isShowTwoTime) {
        if (dType == DateTypeStart) {
            [self setMaxDate:_date];
            [self setMinDate:nil];
        }else {
            [self setMinDate:_date];
            [self setMaxDate:nil];
        }
    }else {
        [self setMaxDate:[NSDate date]];
    }
  
}

#pragma mark - btn action
- (void)datePickerValueChanged:(UIDatePicker *)datepickers {
    if (dType == DateTypeStart) {
        startDate = datepickers.date;
    }else {
        endDate = datepickers.date;
    }
}

- (void)clickSelect:(id)sender {
    
    if (startBtn == sender) {
        [self showStatusButton:DateTypeStart];
        
        // 保存结束时间
        endDate = picker.date;
        // 设置开始时间
        [picker setDate:startDate animated:YES];
        
        [self setMaxMinDate:endDate];
    }else {
        [self showStatusButton:DateTypeEnd];
        
        // 保存开始时间
        startDate = picker.date;
        // 设置结束时间
        [picker setDate:endDate animated:YES];
        
        [self setMaxMinDate:startDate];
    }
}

- (void)clickCancel:(id)sender {
    [self hideView];
}

- (void)clickConfirm:(id)sender {
    [self hideView];
    
    if (isShowTwoTime) {
        if (dType == DateTypeStart) {
            startDate = picker.date;
        }else {
            endDate = picker.date;
        }
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerDone:selectedStartDate:selectedEndDate:)]) {
            [self.delegate pickerDone:self selectedStartDate:startDate selectedEndDate:endDate];
        }
        
    }else {
       
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerDone: selectedDate:)]) {
            [self.delegate pickerDone:self selectedDate:picker.date];
        }
    }
    
    
   
}

@end
