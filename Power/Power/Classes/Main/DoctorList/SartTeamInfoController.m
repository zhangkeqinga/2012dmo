//
//  SartTeamInfoController.m
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "SartTeamInfoController.h"

@interface SartTeamInfoController ()

@end

@implementation SartTeamInfoController

@synthesize v_tableView;

- (void)withManger:(DoctorModel *)doctor_{
    
}


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self setTitleBackItemImageAndTitle];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBackItemImageAndTitle];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#define CellHight  110
#pragma mark- tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 58;
    }else{
        return 40;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        
        UIView *view=[[UIView alloc]init];
        view.backgroundColor=COLORO(244, 245, 246);
        view.frame=CGRectMake(0, 0, ScreenWidth, 58);
        
        UIImageView *Images=[[UIImageView alloc]init];
        Images.frame=CGRectMake(0, 0, ScreenWidth, 58);
        Images.image=[UIImage imageNamed:@"Info1.png"];
        [view addSubview:Images];
        
        return view;
        
    }else {
        UIView *view=[[UIView alloc]init];
        view.backgroundColor=COLORO(244, 245, 246);
        view.frame=CGRectMake(0, 0, ScreenWidth, 40);
        
        UILabel *title=[[UILabel alloc]init];
        title.frame=CGRectMake(20, 0, ScreenWidth, 40);
        title.font=[UIFont boldSystemFontOfSize:16];
        
        if (section==1) {
            title.text=@"团队队长";
            
        }else{
            title.text=@"团队成员";
            
        }
        
        [view addSubview:title];
        return view;
        
        
        
    }
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    else if (section==1) {
        return 1;
    }
    else{
        return 2;
    }
    
    
}
#pragma mark- UITableView dataSource and delegate methods


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0) {
        return 144;
    }
    else {
        return 153;
        
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    UIImageView *ImagePhoto=[[UIImageView alloc]init];
    [cell addSubview:ImagePhoto];
    
    if (indexPath.section==0) {
        ImagePhoto.image=[UIImage imageNamed:@"Info2.png"];
        ImagePhoto.frame=CGRectMake(0, 0, ScreenWidth, 144);
    }
    if (indexPath.section==1) {
        ImagePhoto.image=[UIImage imageNamed:@"Info3.png"];
        ImagePhoto.frame=CGRectMake(0, 0, ScreenWidth, 153);
    }
    if (indexPath.section==2) {
        ImagePhoto.image=[UIImage imageNamed:@"Info3.png"];
        ImagePhoto.frame=CGRectMake(0, 0, ScreenWidth, 153);
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
}

@end
