//
//  DoctorSingleInfoController.m
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "DoctorSingleInfoController.h"

@interface DoctorSingleInfoController ()

@end

@implementation DoctorSingleInfoController
@synthesize v_tableView;


- (void)withManger:(DoctorModel *)doctor_{
    
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


#define CellHight  110
#pragma mark- tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        return 0;
    }
    else if (section==1) {
        return 10;
    }
    else{
        return 10;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=COLORO(240, 240, 240);
    view.frame=CGRectMake(0, 0, ScreenWidth, 10);
    return view;
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
        return 1;
    }
}
#pragma mark- UITableView dataSource and delegate methods


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 170;
    }
    else if (indexPath.section==1) {
        return 45;
    }
    else{
        return 100;
    }}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];

    if (indexPath.section==0) {
        
        UIImageView *ImagePhoto=[[UIImageView alloc]init];
        [cell addSubview:ImagePhoto];
        ImagePhoto.image=[UIImage imageNamed:@"Persion.png"];
        ImagePhoto.frame=CGRectMake(0, 0, ScreenWidth, 170);
        
    }else     if (indexPath.section==1) {
        UILabel *label=[[UILabel alloc]init];
        [cell addSubview:label];
        
        label.frame=CGRectMake(25, 0, ScreenWidth-40, 45);
        label.font=[UIFont systemFontOfSize:14];
        label.textAlignment=NSTextAlignmentLeft;
        label.text=@"职业医院：北京阜外心血管医院";

    }else {
        UITextView *label=[[UITextView alloc]init];
        [cell addSubview:label];
        
        label.frame=CGRectMake(20, 0, ScreenWidth-40, 80);
        label.font=[UIFont systemFontOfSize:14];
        label.textAlignment=NSTextAlignmentLeft;
        label.text=@"简介：冠心病搭桥，各种重症心脏瓣膜病手术、复杂先心病手术";
        
    }
    
    
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
}




@end
