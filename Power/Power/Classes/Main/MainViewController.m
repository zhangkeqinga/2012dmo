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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
