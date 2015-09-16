//
//  CommIssueController.m
//  Bull
//
//  Created by mac on 15/7/5.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "CommIssueController.h"
#import "IssueCell.h"

#import "CommIssueInfoController.h"

@interface CommIssueController ()

@end

@implementation CommIssueController

@synthesize v_tableView;
@synthesize tableArray;




- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden=YES;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarController.tabBar.hidden=YES;
    self.title=@"常见问题";
    
    tableArray = [NSArray array];
    [self getTableDataArray];
    
}

//获取联系方式
- (void)getTableDataArray{
    
    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
    tableArray = [plistDic objectForKey:@"ISSUE"];
    
}



#pragma mark- UITableView dataSource and delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableArray count] ;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier= @"IssueCell";
    IssueCell *cell1 = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if ([tableArray count]>indexPath.row) {
        NSDictionary *dic_=[tableArray objectAtIndex:indexPath.row];
        cell1.titleImg.image = [UIImage imageNamed:[dic_ objectForKey:@"Img"]];
        cell1.titleLb.text = [dic_ objectForKey:@"Title"];
    
    }
    
    return cell1;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.v_tableView deselectRowAtIndexPath:[self.v_tableView indexPathForSelectedRow] animated:YES];
    
    CommIssueInfoController *IssueView=[[CommIssueInfoController alloc]init];

    if ([self.tableArray count]>indexPath.row) {
        
        NSDictionary *dic_=[self.tableArray objectAtIndex:indexPath.row];
        [IssueView withTableDataArray:dic_];
        
        [self.navigationController pushViewController:IssueView animated:YES];

    }
    
    

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

@end
