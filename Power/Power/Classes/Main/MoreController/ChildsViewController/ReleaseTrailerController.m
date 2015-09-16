//
//  ReleaseTrailerController.m
//  BGPreferentialShare
//
//  Created by Dong on 15-3-19.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  联系我们

#import "ReleaseTrailerController.h"

@interface ReleaseTrailerController ()

@end

@implementation ReleaseTrailerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBarController.tabBar.hidden=YES;
    self.title=@"意见反馈";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
