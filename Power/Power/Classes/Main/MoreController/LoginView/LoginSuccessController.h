//
//  LoginSuccessController.h
//  BGPreferentialShare
//
//  Created by Dong on 15-3-11.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  我的资产1

//登陆     login-6


//登陆成功  个人中心
#import <UIKit/UIKit.h>
#import "BasedViewController.h"

#import "BGProgressView.h"
#import "MJRefresh.h"

@interface LoginSuccessController : BasedViewController
@property (nonatomic, strong) AFHTTPRequestSerializer <AFURLRequestSerialization> * requestSerializer;

- (IBAction)countInformationAction:(id)sender;

@end
