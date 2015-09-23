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
    self.title= @"我的影像";
    self.title= titleString;
    
    v_tableView.tableFooterView = [[UIView alloc]init];
    
    [self setAddNavigationBar];
    
    tableArray=[NSMutableArray array];
    
    [self initRequest];
    
    
}


- (void)addObjectImage{
    DLog(@"添加影像");
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
    PointApplyInfoCommitController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"PointApplyInfoCommitController"];
    [self.navigationController pushViewController:doctor animated:YES];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



#pragma mark- UITableView dataSource and delegate methods

#define CellHight  310

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
    ImagePhoto.image=[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    
    ImagePhoto.frame=CGRectMake(10, 20, ScreenWidth-20, 260);
    
    
    UILabel *label=[[UILabel alloc]init];
    [cell addSubview:label];
    
    label.frame=CGRectMake(lableXdistance, 280, 200, 30);
    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentLeft;
    label.textColor=[UIColor orangeColor];
    
    label.text=@"科室: 心血管科";
    
    UILabel *labelm=[[UILabel alloc]init];
    [cell addSubview:labelm];
    
    labelm.frame=CGRectMake(lableXdistance+170, 280, 200, 30);
    labelm.font=[UIFont systemFontOfSize:16];
    labelm.textAlignment=NSTextAlignmentLeft;
    labelm.textColor=[UIColor orangeColor];
    
    labelm.text=@"T官造影";

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
    
    MedicalInfoController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"MedicalInfoController"];
    
    [self.navigationController pushViewController:doctor animated:YES];
    
    
    
}





#pragma mark-
- (void)initRequest{
    
    NSDictionary *dict = @{ @"userPhone": [Users phoneNumber],
                            @"token":@" "
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



@end
