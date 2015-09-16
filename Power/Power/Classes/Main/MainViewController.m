//
//  MainViewController.m
//  Bull
//
//  Created by Grant on 15/3/19.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "MainViewController.h"

#import "NavigationController.h"

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

    
    NSArray *array=[NSArray arrayWithObjects:@"首页",@"医生",@"医院",@"个人中心", nil];
    
    // 添加子控制器
    [self addChildViewControllerWithTitle:
     [array objectAtIndex:0]
     //NSLocalizedString(@"menu_1", nil)
//                           storyboardName:@"AppointDoctor"
                           storyboardName:@"FirstPageViewController"
                                     icon:@"product_gray"
                                  selIcon:@"product_gray"];
    
    [self addChildViewControllerWithTitle:[array objectAtIndex:1]
     //NSLocalizedString(@"menu_2", nil)
                           storyboardName:@"StarDoctor"
                                     icon:@"product_list_gray"
                                  selIcon:@"product_list_gray"];
    
    [self addChildViewControllerWithTitle:[array objectAtIndex:2]//NSLocalizedString(@"menu_3", nil)
                           storyboardName:@"DoctorTeam"
                                     icon:@"assets_gray"
                                  selIcon:@"assets_gray"];
    
    
    if (isLogin) { //登陆成功
        
        [self addChildViewControllerWithTitle:[array objectAtIndex:3]
         //NSLocalizedString(@"menu_4", nil)
                               storyboardName:@"ContactUs"
                                         icon:@"more_gray"
                                      selIcon:@"more_gray"];
        
    }else{  //未登陆
        
        [self addChildViewControllerWithTitle:[array objectAtIndex:3]
         //NSLocalizedString(@"menu_4", nil)
                               storyboardName:@"LoginView"
                                         icon:@"more_gray"
                                      selIcon:@"more_gray"];
        
        
    }
    
    
    

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
