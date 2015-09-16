//
//  MedicalInfoController.m
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "MedicalInfoController.h"

@interface MedicalInfoController ()

@end

@implementation MedicalInfoController

@synthesize v_tableView;
@synthesize tableArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;

    self.title= @"病例详情";

    tableArray=[NSMutableArray array];
    
    [tableArray addObject:@"就诊科室: 结直肠癌科"];
    [tableArray addObject:@"就诊时间: 2015-06-03"];
    [tableArray addObject:@"就诊医院: 合肥时附属医院"];
    [tableArray addObject:@"就诊医生: 徐建平"];
    [tableArray addObject:@"诊断结果: ********************"];
    [tableArray addObject:@"治疗方案: 测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试"];
    [tableArray addObject:@"相关图片: -"];
    
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

#define CellHight  50

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableArray count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return CellHight;
    

    NSString *strings=[NSString string];
    
    if(self.tableArray){
        
        strings=[self.tableArray objectAtIndex:indexPath.row];
    }else{
        strings=@"  ";
    }
    CGSize sizeFrame = [UnitPath calculateFrameWithContent:strings];
    
    return 40+sizeFrame.height;
        

}

//#define lableXdistance  110
#define lableXdistance  20


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    UILabel *label=[[UILabel alloc]init];
    [cell addSubview:label];
    
    
    NSString *strings=[NSString string];
    
    if(self.tableArray){
        
        strings=[self.tableArray objectAtIndex:indexPath.row];
    }else{
        strings=@"  ";
    }
    CGSize sizeFrame = [UnitPath calculateFrameWithContent:strings];

    label.frame=CGRectMake(lableXdistance, 0, ScreenWidth-40, sizeFrame.height+40);
    
    
    label.numberOfLines=4;

    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentLeft;
    label.text= [self.tableArray objectAtIndex:indexPath.row];

    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
}


@end
