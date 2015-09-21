//
//  CheckVIewController.m
//  PowerfullDoctors
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "CheckVIewController.h"

@interface CheckVIewController ()

@property(nonatomic) CGPoint point;
@property(nonatomic) int index;

@end

@implementation CheckVIewController

@synthesize point;
@synthesize pickerView=_pickerView;
@synthesize ymdPicker;
@synthesize index;



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitleBackItemImageAndTitle];
    self.point=self.backScrollview.contentOffset;
    
    self.index = 0;
    
}



- (IBAction)searchAction:(id)sender {
    
    [self.searchNumber resignFirstResponder];
    [self.startTime resignFirstResponder];
    [self.endTime resignFirstResponder];

//    [AlertUtil alertSuerAndCancelWithDelegate:@"查询成功" delegate:self];
    
    if (  [self.searchNumber.text  isEqual: @""]) {
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请输入编号" inView:self.view lastTime:1.0];
        return ;
    }
    
    if (  [self.startTime.text  isEqual: @""]) {
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请选择开始时间" inView:self.view lastTime:1.0];
        return ;
    }
    
    if (  [self.endTime.text  isEqual: @""]) {
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请选择结束时间" inView:self.view lastTime:1.0];
        return ;
    }

    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.backScrollview.contentOffset=self.point;
        
    } completion:^(BOOL finished) {
        UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
        MedicalViewController *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"MedicalViewController"];
        [self.navigationController pushViewController:friendControl animated:YES];
        

    }];

    
    //do something request
    
    
    
    
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.backScrollview.contentOffset=CGPointMake(self.point.x,  self.point.y+65*(textField.tag-1101));
        
    } completion:^(BOOL finished) {
        
    }];

    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.backScrollview.contentOffset=self.point;
        
    } completion:^(BOOL finished) {
        
    }];

    
    [textField resignFirstResponder];
    return YES;
    
}


- (IBAction)selectTime:(id)sender{
    switch ([sender tag]) {
        case 3000:
            self.index = 0;
            break;
        case 3001:
            self.index = 1;
            break;
        default:
            break;
    }
    
    [self initViewPicker];
    [self initYMDDatePicker];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//改将年月改为年月日
#pragma mark - initDatePicker
- (void)initYMDDatePicker{
    
    if (ymdPicker ) {
        [ymdPicker removeFromParentViewController];
        ymdPicker=nil;
    }
    
    ymdPicker = [[YMDPickerController alloc] init];
    ymdPicker.delegate = self;
    ymdPicker.isShowTwoTime=NO;
    
    [self.pickerView addSubview:ymdPicker.hiddenTextField];
    [ymdPicker displayView];
    
    
}

- (void)pickerDone:(YMDPickerController *)viewController selectedDate:(NSDate *)time {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *sDateString = [dateFormatter stringFromDate:time];
    
    if (self.index==0) {
        self.startTime.text = sDateString;
    }
    if (self.index==1) {
        self.endTime.text =  sDateString;
    }

}
#pragma mark - 创建选择器的 背部 VIew
- (void)initViewPicker{
    
    if (self.pickerView) {
        [self.pickerView removeFromSuperview];
        self.pickerView=nil;
    }
    
    self.pickerView=[[UIView alloc]init];
    self.pickerView.frame=CGRectMake(0, 64+DEVICE_HEIGHT-115, DEVICE_WIDTH, DEVICE_HEIGHT-64-52+1);
    self.pickerView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.pickerView];
    
}

@end
