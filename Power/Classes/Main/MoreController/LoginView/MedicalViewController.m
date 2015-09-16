//
//  MedicalViewController.m
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "MedicalViewController.h"
#import "MedicalInfoController.h"

@interface MedicalViewController ()

@end

@implementation MedicalViewController
@synthesize v_tableView;
@synthesize tableArray;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    self.title= @"影像病例列表";
    
    
    
    tableArray=[NSMutableArray array];
    DoctorModel *doctors=[[DoctorModel alloc]init];
    
    doctors.doctorName=@"李建军";      //姓名
    doctors.doctorHosipital=@"合肥附属医院"; //所属医院
    doctors.doctorDepartment=@"科室:心血管科";//科室
    doctors.doctorIntroduce=@"简介:李建军，男，主任医生"; //医生介绍
    doctors.doctorSpecialty=@""; //医生特长
    doctors.typeTag=@"";         //

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





#pragma mark- UITableView dataSource and delegate methods

#define CellHight  310

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHight;
}

//#define lableXdistance  110
#define lableXdistance  20


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    NSArray *imageArray=[NSArray arrayWithObjects:
                         @"正常食管黏膜像(侧位).png",
                         @"膀胱癌.jpg",
                         @"正常食管黏膜像(侧位).png",
                         @"膀胱癌.jpg",
                         nil];
    
    UIImageView *ImagePhoto=[[UIImageView alloc]init];
    [cell addSubview:ImagePhoto];
    ImagePhoto.image=[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    
    ImagePhoto.frame=CGRectMake(10, 20, ScreenWidth-20, 260);
    
    
    UILabel *label=[[UILabel alloc]init];
    [cell addSubview:label];
    
    label.frame=CGRectMake(lableXdistance, 280, 200, 30);
    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentLeft;
    label.textColor=[UIColor orangeColor];
    
    label.text=@"科室: 心血管科";
    
    UILabel *labelm=[[UILabel alloc]init];
    [cell addSubview:labelm];
    
    labelm.frame=CGRectMake(lableXdistance+170, 280, 200, 30);
    labelm.font=[UIFont systemFontOfSize:16];
    labelm.textAlignment=NSTextAlignmentLeft;
    labelm.textColor=[UIColor orangeColor];
    
    labelm.text=@"T官造影";

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
    
    MedicalInfoController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"MedicalInfoController"];
    
    [self.navigationController pushViewController:doctor animated:YES];
    
    
    
}


@end
