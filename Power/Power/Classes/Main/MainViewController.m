//
//  MainViewController.m
//  Bull
//
//  Created by Grant on 15/3/19.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "MainViewController.h"

#import "NavigationController.h"
#import "SUserDB.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize indexNum;

- (void)dealloc
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loginSuccessFirst:0];
    
    
    SUserDB * db = [[SUserDB alloc] init];
    [db createDataBase];
    
    SUser * user = [SUser new];
    user.name = @"111";
    [db saveUser:user];

    
    [self performSelector:@selector(requestData:) withObject:nil afterDelay:1];
    
//    [self performSelector:@selector(requestHospitalList) withObject:nil afterDelay:1];

}


//选择第几个容器
- (void)selectViewController:(NSInteger)indexnumber{
    self.selectedIndex=indexnumber;
    indexNum=indexnumber;
}

- (void)loginSuccessFirst:(int)indexNum{
    
    if ([Users isLoginSystem]) { //-YES登陆 //判断是否登陆
        [self loginSuccess:YES ];  //登陆
        
    }else{                       //-NO没登陆 //判断是否登陆
        [self loginSuccess:NO ];  //没登陆
        
    }
    
}

/**
 * 添加子控制器
 */
- (void)addChildViewControllerWithTitle:(NSString *)title
                         storyboardName:(NSString *)storyboardName
                                   icon:(NSString *)icon
                                selIcon:(NSString *)selIcon
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    NavigationController *nav = [storyboard instantiateInitialViewController];
    
    nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:icon] selectedImage:[UIImage imageNamed:selIcon]];
    
    [self addChildViewController:nav];
}


- (void)loginSuccess:(BOOL)isLogin {
    
//    NSArray *array=[NSArray arrayWithObjects:@"首页",@"医生",@"医院",@"个人中心", nil];
    NSArray *array=[NSArray arrayWithObjects:@"个人中心",@"医院",@"医生",@"设置", nil];
    
    
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



- (void)requestData:(NSString *)typeString {
    

    NSURL *url0 = [NSURL URLWithString:[NSString stringWithFormat:@"%@?pageIndex=1&pageSize=10",hospitalListUrl]];
    
    NSURLRequest *request0 = [NSURLRequest requestWithURL:url0];
    AFHTTPRequestOperation *operation0 = [[AFHTTPRequestOperation alloc] initWithRequest:request0];
    
    [operation0 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSLog(@"Response0: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//        NSArray *array = [defaults rm_customObjectForKey:@"HOSPITAL"];
        NSArray *array = [NSArray array];
//        if (!array) {
//            
//        }
        id responseJSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        id responseJSONResult = [responseJSON objectForKey:@"result"];
        array = [RMMapper mutableArrayOfClass:[HospitalModel class]
                             fromArrayOfDictionary:responseJSONResult];
        [defaults rm_setCustomObject:array forKey:@"HOSPITAL"];
        
        
        
        NSMutableArray *hospitalArray = [NSMutableArray arrayWithArray:array];
        
        HospitalModelDB * db = [[HospitalModelDB alloc] init];
//        [db createDataBase];
        
        [db createDataBase];
        [db saveHospitalArray:hospitalArray];
        
        
//        NSArray *arrays= [db findWithUid:@"1" limit:3];
//        NSLog(@"arrays = %@",arrays);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];

    
    
    //
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?type=1",doctorMdmUrl]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation1 = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation1 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSLog(@"Response: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        //        NSArray *array = [defaults rm_customObjectForKey:@"HOSPITAL"];
        NSArray *array = [NSArray array];
        //        if (!array) {
        //
        //        }
        id responseJSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        id responseJSONResult = [responseJSON objectForKey:@"result"];
        array = [RMMapper mutableArrayOfClass:[PositionModel class]
                        fromArrayOfDictionary:responseJSONResult];
        [defaults rm_setCustomObject:array forKey:@"POSITION"];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
    
    //医院级别
    NSURL *url2 = [NSURL URLWithString:[NSString stringWithFormat:@"%@?type=2",doctorMdmUrl]];
    
    NSURLRequest *request2 = [NSURLRequest requestWithURL:url2];
    
    AFHTTPRequestOperation *operation2 = [[AFHTTPRequestOperation alloc] initWithRequest:request2];
    
    [operation2 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSLog(@"Response2: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
    
    //科室
    NSURL *url3 = [NSURL URLWithString:[NSString stringWithFormat:@"%@?type=3",doctorMdmUrl]];
    NSURLRequest *request3 = [NSURLRequest requestWithURL:url3];
    AFHTTPRequestOperation *operation3 = [[AFHTTPRequestOperation alloc] initWithRequest:request3];
    [operation3 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSLog(@"Response3: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        //        NSArray *array = [defaults rm_customObjectForKey:@"HOSPITAL"];
        NSArray *array = [NSArray array];
        //        if (!array) {
        //
        //        }
        id responseJSON = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        id responseJSONResult = [responseJSON objectForKey:@"result"];
        array = [RMMapper mutableArrayOfClass:[DepartmentModel class]
                        fromArrayOfDictionary:responseJSONResult];
        [defaults rm_setCustomObject:array forKey:@"DEPARTMENT"];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
    
    //operation2 在 operation1 请求完成后执行
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operation2 addDependency:operation1];
    [operationQueue addOperations:@[operation0,operation1, operation2, operation3] waitUntilFinished:NO];
    
    
}




@end
