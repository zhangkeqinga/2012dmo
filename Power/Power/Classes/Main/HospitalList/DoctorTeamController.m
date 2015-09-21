//
//  DoctorTeamController.m
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "DoctorTeamController.h"
#import "DoctorListController.h"



@interface DoctorTeamController ()

@end

@implementation DoctorTeamController
@synthesize v_tableView;


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitleBackItemNil];
    //    self.navigationController.navigationBarHidden=YES;
    self.tabBarController.tabBar.hidden=NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];


    [self initRequest];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#define CellHight  150

#pragma mark- ScrollviewDelegate
-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    NSLog(@"index--%lu",(unsigned long)index);
}

#pragma mark- UITableView dataSource and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *arryTitile=[NSArray arrayWithObjects:
                      @"北京大学人民医院",
                      @"武汉大学人民医院",
                      @"合肥第一人民医院",
                      @"蚌埠第一附属医院",
                         
                      nil];

    
    NSArray *arryImg=[NSArray arrayWithObjects:
                      @"北京大学人民医院.png",
                      @"武汉人民医院.png",
                      @"合肥第一人民医院.png",
//                      @"安徽省立医院.png",
//                      @"太和县中医院.png",
                      @"蚌埠第一附属医院.png",
                       nil];
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    UIImageView *ImagePhoto=[[UIImageView alloc]init];
    [cell addSubview:ImagePhoto];
    ImagePhoto.image=[UIImage imageNamed:[arryImg objectAtIndex:indexPath.row]];
    
    
    
    UIImageView *ImageTitle=[[UIImageView alloc]init];
    [cell addSubview:ImageTitle];
    ImageTitle.backgroundColor=[UIColor blackColor];
    ImageTitle.alpha =0.7;


    UILabel *label1=[[UILabel alloc]init];
    label1.font=[UIFont systemFontOfSize:16];
    label1.textAlignment=NSTextAlignmentLeft;
    label1.textAlignment = NSTextAlignmentLeft;
    label1.textColor = [UIColor whiteColor];
    label1.text =[arryTitile objectAtIndex:indexPath.row];
    [cell addSubview:label1];

    
    if (indexPath.row==0) {
        ImagePhoto.frame=CGRectMake(0, 0, ScreenWidth, CellHight);
        
        ImageTitle.frame=CGRectMake(0, CellHight-30, ScreenWidth, 30);
        label1.frame=CGRectMake(30, CellHight-30, ScreenWidth-30, 30);

        
    }else{
        
        ImagePhoto.frame=CGRectMake(15, 15, ScreenWidth-30, CellHight-15);
        ImageTitle.frame=CGRectMake(15, CellHight-30, ScreenWidth-30, 30);
        label1.frame=CGRectMake(15+30, CellHight-30, ScreenWidth-30, 30);

        UILabel *label2=[[UILabel alloc]init];
        label2.font=[UIFont systemFontOfSize:12];
        label2.textAlignment=NSTextAlignmentLeft;

        UILabel *label3=[[UILabel alloc]init];
        label3.font=[UIFont systemFontOfSize:12];
        label3.textAlignment=NSTextAlignmentLeft;
        
        UILabel *label4=[[UILabel alloc]init];
        label4.font=[UIFont systemFontOfSize:12];
        label4.textAlignment=NSTextAlignmentLeft;
        label4.textColor=[UIColor orangeColor];
        
        [cell addSubview:label2];
        [cell addSubview:label3];
        [cell addSubview:label4];

        label2.numberOfLines=2;
        label3.numberOfLines=2;

        
//        label1.backgroundColor=[UIColor redColor];
//        label2.backgroundColor=[UIColor redColor];
//        label3.backgroundColor=[UIColor redColor];
        
        if ([self.tableArray count]>indexPath.row-1) {  // 真实数据
//            NSDictionary *dic=[self.tableArray objectAtIndex:indexPath.row-1];
//            label1.text =[dic objectForKey:@"hospitalName"];
//            label2.text =[dic objectForKey:@"hospitalAddress"];
//            label3.text=@"三甲医院";
//            label4.text=@"点击进入";

        }
        
//        if (indexPath.row%2==0) {
//            ImagePhoto.frame=CGRectMake(15, 15, ScreenWidth/2, 120-15);
//            
//            
//            label1.frame=CGRectMake(ScreenWidth/2+30,  15 ,  ScreenWidth/2-30, 30);
//            label2.frame=CGRectMake(ScreenWidth/2+30,  15+30 , ScreenWidth/2-30, 30);
//            label3.frame=CGRectMake(ScreenWidth/2+30,  15+60 , ScreenWidth/2-30, 30);
//            label4.frame=CGRectMake(ScreenWidth/2+15+ScreenWidth/4,  15+60 , ScreenWidth/4, 30);
//
//        }else{
//            ImagePhoto.frame=CGRectMake(ScreenWidth/2-15, 15, ScreenWidth/2, 120-15);
//            
//            label1.frame=CGRectMake(15,  15 ,  ScreenWidth/2-30, 30);
//            label2.frame=CGRectMake(15,  15+30 , ScreenWidth/2-30, 30);
//            label3.frame=CGRectMake(15,  15+60 , ScreenWidth/2-30, 30);
//            label4.frame=CGRectMake(ScreenWidth/4,  15+60 , ScreenWidth/4, 30);
//
//
//        }
        

    }
    
    
    
    
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
    
    DoctorListController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"DoctorListController"];
    DoctorModel *doctors=[[DoctorModel alloc]init];
    
//    doctors.typeTag=[NSString stringWithFormat:@"%d",[sender tag]-1000];
    
    [doctor withManger:doctors];
    
    [self.navigationController pushViewController:doctor animated:YES];
    
}


#pragma mark-
- (void)initRequest{
    
    NSDictionary *dict = @{ @"pageIndex": @"1",
                            @"pageSize": @"10"
                            };
    
    DLog(@"医院dict==%@",dict);
    
    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    [manager POST:hospitalListUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 成功
            
            NSMutableArray * result=[responseObject objectForKey:@"result"];
            self.tableArray = result;
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
