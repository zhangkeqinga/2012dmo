//
//  BasedViewController.m
//  BGPreferentialShare
//
//  Created by Dong on 15-3-12.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "BasedViewController.h"
#import "AppDelegate.h"

@interface BasedViewController ()

@end

@implementation BasedViewController

@synthesize loginOrRegister;
@synthesize banksModel;
@synthesize productDetailImage;
@synthesize productModel_;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=BACKVIEWCOLOR;
//    [self setTitleBackItemImage];

    productDetailImage= [[UIImage alloc]init];
}

- (void)withManger:(BankModel *)bankModel_{
    self.banksModel=bankModel_;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.tabBarController.tabBar.hidden=NO;
    
}


//设置导航栏的颜色
- (void)navigationBackColor{
    
    UINavigationBar * appearance = [UINavigationBar appearance];
    UIImage *navBackgroundImg =[UIImage imageNamed:@"backImg_red.png"];
    [appearance setBackgroundImage:navBackgroundImg forBarMetrics:UIBarMetricsDefault];
    
}

//设置返回按钮的标题  为空
#pragma mark - setTitleBack...
-(void)setTitleBackItemNil{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    [backItem setImage:nil];
    self.navigationItem.leftBarButtonItem = backItem;
    
}
//导航栏 返回按钮只显示“返回”字样
-(void)setTitleBackItem{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回"style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    self.navigationItem.leftBarButtonItem = backItem;
}

//导航栏 返回按钮只显示“<”图标
-(void)setTitleBackItemImage{
//    UIImage* img1=[UIImage imageNamed:@"back_btn_gray.png"];
    UIImage* img1=[UIImage imageNamed:@""];

    UIBarButtonItem*barItem1 = [[UIBarButtonItem alloc]
                                initWithImage:img1
                                style:UIBarButtonItemStylePlain
                                target:self
                                action:@selector(back)];
    self.navigationItem.leftBarButtonItem = barItem1;
}

//导航栏 返回按钮显示“< 返回”   未完成。。。
-(void)setTitleBackItemImageAndTitle{
    
    UIImage* img1=[UIImage imageNamed:@"back_btn_gray.png"];
    UIBarButtonItem*barItem1 = [[UIBarButtonItem alloc] init];
    
    [barItem1 setBackgroundImage:img1 forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
   
    [barItem1 setTitle:@"返回"];
//    [barItem1 setImage:img1];
    [barItem1 setTarget:self];
    [barItem1 setAction:@selector(back)];
    [barItem1 setStyle:UIBarButtonItemStyleDone];

    self.navigationItem.leftBarButtonItem = barItem1;

}


- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

//导航栏 显示“添加”
-(void)setAddItemTitle{
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"添加"style:UIBarButtonItemStylePlain target:self action:@selector(addAction:)];
    
    self.navigationItem.rightBarButtonItem = backItem;
    
}

- (IBAction)addAction:(id)sender{
    DLog(@"添加 功能");
    
}


- (void)setMoreNavigationBar{
    
    UIBarButtonItem *startBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(startDownloadAll)];
    UIBarButtonItem *pauseBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(stopDownloadAll)];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects: pauseBtn,startBtn,nil]];
    
}

- (void)startDownloadAll{
}

- (void)stopDownloadAll{
}



- (BOOL)isnotNetWorking{
    //对连接改变做出响应的处理动作。
    NSString * status=[UnitPath internetStatus];
    if ([@"notReachable" isEqual: status]) { //没有连接到网络就弹出提实况
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"网络中断!" inView:self.view lastTime:1.0];
        return NO;
    }else{
        return YES;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- activityIndicator
-(void)showWaitLoading
{
    
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;

    if (parentWaitLoading.view!=nil) {
        [parentWaitLoading hiddenWaitingLoadingView];
    }
    parentWaitLoading=[[WaitingLoadingViewController alloc]init];
    parentWaitLoading.view.frame=app.window.frame;
    
    [self.view addSubview:parentWaitLoading.view];
    
    
    
//    [self showMRProgressWaitLoading];
}

-(void)showWaitLoadingAtRect:(CGRect )_rect
{
    if (parentWaitLoading.view!=nil) {
        [parentWaitLoading hiddenWaitingLoadingView];
    }
    parentWaitLoading=[[WaitingLoadingViewController alloc]init];
    parentWaitLoading.activityIndicator.frame=_rect;
    [self.view addSubview:parentWaitLoading.view];
    
}

-(void)hideWaitLoading
{
    if (parentWaitLoading.view!=nil) {
        [parentWaitLoading hiddenWaitingLoadingView];
    }
    
    
//    [self hideMRProgressWaitLoading];
}



- (void)showMRProgressWaitLoading{

    if (mrgprogressView!=nil) {
        [mrgprogressView removeFromSuperview];
        mrgprogressView=nil;
    }
    
    mrgprogressView = [MRProgressOverlayView new];
    mrgprogressView.mode = MRProgressOverlayViewModeIndeterminateSmall;
    [self.view addSubview:mrgprogressView];
    [mrgprogressView show:YES];
    
}


- (void)hideMRProgressWaitLoading{
    [mrgprogressView dismiss:YES];
}



@end
