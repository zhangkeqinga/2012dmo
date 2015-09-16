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


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;

    self.title= @"个人信息";
    
    tableArray =[NSMutableArray array];
    tableDic = [NSMutableDictionary dictionary];
    [tableDic setObject:@" " forKey:@"name"];
    [tableDic setObject:@" " forKey:@"sex"];
    [tableDic setObject:@" " forKey:@"age"];
    [tableDic setObject:@" " forKey:@"health"];

    
    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
    tableArray=[plistDic objectForKey:@"PERSONINFO"];
    
    
    v_tableView.tableFooterView = [[UIView alloc] init];
    v_tableView.backgroundColor=[UIColor clearColor];
    v_tableView.tableFooterView.backgroundColor=BACKVIEWCOLOR;


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
        label1.text = [tableDic objectForKey:@"name"];
        
    } else if (indexPath.row==1) {
        label1.text = [tableDic objectForKey:@"age"];

    }
    else    if (indexPath.row==2) {
        label1.text = [tableDic objectForKey:@"sex"];
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
            [self initPickerDate];
            
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
    
    [tableDic setObject:selectString forKey:@"sex"];
    [self.v_tableView reloadData];
    
}

@end
