//
//  AppointlistController.m
//  PowerfullDoctors
//
//  Created by mac on 15/9/3.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  我的预约

#import "AppointlistController.h"

@interface AppointlistController ()

@end

@implementation AppointlistController
@synthesize v_tableView;
@synthesize tableArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    
    self.title= @"我的预约";
    

    v_tableView.tableFooterView = [[UIView alloc] init];
    v_tableView.backgroundColor=[UIColor clearColor];
    
    v_tableView.tableFooterView.backgroundColor=BACKVIEWCOLOR;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#define CellHight  110
#pragma mark- UITableView dataSource and delegate methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    NSArray *imageArray=[NSArray arrayWithObjects:
                         @"Photo1.png",
                         @"Photo2.png",
                         @"Photo3.png",
                         @"Photo4.png",
                         nil];
    
    UIImageView *ImagePhoto=[[UIImageView alloc]init];
    [cell addSubview:ImagePhoto];
    ImagePhoto.image=[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    
    ImagePhoto.frame=CGRectMake(10, 20, 70, 70);
    
    
    UILabel *label=[[UILabel alloc]init];
    [cell addSubview:label];
    
    label.frame=CGRectMake(110, 18, 200, 30);
    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentLeft;
    label.text=@"预约医生：徐建平";
    
    UILabel *label1=[[UILabel alloc]init];
    [cell addSubview:label1];
    label1.frame=CGRectMake(110, CellHight/2-10, 200, 30);
    label1.font=[UIFont systemFontOfSize:11];
    label1.textAlignment=NSTextAlignmentLeft;
    label1.text=@"预约科室: 心血管科";
    
    UILabel *labeltime=[[UILabel alloc]init];
    [cell addSubview:labeltime];
    labeltime.frame=CGRectMake(210, CellHight/2-10, 100, 30);
    labeltime.font=[UIFont systemFontOfSize:11];
    labeltime.textAlignment=NSTextAlignmentRight;
    labeltime.text=@"2015-09-10";
    
    UILabel *label2=[[UILabel alloc]init];
    [cell addSubview:label2];
    label2.frame=CGRectMake(110,  CellHight/2-15+30 , 200, 30);
    label2.font=[UIFont systemFontOfSize:12];
    label2.textAlignment=NSTextAlignmentLeft;
    label2.text=@"病情简述: 心血管疾病";
    label2.textColor=[UIColor redColor];
    
    UIButton *btns=[UIButton buttonWithType:UIButtonTypeCustom];
    [cell addSubview:btns];
    btns.frame=CGRectMake(ScreenWidth-60,  CellHight/2-15+30 , 50, 30);
    btns.titleLabel.font=[UIFont systemFontOfSize:12];
    [btns setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btns setTitle:@"取消" forState:UIControlStateNormal];
    
    [btns addTarget:self action:@selector(action2:) forControlEvents:UIControlEventTouchUpInside];
    
    
    if (indexPath.row==0) {
        labeltime.text=@"2015-03-10";
        [btns setTitle:@"完成" forState:UIControlStateNormal];
        [btns setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
}



- (IBAction)action2:(id)sender {
    
    DLog(@"ooooo");
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
}

@end
