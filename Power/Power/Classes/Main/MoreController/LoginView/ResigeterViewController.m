//
//  ResigeterViewController.m
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "ResigeterViewController.h"

@interface ResigeterViewController ()

@end

@implementation ResigeterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    
    self.title = @"注册";
    
}

- (IBAction)agreeAction:(id)sender {
    
    
}


- (IBAction)registerAction:(id)sender {
    
    [_phoneText resignFirstResponder];
    
    
    [Users loginSystem:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginOut" object:nil];

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [_phoneText resignFirstResponder];
    
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
