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
#import "LoginPwdVC.h"

@interface ResigeterViewController ()

@end

@implementation ResigeterViewController

@synthesize deviceNumber;


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

//    _phoneText.text = @"13817356765";  //test phone

    if (![ValidateUtil isMobileNumber: _phoneText.text]) {
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请收入正确的手机号码" inView:self.view lastTime:1.0];
        return;
    }
    
    [self initRequest]; //判断是否注册
    

}

- (void)nextVCAction{
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"LoginView" bundle:nil];
    LoginPwdVC *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"LoginPwdVC"];
    friendControl.phoneNumber = _phoneText.text;
    
    [self.navigationController pushViewController:friendControl animated:YES];

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
    
    NSString *phone=[NSString stringWithFormat:@"13817356760"];
    phone = _phoneText.text;
    NSDictionary *dict = @{ @"userPhone":phone};

    [self showWaitLoading];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    [manager POST:isBoolRegesterUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * isRegister=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"result"] ];
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];

        if ([@"2001" isEqual:status]) { //
            
            if ([@"0" isEqual:isRegister]) { //未注册
                
                [self initRegisterRequest];//进行注册请求接口
            }
            if ([@"1" isEqual:isRegister]){  //已经注册
                
                [self nextVCAction];  //跳转到登录界面

            }
            if ([@"2" isEqual:isRegister]){  //已经注册
    
                AlertUtils *alert = [AlertUtils sharedInstance];
                [alert showWithText:@"请输入正确的手机号码" inView:self.view lastTime:1.0];
            }

            
        }else{
            AlertUtils *alert = [AlertUtils sharedInstance];
            [alert showWithText:messages inView:self.view lastTime:1.0];
        }

        
        
        [self hideWaitLoading];
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请求失败" inView:self.view lastTime:1.0];
        
        DLog(@"error＝%@", error);
        [self hideWaitLoading];
    }];
    
}



#pragma mark- 注册账号
- (void)initRegisterRequest{
    [self showWaitLoading];
    
    NSString *phone=[NSString stringWithFormat:@"13817356765"];
    phone = _phoneText.text;
    deviceNumber = [UnitPath UUID_DEVICE_save];
    NSDictionary *dict = @{ @"userPhone":phone,
                            @"userPassword":@"123456",
                            @"device": deviceNumber,
                            @"validation":@"123456",
                            @"userType":@"0"
                            };
    
    DLog(@"dict==%@",dict);
    
    //userPhone	    true	string	手机号码
    //userPassword	true	string	密码
    //device	    true	string	客户端设备标识
    //validation	false	string	手机短信验证码
    //userType	    true	int	0：普通用户 126：医生用户
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    [manager POST:isRegesterUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * isRegister=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"result"] ];
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 注册成功
            
            [AlertUtil alertPromptInformationWithDelegate:@"您已经注册成功，能够使用全部功能\n默认密码: 123456" delegate:self];
            
        }else{ // 注册失败
            
            DLog(@"注册 isRegister = %@ messages= %@",isRegister,messages);
        }
        
        [self hideWaitLoading];
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请求失败" inView:self.view lastTime:1.0];
        
        DLog(@"error＝%@", error);
        [self hideWaitLoading];
    }];
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:
                       @"createUser",@" ",
                       @"createUserName",@" ",
                       @"device",deviceNumber,
                       @"userPhone",_phoneText.text,
                       @"userType",@"0",
                       
                       nil];
    
    [Users loginSystem:dic];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginOut" object:nil];
    
}


@end
