//
//  AppointlistController.m
//  PowerfullDoctors
//
//  Created by mac on 15/9/3.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  我的预约

#import "AppointlistController.h"

@interface AppointlistController ()

@end

@implementation AppointlistController
@synthesize v_tableView;
@synthesize tableArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    self.title= @"我的关注";

    tableArray = [NSMutableArray array];
    
    v_tableView.tableFooterView = [[UIView alloc] init];
    v_tableView.backgroundColor=[UIColor clearColor];
    v_tableView.tableFooterView.backgroundColor=BACKVIEWCOLOR;
    
    [self initRequest];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#define CellHight  110
#pragma mark- UITableView dataSource and delegate methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableArray count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    
    label.frame=CGRectMake(110, 18, 200, 30);
    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentLeft;
    label.text=@"医生：徐建平";

    UILabel *label1=[[UILabel alloc]init];
    [cell addSubview:label1];
    label1.frame=CGRectMake(110, CellHight/2-10, 200, 30);
    label1.font=[UIFont systemFontOfSize:11];
    label1.textAlignment=NSTextAlignmentLeft;
    label1.text=@"科室: 心血管科";
    
    UILabel *labeltime=[[UILabel alloc]init];
    [cell addSubview:labeltime];
    labeltime.frame=CGRectMake(210, CellHight/2-10, 100, 30);
    labeltime.font=[UIFont systemFontOfSize:11];
    labeltime.textAlignment=NSTextAlignmentRight;
    labeltime.text=@"2015-09-10";
    
    UILabel *label2=[[UILabel alloc]init];
    [cell addSubview:label2];
    label2.frame=CGRectMake(110,  CellHight/2-15+30 , 200, 30);
    label2.font=[UIFont systemFontOfSize:12];
    label2.textAlignment=NSTextAlignmentLeft;
    label2.text=@"病情简述: 心血管疾病";
    label2.textColor=[UIColor redColor];
    
    
    
    UIButton *btns=[UIButton buttonWithType:UIButtonTypeCustom];
    [cell addSubview:btns];
    btns.frame=CGRectMake(ScreenWidth-80,  18 , 70, 25);
    btns.titleLabel.font=[UIFont systemFontOfSize:12];
    [btns setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btns setBackgroundImage:[UIImage imageNamed:@"12_03.png"] forState:UIControlStateNormal];

    [btns setTitle:@"取消关注" forState:UIControlStateNormal];
    [btns addTarget:self action:@selector(action2:) forControlEvents:UIControlEventTouchUpInside];
    btns.titleLabel.font=[UIFont systemFontOfSize:12];

    
    if (self.tableArray) {
        
        NSDictionary *dic =[self.tableArray objectAtIndex:indexPath.row];
        label.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"doctorName"]];
        label1.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"doctorTitle"]];
        labeltime.text= [UnitPath ymdString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"createTime"]]] ;
        label2.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"doctorSpecial"]];
    }
    
    return cell;
}







- (IBAction)pointDoctor:(id)sender{
    
    NSLog(@"关注按钮");
    
    AlertUtils *alert = [AlertUtils sharedInstance];
    [alert showWithText:@"已关注" inView:self.view lastTime:1.0];
    
    
}

//
//{
//    attentionId = 1;
//    createIp = "<null>";
//    createTime = "2015-09-06 16:19:04.444";
//    createUser = "<null>";
//    createUserName = "<null>";
//    doctorAge = 35;
//    doctorCity = "<null>";
//    doctorHospital = "\U4e0a\U6d77\U4eba\U6c11\U533b\U9662";
//    doctorImage = "<null>";
//    doctorInfo = "\U7b80\U4ecb";
//    doctorName = "\U7530\U6e90";
//    doctorProvince = "<null>";
//    doctorSection = "<null>";
//    doctorSectionRank = "<null>";
//    doctorSpecial = "\U7279\U957f";
//    doctorTitle = "\U4f4f\U9662\U533b\U5e08";
//    id = 1;
//    isDelete = 0;
//    order = "<null>";
//    page = "<null>";
//    rows = "<null>";
//    sort = "<null>";
//    teamId = 1;
//    updateIp = "<null>";
//    updateTime = "<null>";
//    updateUser = "<null>";
//    updateUserName = "<null>";
//}
//)
//



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
}



- (IBAction)action2:(id)sender {
    
    DLog(@"ooooo");
    [AlertUtil alertSuerAndCancelWithDelegate:@"确定取消" delegate:self];
    
    
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0) {
        
    }else{
//        NSDictionary *dic =[self.tableArray objectAtIndex:indexPath.row];

        
        
    }
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
}





#pragma mark- 关注
- (void)initRequest{
    
    NSDictionary *dict = @{ @"userPhone": [Users phoneNumber],
                            @"token":@" "
                            };
    
    DLog(@"消息dict==%@",dict);
    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    [manager POST:appointUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 成功
            
            NSDictionary * result=[responseObject objectForKey:@"result"];
            NSMutableArray * doctor=[result objectForKey:@"doctor"];
//            NSMutableArray * doctorTeam=[result objectForKey:@"doctor"];

            NSString *string= [NSString stringWithFormat:@"%@",doctor];
            
            if (doctor && ![@"<null>" isEqualToString:string]) {
                
                tableArray = doctor;
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


//String doctorName;// 医生名称
//Integer doctorAge;// 医生年龄
//String doctorSection;// 医生科室
//Integer doctorSectionRank;// 科室在国内的级别
//String doctorHospital;// 医生所在医院
//String doctorTitle;// 医生职称
//String doctorInfo;// 医生简介
//String doctorImage;// 医生头像
//String doctorSpecial;// 医生特长


//nteger id;// id
//String teamName;// 团队名称
//Integer teamLeader;// 团队队长
//String teamInfo;// 团队简介
//String teamSpecial;// 团队擅长
//String teamSection;// 医院科室
//String teamImage;// 团队图片Url, 多个以 | 分隔
//String teamTime;// 团队成立时间
//String teamCase;// 成功案例
//Doctor doctor;// 团队队长信息


@end
