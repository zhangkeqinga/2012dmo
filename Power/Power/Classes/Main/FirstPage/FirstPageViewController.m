//
//  FirstPageViewController.m
//  Power
//
//  Created by mac on 15/9/12.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import "FirstPageViewController.h"

#import "DoctorListController.h"






#define scrollivewHight  ScreenWidth/2
#define productViewHeight  200.0  广告

#define kRGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#define addHight  20
#define cellHight  ScreenWidth/3

@interface FirstPageViewController ()

@property (strong, nonatomic) EScrollerView  *scroller;
@property (strong, nonatomic) NSMutableArray *adsArray;
@property (strong, nonatomic) NSMutableArray *funcArray;


@end

@implementation FirstPageViewController

@synthesize adsArray;
@synthesize scroller;
@synthesize productView;
@synthesize v_tableView;
@synthesize funcArray;
@synthesize dics;


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitleBackItemNil];

    self.tabBarController.tabBar.hidden=NO;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    dics = [[NSMutableDictionary alloc]init];
    
    self.adsArray =[[NSMutableArray alloc]init];
    self.funcArray=[[NSMutableArray alloc]init];
    
    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
    self.funcArray = [plistDic objectForKey:@"FUNCFIRST"];
    [self initView];

    [self initRequest];
    

//    v_tableView.userInteractionEnabled = NO;
    
}




- (void)initView{
    
    [self initProudctView];
    [self.view addSubview:self.productView];
    
    for (int k =0; k<2; k++) {
        
    UIImageView *lineImageh=[[UIImageView alloc]init];
    lineImageh.frame=CGRectMake(ScreenWidth/2, 140+cellHight*(k), 1, cellHight);
    lineImageh.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:lineImageh];
    
        
    for (NSInteger i=0; i<2; i++) {
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        UILabel *label=[[UILabel alloc]init];
        UIImageView *typeImage=[[UIImageView alloc]init];
        [self.view addSubview:label];
        [self.view addSubview:typeImage];
        [self.view addSubview:button];
        
        button.frame=CGRectMake(ScreenWidth/2*i , 140+cellHight*(k), ScreenWidth/2, cellHight);
        [button addTarget:self action:@selector(selectFuncation:) forControlEvents:UIControlEventTouchUpInside];

        
        [typeImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).with.offset(140+cellHight*(k));
            make.centerX.equalTo(button);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(80);
            
        }];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).with.offset(140+cellHight*(k)+75);
            make.centerX.equalTo(button);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30);
            
        }];
        
        
        label.font=[UIFont systemFontOfSize:14];
        label.textAlignment=NSTextAlignmentCenter;
        
        if ([self.funcArray count] > k*2+i) {
            
            UIImageView *lineImagev1=[[UIImageView alloc]init];
            lineImagev1.backgroundColor=[UIColor lightGrayColor];
            [self.view addSubview:lineImagev1];
            
            lineImagev1.frame=CGRectMake(i*ScreenWidth/2, 140+cellHight*(k+1)-1, ScreenWidth/2, 1);
            
            NSDictionary *dic = [self.funcArray objectAtIndex:k*2+i];
            NSString *stringName=[dic objectForKey:@"name"];
            NSString *imageName=[dic objectForKey:@"image"];
            NSString *tag=[dic objectForKey:@"tag"];
            
            typeImage.image=[UIImage imageNamed:imageName];
            label.text=stringName;
            button.tag=[tag integerValue];
            
        }
        
        
        
    }
    }

    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initProudctView {
    
    if (scroller) {
        [scroller removeFromSuperview];
        scroller=nil;
        
    }
    
    if (self.productView) {
        [self.productView removeFromSuperview];
        self.productView=nil;
        
    }
    
    self.productView =[[UIView alloc]init];
    if (ScreenHeight<=480) {
        self.productView.frame=CGRectMake(0, 0, ScreenWidth, 140);
    }else{
        
        self.productView.frame=CGRectMake(0, 0, ScreenWidth, 140);
    }
    
    [self.view addSubview:self.productView];
    
    
    if (self.adsArray && [self.adsArray count]>0) {
        
        NSInteger productHeight=self.productView.frame.size.height;
        
        scroller=[[EScrollerView alloc]
                  initWithFrameRect:CGRectMake(0, 0, ScreenWidth, productHeight)
                  ImageArray:self.adsArray
                  TitleArray:nil];
        
        scroller.delegate=self;
        [self.productView addSubview:scroller];
        
        
    }else{
        
        NSInteger productHeight=self.productView.frame.size.height;
        scroller=[[EScrollerView alloc]
                  initWithFrameRect:CGRectMake(0, 0, ScreenWidth, productHeight)
                  ImageArray:[NSArray arrayWithObjects:@"3专业影像医生.jpg",@"1先进的医疗技术.jpg",@"2丰富的诊疗经验.jpg", @"4崇高的职业道德.jpg",nil]
                  TitleArray:nil];
        
        
        scroller.delegate=self;
        [self.productView addSubview:scroller];
        
    }
    
}


#pragma mark- ScrollviewDelegate
-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    NSLog(@"index--%lu",(unsigned long)index);
}

#pragma mark- UITableView dataSource and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.funcArray.count/3+2;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0){
        return 140;
        
    }else{
        return cellHight;
    }
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if (indexPath.row==0) {
        
        [self initProudctView];
        [cell addSubview:self.productView];
        
    }
    else {
        
        UIImageView *lineImageh=[[UIImageView alloc]init];
        lineImageh.frame=CGRectMake(ScreenWidth/2, 0, 1, cellHight);
        lineImageh.backgroundColor=[UIColor lightGrayColor];
        [cell addSubview:lineImageh];

        for (NSInteger i=0; i<2; i++) {
            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
            UILabel *label=[[UILabel alloc]init];
            UIImageView *typeImage=[[UIImageView alloc]init];
            [cell addSubview:label];
            [cell addSubview:typeImage];
            [cell addSubview:button];

            button.frame=CGRectMake(ScreenWidth/2*i , 0, ScreenWidth/2, cellHight);

            [typeImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell).with.offset(0);
                make.centerX.equalTo(button);
                make.width.mas_equalTo(80);
                make.height.mas_equalTo(80);
                
            }];
            
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(cell).with.offset(75);
                make.centerX.equalTo(button);
                make.width.mas_equalTo(100);
                make.height.mas_equalTo(30);
                
            }];
            
            
            label.font=[UIFont systemFontOfSize:14];
            label.textAlignment=NSTextAlignmentCenter;
            [button addTarget:self action:@selector(selectFuncation:) forControlEvents:UIControlEventTouchUpInside];
            
            if ([self.funcArray count] > (indexPath.row-1)*2+i) {
                
                UIImageView *lineImagev1=[[UIImageView alloc]init];
                lineImagev1.backgroundColor=[UIColor lightGrayColor];
                [cell addSubview:lineImagev1];
                lineImagev1.frame=CGRectMake(i*ScreenWidth/2, cellHight-1, ScreenWidth/2, 1);
                
                NSDictionary *dic = [self.funcArray objectAtIndex:(indexPath.row-1)*2+i];
                NSString *stringName=[dic objectForKey:@"name"];
                NSString *imageName=[dic objectForKey:@"image"];
                NSString *tag=[dic objectForKey:@"tag"];

                typeImage.image=[UIImage imageNamed:imageName];
                label.text=stringName;
                button.tag=[tag integerValue];

            }
            
            
            
        }
        
        
        
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
    
}


- (IBAction)selectFuncation:(id)sender{
    DLog(@"sender==%ld",(long)[sender tag]);
    
    switch ([sender tag]) {
            
            
        case 1100:  //我的消息 －－ 我的影像
        {
//            UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
//            
//            PerNotificationVC *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"PerNotificationVC"];
//
//            [self.navigationController pushViewController:friendControl animated:YES];
  
            
            UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
            CheckVIewController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"CheckVIewController"];
            [self.navigationController pushViewController:doctor animated:YES];

            
            
        }
            break;
        case 1101:  //我的预约
        {
            
            UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
            
            MedicalViewController *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"MedicalViewController"];
            [friendControl withMangerInfo:@"我的预约"];
            [self.navigationController pushViewController:friendControl animated:YES];
            
        }
            break;

        case 1102://我的关注
        {
            
            
            UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
            
            AppointlistController *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"AppointlistController"];
            
            [self.navigationController pushViewController:friendControl animated:YES];

        }
            break;
        case 1103:  //我的积分
        {
            
            UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
            
            RewardPointVC *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"RewardPointVC"];
            
            [self.navigationController pushViewController:friendControl animated:YES];
            
        }
            break;
        default:
            break;
    }

    
}




#pragma mark- 广告
- (void)initRequest{
    
    NSDictionary *dict = @{ @"pageIndex": @"1",
                            @"pageSize": @"10"
                            
                            };
    
    
    DLog(@"广告dict==%@",dict);
    
    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager POST:adslistUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 成功
            NSMutableArray * result=[responseObject objectForKey:@"result"];
            if (result) {
                for (int i =0 ;i<[result count];i++){
                    NSDictionary *dic=[result objectAtIndex:i];
                    [self.adsArray addObject:[dic objectForKey:@"imageUrl"]];
                }
                
                [self initProudctView];
                
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


//{
//    createIp = "<null>";
//    createTime = "2015-07-25 16:42:12.000";
//    createUser = "<null>";
//    createUserName = "<null>";
//    endDate = "2015-07-31";
//    id = 1;
//    imageLable = "\U54e5\U4fe9\U597d";
//    imageUrl = "http://www.diagnose.com/image/app/banner/image1@2x.jpg";
//    isDelete = 0;
//    isUse = 1;
//    linkUrl = "http://www.diagnose.com";
//    order = 1;
//    page = "<null>";
//    rows = "<null>";
//    sort = "<null>";
//    startDate = "2015-07-25";
//    updateIp = "<null>";
//    updateTime = "<null>";
//    updateUser = "<null>";
//    updateUserName = "<null>";
//},

@end
