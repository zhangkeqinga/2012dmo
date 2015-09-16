//
//  YMWeekPickerController.m
//  MDBClient
//
//  Created by Dong on 15-4-15.
//  Copyright (c) 2015年 YTO—孙建龙. All rights reserved.
//

#import "ProCityPicker.h"

@implementation ProCityPicker

@synthesize picker;
@synthesize delegate;
@synthesize hiddenTextField;
@synthesize dataArray;

@synthesize dict=_dict;
@synthesize firstArray=_firstArray;
@synthesize secondArray=_secondArray;
@synthesize thirdPickerArray=_thirdPickerArray;
@synthesize selectArray=_selectArray;
@synthesize selectNum;



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

//需要添加注释地方
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self initView];
    
    //默认为2 只进行省市的选择
    selectNum = 2;
    [self getProviceDate];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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



//获取省市区的信息
- (void)getProviceDate{
    
    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"Address"];
//    NSDictionary * _menuList=[plistDic objectForKey:@"Root"];
    
    [self setDetaultDataArray:plistDic];
    
}



/**
 * 设置初始数据
 **/

- (void)setDetaultDataArray:(NSDictionary *)dataDic;{
    
    _dict=[[NSDictionary alloc] initWithDictionary:dataDic];
    
    //第一级别
    self.firstArray= [UnitPath sortingArray:[_dict allKeys]];
    
    if ([self.firstArray count]<=0) {
        return;
    }
    
    //第二级别
    self.selectArray=[_dict objectForKey:[self.firstArray objectAtIndex:0]] ;
    if ([_selectArray count]>0) {
        self.secondArray= [UnitPath sortingArray: [[self.selectArray objectAtIndex:0] allKeys]];
    }
    
    [picker selectRow:0 inComponent:0 animated:YES];
    [picker selectRow:0 inComponent:1 animated:YES];
    
    if ([self.firstArray count]>0) {
        proviceName = [self.firstArray objectAtIndex:0];
    }
    if ([self.secondArray count]>0) {
        cityName = [self.secondArray objectAtIndex:0];
    }
    
    
}


#pragma mark-createTextOkButton
- (void)createTextOkButton {
    
    UIToolbar *buttonBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, -0, 320, 44)];
    buttonBar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(clickCancel:)];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStyleBordered target:self action:@selector(clickConfirm:)];
    
    buttonBar.items = [NSArray arrayWithObjects:leftItem,spaceItem,rightItem, nil];
    
    self.hiddenTextField.inputAccessoryView = buttonBar;
}


#pragma mark-displayView
- (void)displayView {// 默认显示当前的时间
    [hiddenTextField becomeFirstResponder];
}

- (void)hideView {   //显示
    [hiddenTextField resignFirstResponder];
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerHiddenKeyboard)]) {
        [delegate pickerHiddenKeyboard];
    }
}

- (IBAction)clickCancel:(id)sender;    //cancel
{
    [self hideView];
}

- (IBAction)clickConfirm:(id)sender;   //sure
{
    [self hideView];
    
    DLog(@"names=%@=%@=%@",proviceName,cityName,townName);
    
    if (selectNum == 1) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerDone:provice:)]) {
            [self.delegate pickerDone:self provice:proviceName ];
        }

    }
    
    if (selectNum == 2) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerDone:provice:city:)]) {
            [self.delegate pickerDone:self provice:proviceName city:cityName];
        }

    }
    
    if (selectNum == 3) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerDone:provice:city:town:)]) {
            [self.delegate pickerDone:self provice:proviceName city:cityName town:townName];
            
        }

    }
    
}


#pragma mark - picker delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==FirstComponent) {
        return [self.firstArray count];
    }
    if (component==SubComponent) {
        return [self.secondArray count];
    }

    return 0;
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component==FirstComponent) {
        return (ScreenWidth/3);
    }
    if (component==SubComponent) {
        return (2*ScreenWidth/3);
    }

    return 0;
}


//*
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
    UIView  * views = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
    label.textAlignment=NSTextAlignmentCenter;
    [views addSubview:label];
    label.font=[UIFont systemFontOfSize:16.0];
    
    if (component==FirstComponent) {
        label.text= [self.firstArray objectAtIndex:row];
    }
    
    if (component==SubComponent) {
        label.text= [self.secondArray objectAtIndex:row];
    }

    return views ;
    
}
//*/
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //第二级别
    if (component==0) {
        self.selectArray=[_dict objectForKey:[self.firstArray objectAtIndex:row]];
        
        if ([_selectArray count]>0) {
            self.secondArray= [UnitPath sortingArray: [[self.selectArray objectAtIndex:([self.selectArray count]-1)] allKeys]];
        }
    }
    
    if (component==0) {
        
        if ([self.firstArray count]>row) {
            proviceName = [self.firstArray objectAtIndex:row];
        }
        if ([self.secondArray count]>0) {
            cityName = [self.secondArray objectAtIndex:0];
        }
        
    }
    if (component==1){
        
        if ([self.secondArray count]>row) {
            cityName = [self.secondArray objectAtIndex:row];
        }
    }

    [pickerView reloadAllComponents];

    
}


@end
