//
//  ProviceCityAirPicker.m
//  Power
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import "ProviceCityAirPicker.h"

@interface ProviceCityAirPicker ()

@end

@implementation ProviceCityAirPicker

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
    selectNum = 3;
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
        self.secondArray = [self addTitleIndex0:self.secondArray];
        
    }
    
    //第三级别
    if ([self.secondArray count]>0) {
        self.thirdPickerArray= [[self.selectArray objectAtIndex:0] objectForKey:[self.secondArray objectAtIndex:0]];
        self.thirdPickerArray = [self addTitleIndex0:self.thirdPickerArray];
    }

    
    
    [picker selectRow:0 inComponent:0 animated:YES];
    [picker selectRow:0 inComponent:1 animated:YES];
    [picker selectRow:0 inComponent:2 animated:YES];

    if ([self.firstArray count]>0) {
        proviceName = [self.firstArray objectAtIndex:0];
    }
    if ([self.secondArray count]>0) {
        cityName = [self.secondArray objectAtIndex:0];
    }
    if ([self.thirdPickerArray count]>0) {
        townName = [self.thirdPickerArray objectAtIndex:0];
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
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerTownDone:provice:)]) {
            [self.delegate pickerTownDone:self provice:proviceName ];
        }
        
    }
    
    if (selectNum == 2) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerTownDone:provice:city:)]) {
            [self.delegate pickerTownDone:self provice:proviceName city:cityName];
        }
        
    }
    
    if (selectNum == 3) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerTownDone:provice:city:town:)]) {
            [self.delegate pickerTownDone:self provice:proviceName city:cityName town:townName];
            
        }
        
    }
    
}


#pragma mark - picker delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==FirstComponent) {
        return [self.firstArray count];
    }
    if (component==SubComponent) {
        return [self.secondArray count];
    }
    if (component==ThirdComponent) {
        return [self.thirdPickerArray count];
    }

    
    return 0;
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component==FirstComponent) {
        return (ScreenWidth/3);
    }
    if (component==SubComponent) {
        return (ScreenWidth/3);
    }
    if (component==ThirdComponent) {
        return (ScreenWidth/3);
    }
    
    return 0;
}


//*
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UIView  * views = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];

    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
    label.textAlignment=NSTextAlignmentCenter;
    [views addSubview:label];
    
    label.font=[UIFont systemFontOfSize:14.0];
    
    if (component==FirstComponent) {
        label.text= [self.firstArray objectAtIndex:row];
    }
    
    if (component==SubComponent) {
        label.text= [self.secondArray objectAtIndex:row];
    }
    if (component==ThirdComponent) {
        
        label.text= [self.thirdPickerArray objectAtIndex:row];
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
            self.secondArray = [self addTitleIndex0:self.secondArray];

        }
        
        if ([self.secondArray count]>row) {
            self.thirdPickerArray= [[self.selectArray objectAtIndex:0] objectForKey:[self.secondArray objectAtIndex:0]];
            self.thirdPickerArray = [self addTitleIndex0:self.thirdPickerArray];

        }

        [picker selectRow:0 inComponent:1 animated:YES];
        [picker selectRow:0 inComponent:2 animated:YES];

    }
    
    
    //第三级别
    if (component==1) {
        if ([self.secondArray count]>row) {
            
            self.thirdPickerArray= [[self.selectArray objectAtIndex:0] objectForKey:[self.secondArray objectAtIndex:row]];
            
            self.thirdPickerArray = [self addTitleIndex0:self.thirdPickerArray];
            
        }
        
        [picker selectRow:0 inComponent:2 animated:YES];

    }
    
    
    
    //赋值
    if (component==0) {
        
        if ([self.firstArray count]>row) {
            proviceName = [self.firstArray objectAtIndex:row];
        }
        if ([self.secondArray count]>0) {
            cityName = [self.secondArray objectAtIndex:0];
        }
        if ([self.thirdPickerArray count]>0) {
            townName = [self.secondArray objectAtIndex:0];
        }

        
    }
    if (component==1){
        
        if ([self.secondArray count]>row) {
            cityName = [self.secondArray objectAtIndex:row];
        }
        if ([self.thirdPickerArray count]>0) {
            townName = [self.secondArray objectAtIndex:0];
        }

    }
    if (component==2){
        
        if ([self.thirdPickerArray count]>row) {
            cityName = [self.thirdPickerArray objectAtIndex:row];
        }
    }

    
    [pickerView reloadAllComponents];
    
}




- ( NSArray * )addTitleIndex0:(NSArray *)array{
    
    NSMutableArray *arayt = [NSMutableArray arrayWithArray:array];
    [arayt insertObject:@"所有" atIndex:0];
    NSArray * array1 = arayt;
    return array1;
    
}




@end

