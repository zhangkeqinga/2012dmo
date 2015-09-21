//
//  RewardPointVC.m
//  Power
//
//  Created by mac on 15/9/18.
//  Copyright © 2015年 huiwei. All rights reserved.
//  我的积分

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
    
    self.title= @"我的积分";
    
    tableArray = [NSMutableArray array];
    
//    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
//    tableArray=[plistDic objectForKey:@"REWARDPOINT"];
    
    [self initRequest];
    
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
    return 1;

//    return [tableArray count];
    
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
    label1.font=[UIFont systemFontOfSize:14];
    label1.textAlignment=NSTextAlignmentLeft;
    label1.text=@"科室: 心血管科";
    
    UILabel *labeltime=[[UILabel alloc]init];
//    [cell addSubview:labeltime];
    labeltime.frame=CGRectMake(ScreenWidth-100-15,  18 , 100, 30);
    labeltime.font=[UIFont systemFontOfSize:14];
    labeltime.textAlignment=NSTextAlignmentRight;
    labeltime.text=@"2015-09-10";
    
//    label.text = [dic objectForKey:@"title"];
//    label1.text = [dic objectForKey:@"content"];
//    labeltime.text = [dic objectForKey:@"time"];
    
    label.text = @"我的积分";
    
    label1.text = @"";

    if (tableArray){
        if (tableArray.count>indexPath.row){
            
            if (![@"<null>" isEqual:[tableArray objectAtIndex:indexPath.row]]){
                label1.text = [tableArray objectAtIndex:indexPath.row];
            }else{
                 label1.text = @"0";
            }
        }
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




#pragma mark- 积分
- (void)initRequest{
    
    NSDictionary *dict = @{ @"userPhone": [Users phoneNumber],
                            @"token":@" "
                            
                            };
    DLog(@"消息dict==%@",dict);
    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    [manager POST:rewardUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 成功
            
            NSString * result=[NSString stringWithFormat:@"%@",[responseObject objectForKey:@"result"]];
            
            if (tableArray) {
                [tableArray removeAllObjects];
            }
            
            [tableArray addObject:result];
            [self.v_tableView reloadData];
            
        }else{ //
            
            DLog(@" messages= %@",messages);
        }
        
        [self hideWaitLoading];
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请求失败" inView:self.view lastTime:1.0];
        
        DLog(@"error＝%@", error);
        [self hideWaitLoading];
    }];
    
}



@end
