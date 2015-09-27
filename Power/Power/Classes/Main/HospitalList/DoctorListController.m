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
#import "UIImageView+WebCache.h"


@interface DoctorListController ()
{
    NSInteger pageIndex;
    NSInteger pageSize;
    
}

@property(nonatomic , strong) HospitalModel *hospitalmodel;

@end

@implementation DoctorListController

@synthesize v_tableView;
@synthesize tableArray;
@synthesize hospitalmodel = _hospitalmodel;

- (void)withManger:(HospitalModel *)hospital_{
    
    _hospitalmodel = hospital_;
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    self.title = @"医生列表";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBackItemImageAndTitle];
    self.tableArray = [NSMutableArray array];
    
    pageIndex = 1;
    pageSize = 10;

    
//    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
//    tableArray=[plistDic objectForKey:@"DOCTOR_LIST"];

    v_tableView.tableFooterView = [[UIView alloc] init];
    [v_tableView reloadData];
    
    [self initRequest];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#define CellHight  110

#pragma mark- ScrollviewDelegate
-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    NSLog(@"index--%lu",(unsigned long)index);
}

#pragma mark- UITableView dataSource and delegate methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableArray) {
        return [tableArray count];
    }else{
        return 0;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    NSDictionary *dic=[tableArray objectAtIndex:indexPath.row];
    UIImageView *ImagePhoto=[[UIImageView alloc]init];
    [cell addSubview:ImagePhoto];
    ImagePhoto.frame=CGRectMake(10, 20, 70, 70);
    //    ImagePhoto.image=[UIImage imageNamed:[dic objectForKey:@"photoimage"]];
    
    NSString *stringUrl=[dic objectForKey:@"doctorImage"];
    
    //中文的url链接
    stringUrl = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)stringUrl, nil, nil, kCFStringEncodingUTF8));
    
    //    DLog(@"stringUrl==%@",stringUrl);
    
    NSURL *url =[NSURL URLWithString:stringUrl];
    
    //    DLog(@"url==%@",url);
    [ImagePhoto sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"product_DetailInfo"]];
    
    
    
    UILabel *label=[[UILabel alloc]init];
    [cell addSubview:label];
    
    label.frame=CGRectMake(110, 18, 200, 30);
    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentLeft;
    label.text=@"徐建平";
    //    label.text=[dic objectForKey:@"name"];
    label.text=[dic objectForKey:@"doctorName"];
    
    
    UILabel *label1=[[UILabel alloc]init];
    [cell addSubview:label1];
    label1.frame=CGRectMake(110, CellHight/2-10, 200, 30);
    label1.font=[UIFont systemFontOfSize:11];
    label1.textAlignment=NSTextAlignmentLeft;
    label1.text=@"科室: 心血管科";
    //    label1.text=[NSString stringWithFormat:@"科室: %@", [dic objectForKey:@"department"]];
    label1.text=[NSString stringWithFormat:@"科室: %@", [dic objectForKey:@"doctorSection"]];
    
    
    UILabel *labeltime=[[UILabel alloc]init];
    [cell addSubview:labeltime];
    labeltime.frame=CGRectMake(210, CellHight/2-10, 100, 30);
    labeltime.font=[UIFont systemFontOfSize:11];
    labeltime.textAlignment=NSTextAlignmentLeft;
    labeltime.text=@"职位: 主任医生";
    //    labeltime.text=[NSString stringWithFormat:@"职位: %@",[dic objectForKey:@"position"]];
    
    labeltime.text=[NSString stringWithFormat:@"职位: %@",[dic objectForKey:@"doctorTitle"]];
    
    
    UILabel *label2=[[UILabel alloc]init];
    [cell addSubview:label2];
    label2.frame=CGRectMake(110,  CellHight/2-15+30 , 200, 30);
    label2.font=[UIFont systemFontOfSize:12];
    label2.textAlignment=NSTextAlignmentLeft;
    label2.text=@"心血管科国内前三甲";
    label2.textColor=[UIColor redColor];
    //    label2.text=[dic objectForKey:@"specialty"];
    label2.text=[dic objectForKey:@"doctorSpecial"];
    
    
    UIButton *pointBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [cell addSubview:pointBtn];
    pointBtn.frame=CGRectMake(ScreenWidth-80, 15, 60, 26);
    [pointBtn setBackgroundImage:[UIImage imageNamed:@"12_03.png"] forState:UIControlStateNormal];
    
    [pointBtn setTitle:@"关注" forState:UIControlStateNormal];
    [pointBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    pointBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [pointBtn addTarget:self action:@selector(pointDoctor:) forControlEvents:UIControlEventTouchUpInside];
    pointBtn.tag = indexPath.row;
    
    
    
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
    NSDictionary *dic=[tableArray objectAtIndex:indexPath.row];
    
    DoctorSingleInfoController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"DoctorSingleInfoController"];
    [doctor withMangerDic:dic];
    
    [self.navigationController pushViewController:doctor animated:YES];
    
    
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}


- (IBAction)pointDoctor:(id)sender{
    
    NSLog(@"关注按钮");
    
    NSDictionary *dic=[tableArray objectAtIndex:[sender tag]];
    
    [self initAttentionRequest:[dic objectForKey:@"id"]];
    
    
}



#pragma mark- 取消关注
- (void)initCancleAppointRequest{
    
}


#pragma mark- 添加关注
- (void)initAttentionRequest:(NSString *)doctorId{
    
    if (!doctorId) {
        DLog(@"添加关注 添加关注 添加关注 添加关注 doctorId");
    }
    
    if (![Users phoneNumber]) {
        DLog(@"添加关注 添加关注 添加关注 添加关注 phoneNumber");
    }
    
    
    NSDictionary *dict = @{ @"doctorId": doctorId,
                            @"userPhone": [Users phoneNumber],
                            @"token": @"",
                            @"type": @"1"
                            };
    
    
    DLog(@"添加关注dict==%@",dict);
    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    
    [manager POST:attentionUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 成功
            
            AlertUtils *alert = [AlertUtils sharedInstance];
            [alert showWithText:@"已关注" inView:self.view lastTime:1.0];
            
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


#pragma mark- 医生列表
- (void)initRequest{
    
    NSDictionary *dict = @{ @"doctorTitle": _hospitalmodel.hospitalName,
                            @"doctorSection": @"",
                            @"doctorHospital": @"",
                            @"pageIndex": [NSString stringWithFormat:@"%ld",(long)pageIndex],
                            @"pageSize": [NSString stringWithFormat:@"%ld",(long)pageSize],
                            @"dorctorProvince": @""
                            
                            };
    
    DLog(@"消息dict==%@",dict);
    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    
    [manager POST:doctorUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 成功
            
            NSMutableArray * result=[responseObject objectForKey:@"result"];
            NSString *string= [NSString stringWithFormat:@"%@",result];
            
            if (result && ![@"<null>" isEqualToString:string]) {
                
                tableArray = result;
                DLog(@" tableArray= %@",tableArray);
                
                if (tableArray.count==0) {
                    AlertUtils *alert = [AlertUtils sharedInstance];
                    [alert showWithText:@"暂无医生信息" inView:self.view lastTime:1.0];
                }

                [self.v_tableView reloadData];
                
            }else{
                
                if (tableArray.count==0) {
                    
                    AlertUtils *alert = [AlertUtils sharedInstance];
                    [alert showWithText:@"暂无医生信息" inView:self.view lastTime:1.0];

                }
                
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






//
//#define CellHight_Header  120
//#define CellHight  110
//
//#pragma mark- tableViewDelegate
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [tableArray count];
//}
//
//
//
//#pragma mark- UITableView dataSource and delegate methods
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section==0) {
//        return CellHight_Header;
//    }else{
//        return CellHight;
//    }
//
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    UITableViewCell *cell = [[UITableViewCell alloc]init];
//
//    UIImageView *ImagePhoto=[[UIImageView alloc]init];
//    [cell addSubview:ImagePhoto];
//    ImagePhoto.frame=CGRectMake(10, 20, 70, 70);
//
//
//
//    UILabel *label=[[UILabel alloc]init];
//    [cell addSubview:label];
//    label.frame=CGRectMake(90, 18, 200, 30);
//    label.font=[UIFont boldSystemFontOfSize:16];
//    label.textAlignment=NSTextAlignmentLeft;
//    
//    
//    UILabel *label01=[[UILabel alloc]init];
//    [cell addSubview:label01];
//    label01.frame=CGRectMake(160, 23, 200, 25);
//    label01.font=[UIFont systemFontOfSize:12];
//    label01.textAlignment=NSTextAlignmentLeft;
//    label01.textColor=[UIColor lightGrayColor];
//    
//    
//    
//    UIButton *pointBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    [cell addSubview:pointBtn];
//    pointBtn.frame=CGRectMake(ScreenWidth-80, 15, 60, 26);
//    [pointBtn setBackgroundImage:[UIImage imageNamed:@"12_03.png"] forState:UIControlStateNormal];
//
//    [pointBtn setTitle:@"关注" forState:UIControlStateNormal];
//    [pointBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    pointBtn.titleLabel.font=[UIFont systemFontOfSize:14];
//    [pointBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    
//    [pointBtn addTarget:self action:@selector(pointDoctor:) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    UILabel *label1=[[UILabel alloc]init];
//    [cell addSubview:label1];
//    label1.frame=CGRectMake(90, CellHight/2-10, 200, 30);
//    label1.font=[UIFont systemFontOfSize:14];
//    label1.textAlignment=NSTextAlignmentLeft;
//    
//    
//    UILabel *label2=[[UILabel alloc]init];
//    [cell addSubview:label2];
//    label2.frame=CGRectMake(90,  CellHight/2-15+30 , 200, 30);
//    label2.font=[UIFont systemFontOfSize:12];
//    label2.textAlignment=NSTextAlignmentLeft;
//        
//    
//    NSDictionary *dic=[tableArray objectAtIndex:indexPath.row];
//    
//        label.text=@"徐建平";
//        label01.text=@"主任医师";
//        label1.text=@"科室: 心血管科";
//        label2.text=@"心血管科内科";
//        
//    label.text=  [dic objectForKey:@"name"];
//    label01.text=[dic objectForKey:@"department"];
//    label1.text= [dic objectForKey:@"position"];
//    label2.text= [dic objectForKey:@"specialty"];
//    ImagePhoto.image= [UIImage imageNamed:[dic objectForKey:@"photoimage"]];
//
//    
////    NSURL *url = [NSURL URLWithString:[dic objectForKey:@"photoimage"]];
////    [ImagePhoto sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default"]];
//
//    
//    return cell;
//
//    
////    }
//
//    
//    
//}
//
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
//    
//    
//    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
//    NSDictionary *dicss=[tableArray objectAtIndex:indexPath.row];
//
//    DoctorSingleInfoController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"DoctorSingleInfoController"];
//    [doctor withMangerDic:dicss];
//    [self.navigationController pushViewController:doctor animated:YES];
//    
//    
//}
//
//
//- (IBAction)pointDoctor:(id)sender{
//    
//    NSLog(@"关注按钮");
//    
//    AlertUtils *alert = [AlertUtils sharedInstance];
//    [alert showWithText:@"已关注" inView:self.view lastTime:1.0];
//
//    
////    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
////    PointApplyInfoCommitController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"PointApplyInfoCommitController"];
////    [self.navigationController pushViewController:doctor animated:YES];
//    
//    
//}
//
//
//
//- (IBAction)selectTypeNumber:(id)sender{
//    
//    
//    
//}





@end
