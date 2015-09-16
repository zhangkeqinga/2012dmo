//
//  DoctorListController.m
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  名医

#import "DoctorListController.h"
#import "DoctorSingleInfoController.h"
#import "PointApplyInfoCommitController.h"

@interface DoctorListController ()

@end

@implementation DoctorListController

@synthesize v_tableView;

- (void)withManger:(DoctorModel *)doctor_{
    
    
    NSArray *arraytitle=[NSArray arrayWithObjects:
                         @"心血管科",@"甲状腺科",@"眼科",
                         @"白内障科",@"神经外科",@"结直肠癌科",
                         @"肝胆外科",@"胰腺外科",@"生殖医学科",nil];
    
    
    if ( [arraytitle count] > [doctor_.typeTag integerValue]) {
        self.title= [arraytitle objectAtIndex:[doctor_.typeTag integerValue]];
    }
    

}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;

    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBackItemImageAndTitle];
    
    
    v_tableView.tableFooterView = [[UIView alloc] init];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#define CellHight_Header  120

#define CellHight  110

#pragma mark- tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 35;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *view=[[UIView alloc]init];
//    
//    view.backgroundColor=COLORO(244, 245, 246);
//    view.frame=CGRectMake(0, 0, ScreenWidth, 35);
//    
//    UILabel *title=[[UILabel alloc]init];
//    title.frame=CGRectMake(20, 0, ScreenWidth, 35);
//    title.font=[UIFont boldSystemFontOfSize:16];
//    
////    if (section==0) {
////        title.text=@"明星团队";
////    }else{
//        title.text=@"精选明医";
////    }
//    
//    [view addSubview:title];
//    
//    return view;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (section==0) {
//        return 1;
//    }else{
        return 4;
//    }
}



#pragma mark- UITableView dataSource and delegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0) {
        return CellHight_Header;
    }else{
        return CellHight;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    if (indexPath.section==0) {
//        
//        UITableViewCell *cell = [[UITableViewCell alloc]init];
//        
//        NSArray *imageArray=[NSArray arrayWithObjects:
//                             @"Photo1.png",
//                             @"Photo2.png",
//                             @"Photo3.png",
//                             @"Photo4.png",
//                             nil];
//        
//        
//        UIImageView *ImageBack=[[UIImageView alloc]init];
//        [cell addSubview:ImageBack];
////        ImageBack.image=[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
//        ImageBack.frame=CGRectMake(0  , 0, ScreenWidth, CellHight_Header);
//        
//        
//        UIImageView *ImagePhoto=[[UIImageView alloc]init];
//        [cell addSubview:ImagePhoto];
//        ImagePhoto.image=[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
//        ImagePhoto.frame=CGRectMake(10, 20, 70, 70);
//        
//        
//        UILabel *label=[[UILabel alloc]init];
//        [cell addSubview:label];
//        label.frame=CGRectMake(90, 18, 200, 30);
//        label.font=[UIFont boldSystemFontOfSize:16];
//        label.textAlignment=NSTextAlignmentLeft;
//        
//        
//        UILabel *label01=[[UILabel alloc]init];
//        [cell addSubview:label01];
//        label01.frame=CGRectMake(160, 23, 200, 25);
//        label01.font=[UIFont systemFontOfSize:12];
//        label01.textAlignment=NSTextAlignmentLeft;
//        label01.textColor=[UIColor lightGrayColor];
//        
//        
//        
//        UIButton *pointBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//        [cell addSubview:pointBtn];
//        pointBtn.frame=CGRectMake(ScreenWidth-80, 15, 60, 26);
//        [pointBtn setBackgroundImage:[UIImage imageNamed:@"12_03.png"] forState:UIControlStateNormal];
//        
//        
//        //    [pointBtn setTitle:@"预约" forState:UIControlStateNormal];
//        //    [pointBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        //    pointBtn.titleLabel.font=[UIFont systemFontOfSize:14];
//        
//        
//        [pointBtn addTarget:self action:@selector(pointDoctor:) forControlEvents:UIControlEventTouchUpInside];
//        
//        
//        UILabel *label1=[[UILabel alloc]init];
//        [cell addSubview:label1];
//        label1.frame=CGRectMake(90, CellHight/2-10, 200, 30);
//        label1.font=[UIFont systemFontOfSize:14];
//        label1.textAlignment=NSTextAlignmentLeft;
//        
//        
//        UILabel *label2=[[UILabel alloc]init];
//        [cell addSubview:label2];
//        label2.frame=CGRectMake(90,  CellHight/2-15+30 , 200, 30);
//        label2.font=[UIFont systemFontOfSize:12];
//        label2.textAlignment=NSTextAlignmentLeft;
//        
//        
//        label.text=@"徐建平";
//        label01.text=@"主任医师";
//        label1.text=@"科室: 心血管科";
//        label2.text=@"心血管科内科";
//        
//        
//        return cell;
//
//        
//    
//    }else{
//
    
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
        label.frame=CGRectMake(90, 18, 200, 30);
        label.font=[UIFont boldSystemFontOfSize:16];
        label.textAlignment=NSTextAlignmentLeft;
        
        
        UILabel *label01=[[UILabel alloc]init];
        [cell addSubview:label01];
        label01.frame=CGRectMake(160, 23, 200, 25);
        label01.font=[UIFont systemFontOfSize:12];
        label01.textAlignment=NSTextAlignmentLeft;
        label01.textColor=[UIColor lightGrayColor];
        
        
        
        UIButton *pointBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [cell addSubview:pointBtn];
        pointBtn.frame=CGRectMake(ScreenWidth-80, 15, 60, 26);
        [pointBtn setBackgroundImage:[UIImage imageNamed:@"12_03.png"] forState:UIControlStateNormal];
        
        
        //    [pointBtn setTitle:@"预约" forState:UIControlStateNormal];
        //    [pointBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //    pointBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        
        
        [pointBtn addTarget:self action:@selector(pointDoctor:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UILabel *label1=[[UILabel alloc]init];
        [cell addSubview:label1];
        label1.frame=CGRectMake(90, CellHight/2-10, 200, 30);
        label1.font=[UIFont systemFontOfSize:14];
        label1.textAlignment=NSTextAlignmentLeft;
        
        
        UILabel *label2=[[UILabel alloc]init];
        [cell addSubview:label2];
        label2.frame=CGRectMake(90,  CellHight/2-15+30 , 200, 30);
        label2.font=[UIFont systemFontOfSize:12];
        label2.textAlignment=NSTextAlignmentLeft;
        
        
        label.text=@"徐建平";
        label01.text=@"主任医师";
        label1.text=@"科室: 心血管科";
        label2.text=@"心血管科内科";
        
        
        return cell;

    
//    }

    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
    
    DoctorSingleInfoController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"DoctorSingleInfoController"];
    
    [self.navigationController pushViewController:doctor animated:YES];

    
}


- (IBAction)pointDoctor:(id)sender{
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
    PointApplyInfoCommitController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"PointApplyInfoCommitController"];
    [self.navigationController pushViewController:doctor animated:YES];
     
    
}



- (IBAction)selectTypeNumber:(id)sender{
    
    
    
}





@end
