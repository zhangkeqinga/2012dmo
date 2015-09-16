//
//  YearMonthPickerController.m
//  PasswordApp
//
//  Created by yto on 14-7-28.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import "YearMonthPickerController.h"

@interface YearMonthPickerController ()

@end

@implementation YearMonthPickerController


@synthesize hiddenTextField;
@synthesize delegate;
@synthesize isShowTwoTime;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        hiddenTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        hiddenTextField.inputView = self.view;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        hiddenTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        hiddenTextField.inputView = self.view;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView {
    //
    [self.view addSubview:hiddenTextField];
    
    picker = [[UIPickerView alloc] init];
    picker.showsSelectionIndicator = YES;
    picker.delegate = self;
    picker.dataSource = self;
    [self.view addSubview:picker];
    
    [self createTextOkButton];
}

- (void)setIsShowTwoTime:(BOOL)_isShowTwoTime {
    isShowTwoTime = _isShowTwoTime;
    if (_isShowTwoTime) {
        [self createTextStatusBar];
    }else {
        [self createTextOkButton];
    }
}

- (void)createTextOkButton {
    UIToolbar *buttonBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    buttonBar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(clickCancel:)];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStyleBordered target:self action:@selector(clickConfirm:)];
    
    buttonBar.items = [NSArray arrayWithObjects:leftItem,spaceItem,rightItem, nil];
    
    self.hiddenTextField.inputAccessoryView = buttonBar;
}

- (void)createTextStatusBar {
    UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [barView setBackgroundColor:COLOR(66.0, 66.0, 66.0, 1.0)];
    
    startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startBtn setFrame:CGRectMake(80, 0, 80, 44)];
    [startBtn setTitle:@"起始日期" forState:UIControlStateNormal];
    [startBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startBtn setTitleColor:COLORO(231, 92, 33) forState:UIControlStateSelected];
    [startBtn addTarget:self action:@selector(clickSelect:) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:startBtn];
    
    endBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [endBtn setFrame:CGRectMake(160, 0, 80, 44)];
    [endBtn setTitle:@"截止日期" forState:UIControlStateNormal];
    [endBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [endBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [endBtn setTitleColor:COLORO(231, 92, 33) forState:UIControlStateSelected];
    [endBtn addTarget:self action:@selector(clickSelect:) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:endBtn];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setFrame:CGRectMake(10, 0, 60, 44)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [cancelBtn addTarget:self action:@selector(clickCancel:) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:cancelBtn];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBtn setFrame:CGRectMake(250, 0, 60, 44)];
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    [confirmBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [confirmBtn addTarget:self action:@selector(clickConfirm:) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:confirmBtn];
    
    self.hiddenTextField.inputAccessoryView = barView;
}

- (void)showStatusButton:(DateType)_type {
    NSLog(@"%s  _type == %d",__FUNCTION__,_type);
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


/**
 * 设置初始时间
 **/
- (void)setDetaultDateStart:(NSDate *)date animated:(BOOL)animated {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    
    int year = [dateComponent year];
    int month = [dateComponent month];
    
    startYear = year;
    startMonth = month;
    
    [self showTimeYear:startYear month:startMonth];//设置日期

}


/**
 * 设置初始时间
 **/
- (void)setDetaultDateEnd:(NSDate *)date animated:(BOOL)animated {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    
    int year = [dateComponent year];
    int month = [dateComponent month];
    
    endYear = year;
    endMonth = month;
    
}


- (void)displayView {
    // 默认显示当前的时间
    
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

- (void)showTimeYear:(int)year month:(int)month {
    [picker selectRow:year-MinYear inComponent:0 animated:YES];
    [picker selectRow:month-MinMonth inComponent:1 animated:YES];
}

#pragma mark - btn action
- (IBAction)clickCancel:(id)sender {
    [self hideView];

    
    
}

- (IBAction)clickConfirm:(id)sender {
    [self hideView];
 
    
    NSInteger yearRow = [picker selectedRowInComponent:0];
    NSInteger monthRow = [picker selectedRowInComponent:1];
    int year = yearRow+MinYear;
    int month = monthRow+MinMonth;
    
    if (isShowTwoTime) {
        if (dType == DateTypeStart) {
            startYear = year;
            startMonth = month;
        }else {
            endYear = year;
            endMonth = month;
        }
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerDone:startYear:startMonth:endYear:endMonth:)]) {
            [self.delegate pickerDone:self startYear:startYear startMonth:startMonth endYear:endYear endMonth:endMonth];
        }
    }else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerDone:selectedYear:selecetedMonth:)]) {
            [self.delegate pickerDone:self selectedYear:year selecetedMonth:month];
        }
    }
}

- (void)clickSelect:(id)sender {
    if (startBtn == sender) {
        [self showStatusButton:DateTypeStart];
        
        // 保存结束时间
        NSInteger yearRow = [picker selectedRowInComponent:0];
        NSInteger monthRow = [picker selectedRowInComponent:1];
        endYear = yearRow+MinYear;
        endMonth = monthRow+MinMonth;
        
        // 设置开始时间
        [self showTimeYear:startYear month:startMonth];
    }else {
        [self showStatusButton:DateTypeEnd];
        
        // 保存开始时间
        NSInteger yearRow = [picker selectedRowInComponent:0];
        NSInteger monthRow = [picker selectedRowInComponent:1];
        startYear = yearRow+MinYear;
        startMonth = monthRow+MinMonth;
        
        // 设置结束时间
        [self showTimeYear:endYear month:endMonth];
    }
}

- (BOOL)judgeTimeWithType:(DateType)_type viewForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSInteger yearRow = [picker selectedRowInComponent:0];
    NSInteger monthRow = [picker selectedRowInComponent:1];
    if (component == 0) {
        yearRow = row;
    }else {
        monthRow = row;
    }
    int year = yearRow+MinYear;
    int month = monthRow+MinMonth;
    if (_type == DateTypeStart) {
        if (year > endYear) {
            return NO;
        }else if (year == endYear){
            if (month > endMonth) {
                return NO;
            }
        }
    }else {
        if (year < startYear) {
            return NO;
        }else if (year == startYear) {
            if (month < startMonth) {
                return NO;
            }
        }
    }
    return YES;
}

#pragma mark - Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return 1000;
    }else {
        return 12;
    }
}

#pragma mark - Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        int year = row+MinYear;
        NSString *yearStr = [NSString stringWithFormat:@"%d年",year];
        return yearStr;
    }else {
        int month = row+MinMonth;
        NSString *monthStr = [NSString stringWithFormat:@"%d月",month];
        return monthStr;
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    mycom1 = view ? (UILabel *) view : [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 160.0f, 30.0f)];
    
    if (component == 0) {
        int year = row+MinYear;
        NSString *yearStr = [NSString stringWithFormat:@"%d年",year];
        mycom1.text = yearStr;
    }else {
        int month = row+MinMonth;
        NSString *monthStr = [NSString stringWithFormat:@"%d月",month];
        mycom1.text = monthStr;
    }
    if (isShowTwoTime) {
        if ([self judgeTimeWithType:dType viewForRow:row forComponent:component]) {
            [mycom1 setTextColor:[UIColor blackColor]];
        }
    }
    
    
    else {
        
        [mycom1 setTextColor:[UIColor grayColor]];
    }
    
    [mycom1 setFont:[UIFont boldSystemFontOfSize:24]];
    mycom1.backgroundColor = [UIColor clearColor];
    [mycom1 setTextAlignment:NSTextAlignmentCenter];
    CFShow((__bridge CFTypeRef)(mycom1));
    return mycom1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (isShowTwoTime) {
        if (![self judgeTimeWithType:dType viewForRow:row forComponent:component]) {
            if (dType == DateTypeStart) {
                [self showTimeYear:endYear month:endMonth];
            }else {
                [self showTimeYear:startYear month:startMonth];
            }
        }
    }
}

@end
