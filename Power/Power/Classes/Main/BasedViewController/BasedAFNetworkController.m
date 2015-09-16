//
//  BasedAFNetworkController.m
//  Bull
//
//  Created by mac on 15/7/22.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "BasedAFNetworkController.h"

@interface BasedAFNetworkController ()

@end

@implementation BasedAFNetworkController
@synthesize requestSerializer;
@synthesize tableArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableArray=[NSMutableArray array];
    
    // Do any additional setup after loading the view.
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
