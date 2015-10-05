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
    
    NSInteger pageIndex;
    NSInteger pageSize;
    
    NSString *string1;
    NSString *string2;
    NSString *string3;
    
    
}

@property(nonatomic,strong)    UIPickerView *pickerView;

@property (nonatomic, strong) NSMutableArray *citys;
@property (nonatomic, strong) NSMutableArray *ages;
@property (nonatomic, strong) NSMutableArray *genders;
@property (nonatomic, strong) NSMutableArray *originalArray;
@property (nonatomic, strong) NSMutableArray *results;

@property (nonatomic, strong) DOPDropDownMenu *menu;

@end

@implementation SatrtDoctorController

@synthesize v_tableView;
@synthesize tableArray;
@synthesize pickerView;


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
    
    pageIndex = 1;
    pageSize = 10;
    
    string1 =[NSString string];
    string2 =[NSString string];
    string3 =[NSString string];
    
    
    tableArray=[NSMutableArray array];
    
    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
//    tableArray=[plistDic objectForKey:@"DOCTOR_LIST"];
    
//    self.citys   = [plistDic objectForKey:@"DOCTOR_HOS"];
//    self.ages    = [plistDic objectForKey:@"DOCTOR_DKS"];
//    self.genders = [plistDic objectForKey:@"DOCTOR_LEVEL"];
    
    self.citys = [NSMutableArray array];
    self.ages  = [NSMutableArray array];
    self.genders = [NSMutableArray array];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    self.citys =[NSMutableArray arrayWithArray:[defaults rm_customObjectForKey:@"HOSPITAL"]];
    self.ages = [defaults rm_customObjectForKey:@"DEPARTMENT"];
    self.genders =[defaults rm_customObjectForKey:@"POSITION"];
    
    HospitalModel *model =[[HospitalModel alloc]init];
    model.hospitalName = [NSString stringWithFormat:@"医院"];
    
    DepartmentModel *model1 =[[DepartmentModel alloc]init];
    model1.name = [NSString stringWithFormat:@"科室"];
    
    PositionModel *model2 =[[PositionModel alloc]init];
    model2.name = [NSString stringWithFormat:@"职称"];
    
    
    [self.citys insertObject:model atIndex:0];
    [self.ages insertObject:model1 atIndex:0];
    [self.genders insertObject:model2 atIndex:0];
    
//    self.citys   = [Users historySelectKey:HISPOSITION];
//    self.ages    = [Users historySelectKey:HISTORYLEVEL];
//    self.genders = [Users historySelectKey:HISTORYNAME];
    
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:40];
    menu.dataSource = self;
    menu.delegate = self;
    [self.view addSubview:menu];
    self.menu = menu;
    
    //
    [self initRequest];
    
//    [self dispath_background_requestData];

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
        case 0:
        {
            
            HospitalModel *model = [self.citys objectAtIndex:indexPath.row];
            string1 = [NSString stringWithFormat:@"%@",model.hospitalName];
            return string1;
            
        }
            break;
        case 1:
        {
            DepartmentModel *model = [self.ages objectAtIndex:indexPath.row];
            string2 = [NSString stringWithFormat:@"%@",model.name];
            return string2;
            
            return @"asd";

        }
            break;
        case 2:
        {
            PositionModel *model = [self.genders objectAtIndex:indexPath.row];
            string3 = [NSString stringWithFormat:@"%@",model.name];
            return string3;
            
            return @"asd";


        }
            break;
            
        default:
            
            return nil;
            
            break;
    }
}



- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath {

    switch (indexPath.column) {
        case 0:{

            HospitalModel *model = [self.citys objectAtIndex:indexPath.row];
            string1 = [NSString stringWithFormat:@"%@",model.hospitalName];
            
//            string1 = [self.citys objectAtIndex:indexPath.row];
        }
            break;
        case 1:{
            
            DepartmentModel *model = [self.ages objectAtIndex:indexPath.row];
            string2 = [NSString stringWithFormat:@"%@",model.name];

//            string2 = [self.ages objectAtIndex:indexPath.row];
        }
            
            break;
        case 2:{
            
            PositionModel *model = [self.genders objectAtIndex:indexPath.row];
            string3 = [NSString stringWithFormat:@"%@",model.name];
            
//            string3 = [self.genders objectAtIndex:indexPath.row];
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
    
    NSDictionary *dict = @{ @"doctorTitle": @"",
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




- (void)dispath_background_requestData{
    
    //  后台执行：
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // something
        
//        [self requestData:@"1"];
//        [self requestData:@"2"];
//        [self requestData:@"3"];
        
    });
    
    
    
}



- (void)requestData:(NSString *)typeString {
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?type=1",doctorMdmUrl]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation1 = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation1 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
    NSURL *url2 = [NSURL URLWithString:[NSString stringWithFormat:@"%@?type=2",doctorMdmUrl]];
    
    NSURLRequest *request2 = [NSURLRequest requestWithURL:url2];
    
    AFHTTPRequestOperation *operation2 = [[AFHTTPRequestOperation alloc] initWithRequest:request2];
    
    [operation2 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Response2atart: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
    
    
    NSURL *url3 = [NSURL URLWithString:[NSString stringWithFormat:@"%@?type=3",doctorMdmUrl]];
    NSURLRequest *request3 = [NSURLRequest requestWithURL:url3];
    AFHTTPRequestOperation *operation3 = [[AFHTTPRequestOperation alloc] initWithRequest:request3];
    [operation3 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Response3: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];  
    
    
    //operation2 在 operation1 请求完成后执行
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operation2 addDependency:operation1];
    [operationQueue addOperations:@[operation1, operation2, operation3] waitUntilFinished:NO];
    
    
}



//doctorTitle = "\U526f\U4e3b\U4efb\U533b\U5e08";
//id = 5;
//isDelete = 0;
//order = "<null>";
//page = "<null>";
//rows = "<null>";
//sort = "<null>";
//teamId = "<null>";
//updateIp = "<null>";
//updateTime = "<null>";
//updateUser = "<null>";
//updateUserName = "<null>";
//attentionId = "<null>";
//createIp = "<null>";
//createTime = "2015-09-06 16:19:04.444";
//createUser = "<null>";
//createUserName = "<null>";
//doctorAge = 55;
//doctorCity = "\U5408\U80a5";
//doctorHospital = "\U5b89\U5fbd\U7701\U7acb\U533b\U9662";
//doctorImage = "http://www.jinbull.com/image/app/avatar/\U5415\U7ef4\U5bcc.jpg";
//doctorInfo = "


@end
