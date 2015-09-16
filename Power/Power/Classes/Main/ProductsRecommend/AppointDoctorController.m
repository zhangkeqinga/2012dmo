//
//  AppointDoctorController.m
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "AppointDoctorController.h"

#import "DoctorListController.h"

#define scrollivewHight  ScreenWidth/2
#define productViewHeight  150  广告

#define kRGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


@interface AppointDoctorController ()


@property (strong, nonatomic) EScrollerView  *scroller;
@property (strong, nonatomic) NSMutableArray *adsArray;

@end

@implementation AppointDoctorController

@synthesize adsArray;
@synthesize scroller;
@synthesize productView;
@synthesize v_tableView;


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=NO;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
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
        self.productView.frame=CGRectMake(0, 0, ScreenWidth, 150);//金牛解锁
    }else{
//        self.productView.frame=CGRectMake(0, 0, ScreenWidth, scrollivewHight);//金牛解锁
        
        self.productView.frame=CGRectMake(0, 0, ScreenWidth, 150);//金牛解锁

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
                  ImageArray:[NSArray arrayWithObjects:@"1先进的医疗技术.jpg",@"2丰富的诊疗经验.jpg",@"3专业影像医生.jpg", @"4崇高的职业道德.jpg",nil]
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
    return 4;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0){
        return 150;

    }else{
        return 100;
    }

}


#define addHight  20

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    NSArray *arraytitle=[NSArray arrayWithObjects:
                        @"心血管科",@"甲状腺科",@"眼科",
                        @"白内障科",@"神经外科",@"结直肠癌科",
                        @"肝胆外科",@"胰腺外科",@"生殖医学科",nil];
    
    NSArray *arrayImage=[NSArray arrayWithObjects:
                         @"IMG_01.png",@"IMG_02.png",@"IMG_03.png",
                         @"IMG_04.png",@"IMG_05.png",@"IMG_06.png",
                         @"IMG_07.png",@"IMG_08.png",@"IMG_09.png",nil];

   
    if (indexPath.row==0) {
        
        [self initProudctView];
        
        [cell addSubview:self.productView];
    
    }
    else {
      
        for (NSInteger i=0; i<3; i++) {
            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
            UILabel *label=[[UILabel alloc]init];
            [cell addSubview:button];
            [cell addSubview:label];
            
            if (i==0) {
                
                button.frame=CGRectMake(ScreenWidth/4-30-20, 0+addHight, 60, 65);
                label.frame=CGRectMake(ScreenWidth/4-50-20, 60+addHight, 100, 30);

            }
            if (i==1) {
                button.frame=CGRectMake(ScreenWidth/2-30, 0+addHight, 60, 65);
                label.frame=CGRectMake(ScreenWidth/2-50, 60+addHight, 100, 30);

            }
            if (i==2) {
                
                button.frame=CGRectMake(ScreenWidth/2+ScreenWidth/4-30+20, 0+addHight, 60, 65);
                label.frame=CGRectMake(ScreenWidth/2+ScreenWidth/4-50+20, 60+addHight, 100, 30);

            }

            label.font=[UIFont systemFontOfSize:14];
            label.textAlignment=NSTextAlignmentCenter;
            
            button.tag=1000+(indexPath.row-1)*3+i;
            
            if ([arrayImage count]>(indexPath.row-1)*3+i  ) {
                [button setBackgroundImage:[UIImage imageNamed:[arrayImage objectAtIndex:(indexPath.row-1)*3+i]] forState:UIControlStateNormal];
            }
            if ( [arraytitle count]>(indexPath.row-1)*3+i ) {
                label.text=[arraytitle objectAtIndex:(indexPath.row-1)*3+i];
            }
            
            [button addTarget:self action:@selector(selectFuncation:) forControlEvents:UIControlEventTouchUpInside];
            
            
            
        }
        
        
        
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
    
    
}


- (IBAction)selectFuncation:(id)sender{
    DLog(@"sender==%ld",(long)[sender tag]);
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
    
    DoctorListController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"DoctorListController"];
    DoctorModel *doctors=[[DoctorModel alloc]init];
    doctors.typeTag=[NSString stringWithFormat:@"%d",[sender tag]-1000];
    [doctor withManger:doctors];
    
    [self.navigationController pushViewController:doctor animated:YES];
    
    
}

@end
