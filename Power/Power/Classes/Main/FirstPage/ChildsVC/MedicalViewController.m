//
//  MedicalViewController.m
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "MedicalViewController.h"
#import "MedicalInfoController.h"
#import "PointApplyInfoCommitController.h"


@interface MedicalViewController ()
{
    NSInteger index_;
    NSInteger pagesize_;
}
@end

@implementation MedicalViewController

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
    self.title= titleString;
    
    v_tableView.tableFooterView = [[UIView alloc]init];
    
//    [self setAddNavigationBar];
    
    tableArray=[NSMutableArray array];
    
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



#pragma mark- UITableView dataSource and delegate methods

//#define CellHight  310
#define CellHight  110

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 4;

    return [self.tableArray count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHight;
}

#define lableXdistance  20

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    NSArray *imageArray=[NSArray arrayWithObjects:
                         @"正常食管黏膜像(侧位).png",
                         @"膀胱癌.jpg",
                         @"正常食管黏膜像(侧位).png",
                         @"膀胱癌.jpg",
                         nil];
    
    
    UIImageView *ImagePhoto=[[UIImageView alloc]init];
    [cell addSubview:ImagePhoto];
    ImagePhoto.frame=CGRectMake(10, 20, 70, 70);
    ImagePhoto.image=[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    
    
    UILabel *label=[[UILabel alloc]init];
    [cell addSubview:label];
    
    label.frame=CGRectMake(110, 18, 200, 30);
    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentLeft;
    label.text=@"姓名";
    
    UILabel *label1=[[UILabel alloc]init];
    [cell addSubview:label1];
    label1.frame=CGRectMake(110, CellHight/2-10, 200, 30);
    label1.font=[UIFont systemFontOfSize:11];
    label1.textAlignment=NSTextAlignmentLeft;
    label1.text=@"年龄";
    
    UILabel *label11=[[UILabel alloc]init];
    [cell addSubview:label1];
    label11.frame=CGRectMake(210, CellHight/2-10, 200, 30);
    label11.font=[UIFont systemFontOfSize:11];
    label11.textAlignment=NSTextAlignmentLeft;
    label11.text=@"科室";
    
    UILabel *labeltime=[[UILabel alloc]init];
    [cell addSubview:labeltime];
    labeltime.frame=CGRectMake(210, 10, 100, 30);
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
    
    
    
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
//    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
//    
//    MedicalInfoController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"MedicalInfoController"];
//    
//    [self.navigationController pushViewController:doctor animated:YES];
    
    
    
}





#pragma mark-
- (void)initRequest{
    
    //pageIndex	false	String	分页页码
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
    
    [manager POST:myImagesUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
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

//code = 315;
//createIp = "<null>";
//createTime = "<null>";
//createUser = "<null>";
//createUserName = "<null>";
//id = 29;
//isDelete = 0;
//name = "\U5fc3\U8840\U7ba1\U79d1";
//order = "<null>";
//page = "<null>";
//rows = "<null>";
//sort = "<null>";
//type = 3;
//updateIp = "<null>";
//updateTime = "<null>";
//updateUser = "<null>";
//updateUserName = "<null>";
//url = "<null>";


@end
