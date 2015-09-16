//
//  MoreViewController.m
//  Bull
//
//  Created by Grant on 15/3/19.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "MoreViewController.h"

#import "MessageCell.h"
//#import "AlertUtil.h"

#import "MyAccountController.h"
#import "ActivityProductController.h"
#import "SettingController.h"

#import "FirendAddController.h"
#import "SuggestionController.h"
#import "RelationController.h"
#import "CommIssueController.h"
#import "NotificationInfoController.h"
#import "RewardViewController.h"

#import "CheckVIewController.h"


@interface MoreViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UIView *productView;
@property (weak, nonatomic) IBOutlet UITableView *msg_tableView;

@property (strong, nonatomic) NSMutableArray *menuList;
@property (strong, nonatomic) NSMutableArray *dataList1;
@property (strong, nonatomic) NSMutableArray *dataList2;
@property (strong, nonatomic) NSMutableArray *dataList3;

@end

@implementation MoreViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=NO;
    
//    self.navigationItem.title=NSLocalizedString(@"menu_4", nil);
    self.navigationItem.title=@"个人中心";
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBarController.tabBar.hidden=NO;

    [self setTitleBackItemNil];
    
    [self setup];
    [self loadData];
    
//    [self initProudctView];
    
    
    [_msg_tableView reloadData];
    
}

#define productViewHeight  150

- (void)initProudctView{
    
    NSInteger productHeight=self.productView.frame.size.height;
    EScrollerView *scroller=[[EScrollerView alloc]
                             initWithFrameRect:CGRectMake(0, 0, ScreenWidth, productHeight)
                             ImageArray:[NSArray arrayWithObjects:@"image1@2x.jpg",@"image2@2x.jpg",@"image3@2x.jpg", nil]
                             TitleArray:[NSArray arrayWithObjects:@"1",@"2",@"3", nil]];
    scroller.delegate=self;
    [self.productView addSubview:scroller];
    
    
}


- (void)setup
{
    //将下面的不现实的cell横线去掉
    _msg_tableView.tableFooterView = [[UIView alloc] init];
    _menuList  = [[NSMutableArray alloc] init];
    
}


- (void)loadData{
  
    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
    _menuList=[plistDic objectForKey:@"MORETIHUAN"];
    
//    FuncationModel *model=[[FuncationModel alloc]init];
//    model.funName=[dic objectForKey:@"funName"];
//    model.funImg=[dic objectForKey:@"funImg"];
//    model.funTag=[dic objectForKey:@"funTag"];
    
}



#pragma mark- ScrollviewDelegate
-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    NSLog(@"index--%lu",(unsigned long)index);
}


#pragma mark- UITableView dataSource and delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (!_menuList) {
        return 0;
    }else{
        return [_menuList count];
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if ([_menuList count]>section) {
        return [[_menuList objectAtIndex:section] count];
    }else{
        return 0;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return MoreHight;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
    
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    UIView *views=[[UIView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 20)];
//    views.backgroundColor=[UIColor clearColor];
//    
//    return views;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"MessageCell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MessageCell" owner:self options:nil];
        cell = [array objectAtIndex:0];
    }
    
    NSString *stringImg=[NSString string];
    NSString *labelTxt= [[[_menuList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"funName"];
   
    cell.titles.text = labelTxt;
    stringImg=[[[_menuList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"funImg"];;
    cell.moreBtn.tag=[[[[_menuList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"funTag"] integerValue];
    
    cell.tag=[[[[_menuList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"funTag"] integerValue];
    
    
    cell.imgs.image=[UIImage imageNamed:stringImg];

    //    cell.imgs.frame=CGRectMake(1, 6, 35, 31);
    //    cell.titles.frame=CGRectMake(44, 11, 300, 21);
    
    if ([@"当前版本" isEqual:labelTxt]) {
        
        cell.versions.text=[UnitPath versionShortSystem];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.moreBtn.enabled=YES;
        
    }
    
    return cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.msg_tableView deselectRowAtIndexPath:[self.msg_tableView indexPathForSelectedRow] animated:YES];
    UITableViewCell *cell=[self.msg_tableView cellForRowAtIndexPath:indexPath];
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"ContactUs" bundle:nil];
    
    switch ([cell tag]) {
        case 4000:
        {
            
        }
            break;
        case 4001: //账户信息
        {
            
            
        }
            break;
        case 4002:
        {
            
            RewardViewController*friendControl = [[RewardViewController alloc]init];
            
            [self.navigationController pushViewController:friendControl animated:YES];
            
            
            
        }
            break;
        case 4003:
        {
            NotificationInfoController*friendControl = [[NotificationInfoController alloc]init];
            
            [self.navigationController pushViewController:friendControl animated:YES];
            
            
        }
            
            break;
        case 4004:  //常见问题
        {
            
//            CommIssueController *issue = [mainStoryboard instantiateViewControllerWithIdentifier:@"CommIssueController"];
//            
//            [self.navigationController pushViewController:issue animated:YES];
            
            
            UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
            
            CheckVIewController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"CheckVIewController"];
            
            [self.navigationController pushViewController:doctor animated:YES];

            
            
        }
            break;
            
        case 4005:
        {
            
        }
            break;
            
        case 4006: //联系我们
        {
            
            RelationController *relationShip = [mainStoryboard instantiateViewControllerWithIdentifier:@"RelationController"];
            [self.navigationController pushViewController:relationShip animated:YES];
            
            
        }
            break;
            
        case 4007:  //
        {
            
            SuggestionController *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"SuggestionController"];
            
            [self.navigationController pushViewController:friendControl animated:YES];
            
        }
            break;
            
        case 4008:  //评价
        {
            
            DLog(@"跳转到APPStore");
            NSString *appID = @"548560575";
            // 用developer账户登陆itunes connect创建应用时会产生一个app id
            NSString *appURL = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",appID];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURL]];
            
        }
            break;
            
        case 4009:
        {
            
            
            DLog(@"当前版本");
            
        }
            break;
            
        case 4110:
        {
            
            
            
        }
            break;
            
        case 5000:
        {
            
            UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
            
            CheckVIewController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"CheckVIewController"];
            
            [self.navigationController pushViewController:doctor animated:YES];
            
            
        }
            break;
  
            
        case 5001:
        {
            
            
            UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];

            PersionInfoController *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"PersionInfoController"];
            
            [self.navigationController pushViewController:friendControl animated:YES];

            
        }
            break;
        case 5002:
        {
            
            UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
            
            MedicalViewController *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"MedicalViewController"];
            
            [self.navigationController pushViewController:friendControl animated:YES];

            
        }
            break;

            
        case 5003:
        {
            
            UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
            
            ChangePasswordController *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"ChangePasswordController"];
            
            [self.navigationController pushViewController:friendControl animated:YES];

        }
            break;


        case 5004:  //我的预约
        {
            
            UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
            
            AppointlistController *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"AppointlistController"];
            
            [self.navigationController pushViewController:friendControl animated:YES];
            
        }
            break;
            
            
        case 5006:  //
        {
            
//            [AlertUtil alertSuerAndCancelWithDelegate:@"是否确认退出当前账号？" delegate:self withTag:2000];
            
            [self isLoginOut];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginOut" object:nil];

            
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


#pragma mark-  检查更新
- (void)initRequest{
    
    NSString *device=[NSString stringWithFormat:@"IOS"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    [self showWaitLoading];
    
    NSDictionary *dict = @{ @"device":device};
    
    [manager POST:versionFresh1 parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * isOk=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"]];
        
        
        //参数: device(设备类型android或者ios)
        //返回结果： id(id)、appInfo(app描述)、appVersion(app版本号)、appType(app类型ios\android)、
        //appIsUpdate(是否强制更新、1强制；0不强制)、appDownloadUrl(app下载地址)、appBuild(app小版本号)
        
        if ([@"2001" isEqual:isOk]) {
            
            NSDictionary *dic=[responseObject objectForKey:@"result"];
            
            NSString *string1 = [NSString stringWithFormat:@"%@",[dic objectForKey:@"appInfo"]];
            NSString *string2 = [NSString stringWithFormat:@"%@",[dic objectForKey:@"appVersion"]];
            NSString *string3 = [NSString stringWithFormat:@"%@",[dic objectForKey:@"appType"]];
            NSString *string4 = [NSString stringWithFormat:@"%@",[dic objectForKey:@"appIsUpdate"]];
            NSString *string5 = [NSString stringWithFormat:@"%@",[dic objectForKey:@"appDownloadUrl"]];
            NSString *string6 = [NSString stringWithFormat:@"%@",[dic objectForKey:@"appBuild"]];
            
            //
            DLog(@"=%@=%@=%@=%@=%@=%@",string1,string2,string3,string4 ,string5,string6);
            
        }else{
        }
        //版本信息的获取 appstore
        [self checkVersion:YES];
        
        [self hideWaitLoading];

    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
       
        DLog(@"error＝%@", error);
        [self hideWaitLoading];

    }];
    
    
}



//检测软件是否需要升级
-(void)checkVersion:(BOOL)isCheck
{
    NSString *newVersion;
    NSURL *url = [NSURL URLWithString:@"http://itunes.apple.com/cn/lookup?id=622520086"];
    //通过url获取数据
    NSString *jsonResponseString =   [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"通过appStore获取的数据是：%@",jsonResponseString);
    
    //解析json数据为数据字典
    NSDictionary *loginAuthenticationResponse = [self dictionaryFromJsonFormatOriginalData:jsonResponseString];
    
    //从数据字典中检出版本号数据
    NSArray *configData = [loginAuthenticationResponse valueForKey:@"results"];
    for(id config in configData)
    {
        newVersion = [config valueForKey:@"version"];
    }
    
    //    NSLog(@"通过appStore获取的版本号是：%@",newVersion);
    
    //获取本地软件的版本号
    NSString *localVersion = [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleVersion"];
    
    NSString *msg = [NSString stringWithFormat:@"你当前的版本是V%@，发现新版本V%@，是否下载新版本？",localVersion,newVersion];
    
    //对比发现的新版本和本地的版本
    if ([newVersion floatValue] > [localVersion floatValue])
    {
        if (isCheck) {
            UIAlertView *createUserResponseAlert = [[UIAlertView alloc] initWithTitle:@"升级提示!" message:msg delegate:self cancelButtonTitle:@"现在升级" otherButtonTitles:nil , nil];
            [createUserResponseAlert show];
            
        }else{
            UIAlertView *createUserResponseAlert = [[UIAlertView alloc] initWithTitle:@"升级提示!" message:msg delegate:self cancelButtonTitle:@"下次再说" otherButtonTitles:@"现在升级" , nil];
            [createUserResponseAlert show];
            
        }
    }
}

#pragma mark - 辅助方法：将json 格式的原始数据转解析成数据字典
//将json 格式的原始数据转解析成数据字典
-(NSMutableDictionary *)dictionaryFromJsonFormatOriginalData:(NSString *)str
{
    SBJsonParser *sbJsonParser = [[SBJsonParser alloc]init];
    NSError *error = nil;
    //添加autorelease 解决 内存泄漏问题
    NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc]initWithDictionary:[sbJsonParser objectWithString:str error:&error]];
    return tempDictionary;
}


@end
