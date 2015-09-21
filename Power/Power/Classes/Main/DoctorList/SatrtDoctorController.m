//
//  SatrtDoctorController.m
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "SatrtDoctorController.h"
#import "SartTeamInfoController.h"
#import "DoctorSingleInfoController.h"
#import "PointApplyInfoCommitController.h"

#import "DOPDropDownMenu.h"

@interface SatrtDoctorController ()<DOPDropDownMenuDataSource, DOPDropDownMenuDelegate>
{
    UIPickerView *pickerView;
}
@property(nonatomic,strong)    UIPickerView *pickerView;

@property (nonatomic, copy) NSMutableArray *citys;
@property (nonatomic, copy) NSMutableArray *ages;
@property (nonatomic, copy) NSMutableArray *genders;
@property (nonatomic, copy) NSMutableArray *originalArray;
@property (nonatomic, copy) NSMutableArray *results;

@property (nonatomic, strong) DOPDropDownMenu *menu;

@end

@implementation SatrtDoctorController

@synthesize v_tableView;
@synthesize tableArray;

- (void)withManger:(DoctorModel *)doctor_{
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self setTitleBackItemImageAndTitle];
//    self.navigationController.navigationBarHidden=YES;
    self.tabBarController.tabBar.hidden=NO;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableArray=[NSMutableArray array];

    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
    tableArray=[plistDic objectForKey:@"DOCTOR_LIST"];
    
    self.citys   = [plistDic objectForKey:@"DOCTOR_LEVEL"];
    self.ages    = [plistDic objectForKey:@"DOCTOR_DKS"];
    self.genders = [plistDic objectForKey:@"DOCTOR_HOS"];
    
    
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:40];
    menu.dataSource = self;
    menu.delegate = self;
    [self.view addSubview:menu];
    self.menu = menu;
    
    
    //
//    [self initRequest];

}

- (void)dismiss:(UIBarButtonItem *)sender {
    [self.menu dismiss];
}

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu {
    return 3;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column {
    
    if (column==0) {
        return self.citys.count;
    }
    if (column==1) {
        return self.ages.count;
    }
    if (column==2) {
        return self.genders.count;
    }
    else{
        return 0;
    }

}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath {
    switch (indexPath.column) {
        case 0: return self.citys[indexPath.row];
            break;
        case 1: return self.ages[indexPath.row];
            break;
        case 2: return self.genders[indexPath.row];
            break;
        default:
            return nil;
            break;
    }
}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath {

    switch (indexPath.column) {
        case 0:{

        }
            break;
        case 1:{
         
        }
            break;
        case 2:{

        }
            
        default:
            break;
    }
    
    [self.v_tableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
    ImagePhoto.image=[UIImage imageNamed:[dic objectForKey:@"photoimage"]];


    UILabel *label=[[UILabel alloc]init];
    [cell addSubview:label];
    
    label.frame=CGRectMake(110, 18, 200, 30);
    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentLeft;
    label.text=@"徐建平";
    label.text=[dic objectForKey:@"name"];
    
    
    
    UILabel *label1=[[UILabel alloc]init];
    [cell addSubview:label1];
    label1.frame=CGRectMake(110, CellHight/2-10, 200, 30);
    label1.font=[UIFont systemFontOfSize:11];
    label1.textAlignment=NSTextAlignmentLeft;
    label1.text=@"科室: 心血管科";
    label1.text=[NSString stringWithFormat:@"科室: %@", [dic objectForKey:@"department"]];

    UILabel *labeltime=[[UILabel alloc]init];
    [cell addSubview:labeltime];
    labeltime.frame=CGRectMake(210, CellHight/2-10, 100, 30);
    labeltime.font=[UIFont systemFontOfSize:11];
    labeltime.textAlignment=NSTextAlignmentLeft;
    labeltime.text=@"职位: 主任医生";
    labeltime.text=[NSString stringWithFormat:@"职位: %@",[dic objectForKey:@"position"]];

    UILabel *label2=[[UILabel alloc]init];
    [cell addSubview:label2];
    label2.frame=CGRectMake(110,  CellHight/2-15+30 , 200, 30);
    label2.font=[UIFont systemFontOfSize:12];
    label2.textAlignment=NSTextAlignmentLeft;
    label2.text=@"心血管科国内前三甲";
    label2.textColor=[UIColor redColor];
    label2.text=[dic objectForKey:@"specialty"];
    
    
    UIButton *pointBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [cell addSubview:pointBtn];
    pointBtn.frame=CGRectMake(ScreenWidth-80, 15, 60, 26);
    [pointBtn setBackgroundImage:[UIImage imageNamed:@"12_03.png"] forState:UIControlStateNormal];
    
    [pointBtn setTitle:@"关注" forState:UIControlStateNormal];
    [pointBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    pointBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    
    
    [pointBtn addTarget:self action:@selector(pointDoctor:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    return cell;
}


- (IBAction)pointDoctor:(id)sender{
    
    NSLog(@"关注按钮");
    
    AlertUtils *alert = [AlertUtils sharedInstance];
    [alert showWithText:@"已关注" inView:self.view lastTime:1.0];

    
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



#pragma mark- 医生列表
- (void)initRequest{
    
    NSDictionary *dict = @{ @"doctorTitle": @"",
                            @"doctorSection": @"",
                            @"doctorHospital": @"",
                            @"pageIndex": @"0",
                            @"pageSize": @"10",
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
