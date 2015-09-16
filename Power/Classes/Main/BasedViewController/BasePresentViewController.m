//
//  BasePresentViewController.m
//  BGPreferentialShare
//
//  Created by Dong on 15-3-19.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "BasePresentViewController.h"

@interface BasePresentViewController ()

@end

@implementation BasePresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBackItem];
}

-(void)setTitleBackItem{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回1.png"] style:UIBarButtonItemStyleDone target:self action:@selector(returnView)];
}


- (void)returnView{
    [self.parentViewController dismissViewControllerAnimated:YES completion:^{  }];
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
