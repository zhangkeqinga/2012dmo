//
//  SinglePickerVC.m
//  Power
//
//  Created by mac on 15/9/16.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import "SinglePickerVC.h"

@interface SinglePickerVC ()

@end


@implementation SinglePickerVC

@synthesize picker;
@synthesize delegate;
@synthesize hiddenTextField;
@synthesize dataArray;

@synthesize dict=_dict;
@synthesize firstArray=_firstArray;



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
    
    NSArray *arrays = [NSArray arrayWithObjects:@"男",@"女", nil];
    
    [self setDetaultDataArray:arrays];
    
}



/**
 * 设置初始数据
 **/

- (void)setDetaultDataArray:(NSArray *)dataDic;{
    
    //第一级别
    self.firstArray= dataDic;
    
    if ([self.firstArray count]<=0) {
        return;
    }
    
    [picker selectRow:0 inComponent:0 animated:YES];
    
    
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
    
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickerDone:selectedString:)]) {
            [self.delegate pickerDone:self selectedString:proviceName ];
        }
        
}


#pragma mark - picker delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return [self.firstArray count];
    
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return ScreenWidth;
}


//*
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
    UIView  * views = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
    label.textAlignment=NSTextAlignmentCenter;
    [views addSubview:label];
    label.font=[UIFont systemFontOfSize:16.0];
    
        label.text= [self.firstArray objectAtIndex:row];
    
    return views ;
    
}


//*/
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if ([self.firstArray count]>row) {
        proviceName = [self.firstArray objectAtIndex:row];
    }
    
    [pickerView reloadAllComponents];
    
    
}


@end
