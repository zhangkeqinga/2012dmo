//
//  PersionInfoController.m
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "PersionInfoController.h"

@interface PersionInfoController ()

@end

@implementation PersionInfoController
@synthesize v_tableView;
@synthesize tableArray;
@synthesize tableDic;


@synthesize procityPickView;  //省市区 选择的的pickerView
@synthesize pickerView=_pickerView;
@synthesize ymPicker;
@synthesize ymdPicker;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;

    self.title= @"个人信息";
    
    tableArray =[NSMutableArray array];
    tableDic = [NSMutableDictionary dictionary];
    
    
    [tableDic setObject:[Users userName] forKey:@"name"];
    [tableDic setObject:@" " forKey:@"sex"];
    [tableDic setObject:@" " forKey:@"age"];
    [tableDic setObject:@" " forKey:@"health"];

    
    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
    tableArray=[plistDic objectForKey:@"PERSONINFO"];
    
    v_tableView.tableFooterView = [[UIView alloc] init];
    v_tableView.backgroundColor=[UIColor clearColor];
    v_tableView.tableFooterView.backgroundColor=BACKVIEWCOLOR;

    [self setFreshNavigationBar];  //更新个人信息
    
    
}

#pragma mark- //更新个人信息
- (void)freshPersionInfo{
    [self initRequestChange];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#define CellHight_Header  120
#define CellHight  40
#pragma mark- tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableArray count];
}



#pragma mark- UITableView dataSource and delegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    UILabel *label=[[UILabel alloc]init];
    [cell addSubview:label];
    label.frame=CGRectMake(15, 0, 200, 40);
    label.font=[UIFont boldSystemFontOfSize:14];
    label.textAlignment=NSTextAlignmentLeft;
    
    NSDictionary *dic=[tableArray objectAtIndex:indexPath.row];
    label.text=[dic objectForKey:@"title"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.tag=[[dic objectForKey:@"tag"] integerValue];
    
    
    UILabel *label1=[[UILabel alloc]init];
    [cell addSubview:label1];
    label1.frame=CGRectMake(ScreenWidth-170, 0, 130, 40);
    label1.font=[UIFont boldSystemFontOfSize:14];
    label1.textAlignment=NSTextAlignmentRight;

    if (indexPath.row==0) {
        
        if (![@"<null>" isEqual:[tableDic objectForKey:@"name"]])
        label1.text = [tableDic objectForKey:@"name"];
        
    } else if (indexPath.row==1) {
        label1.text = [tableDic objectForKey:@"sex"];

    }
    else    if (indexPath.row==2) {
        label1.text = [tableDic objectForKey:@"age"];
    }
    else {
//        label1.text = [tableDic objectForKey:@"health"];

    }
    
    
    return cell;
    
}


- (void)nameInfo:(NSString *)name_{
    
    if (name_) {
        if (name_ != nil) {
            [tableDic setObject:name_ forKey:@"name"];
            
            [self.v_tableView reloadData];
        }
    }
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
    UITableViewCell *cell=[self.v_tableView cellForRowAtIndexPath:indexPath];
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
    
    switch (cell.tag) {
        case 3001:
        {
            NameViewController *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"NameViewController"];
            friendControl.delegate=self;
            [self.navigationController pushViewController:friendControl animated:YES];
            
        }
            break;
        case 3002:
        {
            [self initViewPicker];
//            [self initPickerDate];
            [self initYMDDatePicker];
            
        }
            break;
        case 3003:  //性别选择
        {
            [self initViewPicker];
            [self initDatePicker];
        }
            break;
        case 3004:
        {
            [self persionInfomation];
        }
            break;
        case 3005:
        {
            
            
        }
            break;
        default:
            
            break;
    }
    
    
}


- (void) persionInfomation{
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
    
    PersionInfoEditeVC *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"PersionInfoEditeVC"];
    
    [self.navigationController pushViewController:friendControl animated:YES];
    

    
}



#pragma  mark - delegate PersionInfoEditeVC
- (void)persionIllnessInfomation:(NSString *)illness_{
    
}


- (IBAction)pointDoctor:(id)sender{
    
    
    
}




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
    ymdPicker.picker.maximumDate = [UnitPath dateFromString: [UnitPath currentDateSecond]];
    
    
//    [ymdPicker setDateEnd:[UnitPath dateFromString:[UnitPath currentDateFormater]] animated:YES];
//    [ymdPicker setDateEnd:[UnitPath dateFromString:[UnitPath currentDateFormater]] animated:YES];

    [self.pickerView addSubview:ymdPicker.hiddenTextField];
    [ymdPicker displayView];
    
    
}

- (void)pickerDone:(YMDPickerController *)viewController selectedDate:(NSDate *)time {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *sDateString = [dateFormatter stringFromDate:time];
    
    [tableDic setObject:sDateString forKey:@"age"];
    [self.v_tableView reloadData];

}

- (void)initPickerDate{
    
    if (ymPicker ) {
        [ymPicker removeFromParentViewController];
        ymPicker=nil;
    }
    
    ymPicker = [[YearMonthPickerController alloc] initWithNibName:@"YearMonthPickerController" bundle:nil];
    ymPicker.delegate = self;
    
    ymPicker.isShowTwoTime = NO;
    [ymPicker setDetaultDateStart:[UnitPath dateFromStr:[UnitPath currentDateFormater]] animated:YES];
    
    [self.pickerView addSubview:ymPicker.hiddenTextField];
    [ymPicker displayView];

    
}


- (void)pickerDone:(YearMonthPickerController *)viewController selectedYear:(int)year selecetedMonth:(int)month{
    
    NSLog(@"year= %d  month= %d",year,month);
    NSString *strings=[NSString stringWithFormat:@"%d年%d月",year,month];
    [tableDic setObject:strings forKey:@"age"];
    [self.v_tableView reloadData];
    
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

//省市区的选择
#pragma mark - 创建选择器的 背部 VIew
- (void)initDatePicker{
    
    if (procityPickView ) {
        [procityPickView removeFromParentViewController];
        procityPickView=nil;
    }
    
    procityPickView = [[SinglePickerVC alloc] init];
    procityPickView.delegate = self;
    [procityPickView createTextOkButton];
    
    [self.pickerView addSubview:procityPickView.hiddenTextField];
    
    [procityPickView displayView];
    
}

- (void)pickerDone:(SinglePickerVC *)viewController selectedString:(NSString *)selectString{
    
    if (!selectString) {
        return;
    }
    [tableDic setObject:selectString forKey:@"sex"];
    [self.v_tableView reloadData];
    
}


#pragma mark- 更新个人信息
- (void)initRequestChange{
    
    NSDictionary *dict = @{ @"userPhone": [Users phoneNumber],
                            @"name": @"好好",
                            @"sex": @"男",
                            @"birthday": @"2019-09-09",
                            @"token": @" "
                            };
    
    
    DLog(@"消息dict==%@",dict);
    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    [manager POST:changePersionInfoUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"]];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"]];
        
        if ([@"2001" isEqual:status]) { // 成功
            
            NSMutableArray * result=[responseObject objectForKey:@"result"];
            NSString *string= [NSString stringWithFormat:@"%@",result];
            
            if (result && ![@"<null>" isEqualToString:string]) {
                
                tableArray = result;
                [self.v_tableView reloadData];
            }
            
            AlertUtils *alert = [AlertUtils sharedInstance];
            [alert showWithText:@"修改成功" inView:self.view lastTime:1.0];

            
        }else{ //
            
            AlertUtils *alert = [AlertUtils sharedInstance];
            [alert showWithText:@"更新失败" inView:self.view lastTime:1.0];

            DLog(@" messages= %@",messages);
        }
        
        [self hideWaitLoading];
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请求失败" inView:self.view lastTime:1.0];
        
        DLog(@"error＝%@", error);
        [self hideWaitLoading];
    }];
    
}








@end
