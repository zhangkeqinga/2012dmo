//
//  LoginSuccessController.m
//  BGPreferentialShare
//
//  Created by Dong on 15-3-11.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "LoginSuccessController.h"

#import "AFHTTPRequestOperationManager.h"

@interface LoginSuccessController ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *msg_tableView;

@property (strong, nonatomic) NSMutableArray *menuList;
@property (strong, nonatomic) NSMutableArray *dataList1;
@property (strong, nonatomic) NSMutableArray *dataList2;
@property (strong, nonatomic) NSMutableArray *dataList3;

@property (assign, nonatomic) NSInteger currentPage;

@property (weak, nonatomic) IBOutlet BGProgressView *progressView;

@end

@implementation LoginSuccessController

@synthesize requestSerializer;


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setTitleBackItemNil];
    self.tabBarController.tabBar.hidden=NO;

//    [_msg_tableView.header beginRefreshing];
    

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton=YES;
    
    self.tabBarController.tabBar.hidden=NO;

    //将下面的不现实的cell横线去掉
    _msg_tableView.tableFooterView = [[UIView alloc] init];
    _msg_tableView.backgroundColor=BACKVIEWCOLOR;
    _msg_tableView.showsVerticalScrollIndicator=NO;
    
    [self initRequest];  //我的资产

    [self setup];
    
    
    
    
}





#pragma mark-我的资产
- (void)initRequest{
    
    NSString *userId=[NSString string];
    NSString *phoneNum=[NSString string];

    userId=[Users userId];
    phoneNum =[Users phoneNumber];
    
    if (![self isnotNetWorking]) {
        return;
    }
    
    
    [self showWaitLoading];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    requestSerializer=[AFHTTPRequestSerializer serializer];
    [requestSerializer setValue:[Users tokenString] forHTTPHeaderField:@"TOKEN"];
    [manager setRequestSerializer:requestSerializer];
    
    NSDictionary *dict = @{ @"uid":userId,@"phone":phoneNum };
    
    
    NSString *urlString=[NSString stringWithFormat:@"%@",myassetsUrl];
    DLog(@"urlString == %@&%@",urlString,dict);

    
    //3.请求  第14个借口 我的资产
    [manager POST:myassetsUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString * isOk=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];

        if ([@"2001" isEqual:isOk]) { //请求成功

            NSMutableDictionary *dic=[NSMutableDictionary dictionaryWithDictionary:[responseObject objectForKey:@"result"]];
            
            if ([Users phoneNumber]) {
                [dic setObject:[Users phoneNumber] forKey:@"phone"];
                [dic setObject:[Users userId] forKey:@"id"];

                NSDate   *loginDate=[NSDate date];
                NSString *loginTime=[UnitPath stringFromDateSecond:loginDate];
                [dic setValue:loginTime forKey:@"loginSystemTime"];

            }

            
            [Users loginSystem:dic];
            [_msg_tableView reloadData];
            
        }else {
            
            AlertUtils *alert = [AlertUtils sharedInstance];
            [alert showWithText:@"登陆失败" inView:self.view lastTime:1.0];
           
            DLog(@"buyView9099 error = %@",messages);
        }
        
        [self hideWaitLoading];
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请求失败" inView:self.view lastTime:1.0];
        
        DLog(@"%@", error);
        
        [self hideWaitLoading];
    }];
}


- (void)setup
{
    _msg_tableView.tableFooterView = [[UIView alloc] init];
    _msg_tableView.tableFooterView.backgroundColor=BACKVIEWACOLOR;
    _msg_tableView.backgroundColor=BACKVIEWACOLOR;
    
    
    _menuList  = [[NSMutableArray alloc] init];
    _dataList1 = [[NSMutableArray alloc] init];
    _dataList2 = [[NSMutableArray alloc] init];
    _dataList3 = [[NSMutableArray alloc] init];
    
    
    // 添加下拉刷新
    [_msg_tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];

    
}

//下拉刷新
- (void)headerRefreshing
{
    _currentPage = 0;
    
    NSString *page = [NSString stringWithFormat:@"%ld",(long)_currentPage];
    
    [self loadData:page];
}

//上拉加载更多
- (void)footerRefreshing
{
    _currentPage=_currentPage +10;
    
    NSString *page = [NSString stringWithFormat:@"%ld",(long)_currentPage];
    
    [self loadData:page];
}

//结束刷新
- (void)endRefreshing
{
    if (_msg_tableView.header.isRefreshing)
    {
        [_msg_tableView.header endRefreshing];
    }
    
    if (_msg_tableView.footer.isRefreshing)
    {
        [_msg_tableView.footer endRefreshing];
    }
}

- (void)loadData:(NSString *)page
{
    if ([page isEqualToString:@"1"])
    {
        [_menuList removeAllObjects];
        [_dataList1 removeAllObjects];
        [_dataList2 removeAllObjects];
        [_dataList3 removeAllObjects];

    }
    
    [_dataList1 addObject:@"理财产品1_02.png"];
    [_dataList1 addObject:@"理财产品1_02.png"];
    [_dataList1 addObject:@"理财产品1_02.png"];
    [_dataList2 addObject:@"理财产品1_04.png"];
    
    [self endRefreshing];
    
    [_msg_tableView reloadData];
}



#pragma mark- UITableView dataSource and delegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==0)
//        return 70;
        return 120;

    if(indexPath.row==1)
        return 95;
    
    if(indexPath.row==2)
        return 45;

//        return 76;
    
    if(indexPath.row==3)
        return 20;
    
    if(indexPath.row==4)
        return 39;
    
    if(indexPath.row==5)
        return 39;
    if(indexPath.row==6)
        return 39;
    if(indexPath.row==7)
        return 39;

    if(indexPath.row==8)
        return 60;

    else return 58;
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    static NSString *identifier6 = @"tableCellAcc";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier6 forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor clearColor];

    return cell;

    

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.msg_tableView deselectRowAtIndexPath:[self.msg_tableView indexPathForSelectedRow] animated:YES];
    
    
    //退出
    if (indexPath.row==8) {
        
//        [AlertUtil alertSuerAndCancelWithDelegate:@"是否确认退出当前账号？" delegate:self withTag:2000];
 
    }


    
}


- (IBAction)loginOutAction:(id)sender
{
    
    [AlertUtil alertSuerAndCancelWithDelegate:@"是否确认退出当前账号？" delegate:self withTag:2000];
    
    //    [self isLoginOut];
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginOut" object:nil];
    
}




- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    switch (buttonIndex) {
            
        case 0:{
            
            //            if (alertView.tag==1000) {
            //
            //                self.gustrSwitch.on=NO;
            //
            //            }
            
            if (alertView.tag==2000) {
                
            }
            
        }
            break;
            
        case 1:
        {
            
//            if (alertView.tag==1000) {
//                [self lockGesterNew];
//            }
            
            
            
            if (alertView.tag==2000) {
                [self isLoginOut];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginOut" object:nil];
                
            }
            
        }
            break;
        default:
            break;
    }
    
}

//登陆判断
- (void)isLoginOut
{
    [Users logoutSystem];//删除个人信息
}



- (IBAction)countInformationAction:(id)sender{
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"LoginSuccess" bundle:nil];
    
    switch ([sender tag]) {
        case 112200:  //资产明细
        {

        }
            break;
        case 112201:
        {
            
        }
            break;
        default:
            break;
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
