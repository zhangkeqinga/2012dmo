//
//  DoctorTeamController.m
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "DoctorTeamController.h"
#import "DoctorListController.h"



@interface DoctorTeamController ()

@end

@implementation DoctorTeamController
@synthesize v_tableView;


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitleBackItemNil];
    //    self.navigationController.navigationBarHidden=YES;
    self.tabBarController.tabBar.hidden=NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#define CellHight  120

#pragma mark- ScrollviewDelegate
-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    NSLog(@"index--%lu",(unsigned long)index);
}

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
    NSArray *arryImg=[NSArray arrayWithObjects:
                      @"北京大学人民医院.png",
                      @"武汉人民医院.png",
                      @"合肥第一人民医院.png",
//                      @"安徽省立医院.png",
//                      @"太和县中医院.png",
                      @"蚌埠第一附属医院.png",
                       nil];
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    
    UIImageView *ImagePhoto=[[UIImageView alloc]init];
    [cell addSubview:ImagePhoto];
    ImagePhoto.image=[UIImage imageNamed:[arryImg objectAtIndex:indexPath.row]];
    
    if (indexPath.row==0) {
        ImagePhoto.frame=CGRectMake(0, 0, ScreenWidth, 120);
    }else{
        ImagePhoto.frame=CGRectMake(15, 15, ScreenWidth-30, 120-15);
    }
    
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
    
    DoctorListController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"DoctorListController"];
    DoctorModel *doctors=[[DoctorModel alloc]init];
    
//    doctors.typeTag=[NSString stringWithFormat:@"%d",[sender tag]-1000];
    
    [doctor withManger:doctors];
    
    [self.navigationController pushViewController:doctor animated:YES];
    

    
}
@end
