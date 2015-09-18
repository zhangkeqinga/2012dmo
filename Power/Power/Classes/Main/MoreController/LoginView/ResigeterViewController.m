//
//  ResigeterViewController.m
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "ResigeterViewController.h"
#import "ASHttpRequest.h"
#import "AlertUtils.h"

@interface ResigeterViewController ()

@end

@implementation ResigeterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    
    self.title = @"登录/注册";
    
}

- (IBAction)agreeAction:(id)sender {
    
    
}


- (IBAction)registerAction:(id)sender {
    
    [_phoneText resignFirstResponder];
    
    
    if ([@"" isEqual: _phoneText.text]) {
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请收入正确的手机号码" inView:self.view lastTime:1.0];
        return;
    }

    
//    [self initRequest];
    
    //判断是否注册  如果已经注册就直接进入 输入密码登录 否者直接给注册
    [AlertUtil alertPromptInformationWithDelegate:@"你已经注册成功，能够使用全部功能\n默认密码666666" delegate:self];
//

}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
   
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



#pragma mark-手机号码验证
- (void)initRequest{
    
    
    NSString *phone=[NSString stringWithFormat:@"17878499099"];
    phone = _phoneText.text;
    
    if ([@"" isEqual: phone]) {
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请收入正确的手机号码" inView:self.view lastTime:1.0];
        return;
    }
    
    
    
    [self showWaitLoading];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    //2.设置登录参数
    NSDictionary *dict = @{ @"userPhone":phone , @"userPassword":@"666666"};
    
    [manager POST:isRegester parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSString * isRegister=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"result"] ];
//        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
//        
//        if ([@"1" isEqual:isRegister]) { //  未注册
//            
//        }else if ([@"0" isEqual:isRegister] ){  //已经注册
//            
//        }else{
//            
//            AlertUtils *alert = [AlertUtils sharedInstance];
//            [alert showWithText:messages inView:self.view lastTime:1.0];
//        }
//        
//        
        [self hideWaitLoading];
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请求失败" inView:self.view lastTime:1.0];
        
        DLog(@"error＝%@", error);
        
        [self hideWaitLoading];
        
    }];
    
}


@end
