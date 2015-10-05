//
//  ReservationVC.m
//  Power
//
//  Created by mac on 15/10/1.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//  我的预约

#import "ReservationVC.h"
#import "MedicalInfoController.h"
#import "PointApplyInfoCommitController.h"



@interface ReservationVC ()
{
    NSInteger index_;
    NSInteger pagesize_;
    
    NSInteger numberindex;

}

@end


@implementation ReservationVC

@synthesize v_tableView;
@synthesize tableArray;
@synthesize titleString;


- (void)withMangerInfo:(NSString*)title{
    
    titleString= title;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    self.title= @"我的预约";
    numberindex = 0;
    
//    self.title= titleString;
//    [self setAddNavigationBar];

    v_tableView.tableFooterView = [[UIView alloc]init];
    self.tableArray=[NSMutableArray array];
    
    index_ = 1;
    pagesize_ = 10;
    
    
    if ([Users isLoginSystem]){
        [self initRequest];
        
    }else{
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请先登录" inView:self.view lastTime:1.0];
        //                [AlertUtil alertSuerAndCancelWithDelegate:@"请先登录" delegate:self];
        
    }
    
}


- (void)addObjectImage{
    DLog(@"添加影像");
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
    PointApplyInfoCommitController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"PointApplyInfoCommitController"];
    
    [doctor withMangerInfo:@"添加影像"];
    [self.navigationController pushViewController:doctor animated:YES];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#define lableXdistance  20

#pragma mark- UITableView dataSource and delegate methods

//#define CellHight  310
#define CellHight  110

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//        return 4;
    
    return [self.tableArray count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHight;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    NSArray *namearry = [NSArray arrayWithObjects:@"鲁东",@"张正峰", nil];
    NSArray *namearrys = [NSArray arrayWithObjects:@"内科",@"肿瘤科", nil];

    UIImageView *ImagePhoto=[[UIImageView alloc]init];
    [cell addSubview:ImagePhoto];
    ImagePhoto.frame=CGRectMake(10, 20, 70, 70);
    ImagePhoto.image=[UIImage imageNamed:@"default_ys.gif"];
    
    UILabel *label=[[UILabel alloc]init];
    [cell addSubview:label];
    label.frame=CGRectMake(110, 18, 200, 30);
    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentLeft;
    label.text=@"预约的医生";
    
    UILabel *label1=[[UILabel alloc]init];
    [cell addSubview:label1];
    label1.frame=CGRectMake(110, CellHight/2-10, 200, 30);
    label1.font=[UIFont systemFontOfSize:12];
    label1.textAlignment=NSTextAlignmentLeft;
    label1.text=@"预约的医院";
    
    UILabel *labeltime=[[UILabel alloc]init];
    [cell addSubview:labeltime];
    labeltime.frame=CGRectMake(ScreenWidth-80, CellHight/2-10, 80, 50);
    labeltime.font=[UIFont systemFontOfSize:12];
    labeltime.textAlignment=NSTextAlignmentLeft;
    labeltime.text=@"2015-09-10";
    
    UILabel *label2=[[UILabel alloc]init];
    [cell addSubview:label2];
    label2.frame=CGRectMake(110,  CellHight/2-15+30 , 200, 30);
    label2.font=[UIFont systemFontOfSize:12];
    label2.textAlignment=NSTextAlignmentLeft;
    label2.text=@"预约的科室";
    label2.textColor=[UIColor redColor];
    
    
    UIButton *btns=[UIButton buttonWithType:UIButtonTypeCustom];
    [cell addSubview:btns];
    btns.frame=CGRectMake(ScreenWidth-80,  18 , 70, 25);
    btns.titleLabel.font=[UIFont systemFontOfSize:12];
    [btns setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btns setBackgroundImage:[UIImage imageNamed:@"12_03.png"] forState:UIControlStateNormal];
    
    [btns setTitle:@"取消预约" forState:UIControlStateNormal];
    [btns addTarget:self action:@selector(action2:) forControlEvents:UIControlEventTouchUpInside];
    btns.titleLabel.font=[UIFont systemFontOfSize:12];
    btns.tag = indexPath.row;

    if (self.tableArray) {
        
        NSDictionary *dic =[self.tableArray objectAtIndex:indexPath.row];
        
//        label.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"createUser"]];
        
        label.text = [namearry objectAtIndex:indexPath.row];
        
        label1.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"diseaseInfo"]];
        
        NSString *times=[NSString stringWithFormat:@"预约时间:\n%@",[UnitPath ymdString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"appointmentTime"]]]];
        labeltime.text=  times;
        labeltime.numberOfLines = 2;

//        label2.text=[NSString stringWithFormat:@"%@",[dic objectForKey:@"order"]];
        
        label2.text= [namearrys objectAtIndex:indexPath.row];
        
        
//        NSString *stringUrl=[dic objectForKey:@"doctorImage"];
//        stringUrl = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)stringUrl, nil, nil, kCFStringEncodingUTF8));
//        NSURL *url =[NSURL URLWithString:stringUrl];
//        [ImagePhoto sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"product_DetailInfo"]];
        
    }

    
    
    return cell;
}



//
//appointmentTime = "2015-09-21 15:58:01.323";
//createIp = "<null>";
//createTime = "2015-09-21 15:57:41.339";
//createUser = "<null>";
//createUserName = "<null>";
//diseaseImage = sdfsf;
//diseaseInfo = sdfsf;
//id = 2;
//isDelete = 0;
//order = "<null>";
//page = "<null>";
//rows = "<null>";
//section = "<null>";
//sort = "<null>";
//tid = 1;
//type = 1;
//uid = 1;
//updateIp = "<null>";
//updateTime = "<null>";
//updateUser = "<null>";
//updateUserName = "<null>";
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
//    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
//    
//    MedicalInfoController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"MedicalInfoController"];
//    
//    [self.navigationController pushViewController:doctor animated:YES];
    
    
    
}


- (IBAction)action2:(id)sender{
    
    numberindex = [sender tag];
    
    [AlertUtil alertSuerAndCancelWithDelegate:@"取消预约" delegate:self];

    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0) {
        
    }else{
        
        [self removetableArray];
    }
    
}

- (void)removetableArray{
    
    if (self.tableArray.count >numberindex ) {
        [self.tableArray removeObjectAtIndex:numberindex];
    }
    
    [self.v_tableView reloadData];
}


#pragma mark-
- (void)initRequest{
    
    
    //pageIndex	false	String	分页页码   接口11
    //pageSize	false	String	每页大小
    //token	ture	String	签名标识
    //id	ture	String	用户id
    
    NSString * indexs = [NSString stringWithFormat:@"%ld",(long)index_];
    NSString * pagesizes = [NSString stringWithFormat:@"%ld",(long)pagesize_];
    
    NSDictionary *dict = @{ @"pageIndex": indexs,
                            @"pageSize" : pagesizes,
                            @"token": @" ",
                            @"id"   : [Users userId]
                            };
    
    DLog(@"影像dict==%@",dict);
    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    [manager POST:appointListUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 成功
            
            NSMutableArray * result=[responseObject objectForKey:@"result"];
            NSString *string= [NSString stringWithFormat:@"%@",result];
            
            if (result && ![@"<null>" isEqualToString:string]) {
                tableArray = [NSMutableArray arrayWithArray:result];
                
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
