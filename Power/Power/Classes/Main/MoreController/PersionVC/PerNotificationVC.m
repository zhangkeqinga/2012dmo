//
//  PerNotificationVC.m
//  Power
//
//  Created by mac on 15/9/18.
//  Copyright © 2015年 huiwei. All rights reserved.
//

#import "PerNotificationVC.h"

@interface PerNotificationVC ()

@end

@implementation PerNotificationVC
@synthesize v_tableView;
@synthesize tableArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    
    self.title= @"我的消息";
    
    tableArray = [NSMutableArray array];
    
//    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
//    tableArray=[plistDic objectForKey:@"NOTIFICATION"];
    
    v_tableView.tableFooterView = [[UIView alloc] init];
    v_tableView.backgroundColor=[UIColor clearColor];
    
    v_tableView.tableFooterView.backgroundColor=BACKVIEWCOLOR;
    
    
    if ([Users isLoginSystem]){
        [self initRequest];
        
    }else{
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请先登录" inView:self.view lastTime:1.0];
        //                [AlertUtil alertSuerAndCancelWithDelegate:@"请先登录" delegate:self];
        
    }

    
    
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
    
    UILabel *label1=[[UILabel alloc]init];
    [cell addSubview:label1];
    label1.frame=CGRectMake(15, CellHight/2, 200, 30);
    label1.font=[UIFont systemFontOfSize:11];
    label1.textAlignment=NSTextAlignmentLeft;
    
    UILabel *labeltime=[[UILabel alloc]init];
    [cell addSubview:labeltime];
    labeltime.frame=CGRectMake(ScreenWidth-100-15,  18 , 100, 30);
    labeltime.font=[UIFont systemFontOfSize:11];
    labeltime.textAlignment=NSTextAlignmentRight;
    
    NSDictionary *dic=[self.tableArray objectAtIndex:indexPath.row];
    
    label.text = [dic objectForKey:@"title"];
    label1.text = [dic objectForKey:@"content"];
//    label1.text = @"上传影像送50积分";  // test
    labeltime.text = [UnitPath ymdString:[dic objectForKey:@"createTime"]];
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
}

//info = SUCCESS;
//message = OK;
//result =     (
//              {
//                  content = "\U4e0a\U4f20\U5f71\U50cf\U5373\U9001200\U79ef\U5206";
//                  createIp = "<null>";
//                  createTime = "2015-09-18 16:42:12.000";
//                  createUser = "<null>";
//                  createUserName = "<null>";
//                  id = 1;
//                  isDelete = 0;
//                  order = "<null>";
//                  page = "<null>";
//                  rows = "<null>";
//                  sort = "<null>";
//                  time = "2015-09-20 16:42:12.000";
//                  title = "\U6d88\U606f1";
//                  updateIp = "<null>";
//                  updateTime = "<null>";
//                  updateUser = "<null>";
//                  updateUserName = "<null>";
//              }
//              );
//status = 2001;


- (IBAction)action2:(id)sender {
    
    DLog(@"ooooo");
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
}




#pragma mark- 消息
- (void)initRequest{
    
    NSDictionary *dict = @{ @"userPhone": [Users phoneNumber]
                            };
    DLog(@"消息dict==%@",dict);
    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    [manager POST:notificationUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 成功
            
            NSMutableArray * result=[responseObject objectForKey:@"result"];
            NSString *string= [NSString stringWithFormat:@"%@",result];

            if (result && ![@"<null>" isEqualToString:string]) {

                tableArray = result;
                [self.v_tableView reloadData];
            }
            
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