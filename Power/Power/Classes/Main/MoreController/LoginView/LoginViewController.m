//
//  LoginViewController.m
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "LoginViewController.h"
#import "PointApplyInfoCommitController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden=NO;

    self.title=@"个人中心";
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//登录
- (IBAction)registerAction:(id)sender {
    
    
}


- (IBAction)loginAction:(id)sender {
    
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
    PointApplyInfoCommitController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"PointApplyInfoCommitController"];
    [self.navigationController pushViewController:doctor animated:YES];

    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
