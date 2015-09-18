//
//  RewardPointVC.m
//  Power
//
//  Created by mac on 15/9/18.
//  Copyright © 2015年 huiwei. All rights reserved.
//

#import "RewardPointVC.h"

@interface RewardPointVC ()

@end

@implementation RewardPointVC
@synthesize v_tableView;
@synthesize tableArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    
    //    self.title= @"我的预约";
    
    self.title= @"我的积分";
    
    tableArray = [NSMutableArray array];
    
    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
    tableArray=[plistDic objectForKey:@"REWARDPOINT"];
    
    
    v_tableView.tableFooterView = [[UIView alloc] init];
    v_tableView.backgroundColor=[UIColor clearColor];
    
    v_tableView.tableFooterView.backgroundColor=BACKVIEWCOLOR;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#define CellHight  80
#pragma mark- UITableView dataSource and delegate methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableArray count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    UILabel *label=[[UILabel alloc]init];
    [cell addSubview:label];
    
    label.frame=CGRectMake(15, 18, 200, 30);
    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentLeft;
    label.text=@"医生：徐建平";
    
    UILabel *label1=[[UILabel alloc]init];
    [cell addSubview:label1];
    label1.frame=CGRectMake(15, CellHight/2, 200, 30);
    label1.font=[UIFont systemFontOfSize:11];
    label1.textAlignment=NSTextAlignmentLeft;
    label1.text=@"科室: 心血管科";
    
    UILabel *labeltime=[[UILabel alloc]init];
    [cell addSubview:labeltime];
    labeltime.frame=CGRectMake(ScreenWidth-100-15,  18 , 100, 30);
    labeltime.font=[UIFont systemFontOfSize:11];
    labeltime.textAlignment=NSTextAlignmentRight;
    labeltime.text=@"2015-09-10";
    
    NSDictionary *dic=[self.tableArray objectAtIndex:indexPath.row];
    
    label.text = [dic objectForKey:@"title"];
    label1.text = [dic objectForKey:@"content"];
    labeltime.text = [dic objectForKey:@"time"];
    
    
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
