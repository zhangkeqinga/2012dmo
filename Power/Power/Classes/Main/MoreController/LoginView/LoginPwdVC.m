//
//  LoginPwdVC.m
//  Power
//
//  Created by mac on 15/9/18.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import "LoginPwdVC.h"

@interface LoginPwdVC ()

@end

@implementation LoginPwdVC

@synthesize phoneNumber;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    
    self.title = @"登录";
    
}



//忘记密码
- (IBAction)forgateAction:(id)sender {
    
    [self initForgateRequest];
    
//    [AlertUtil alertPromptInformation:@"验证码已经发到您的手机，您可以通过验证码进行登录"];
    
    return;

}





#pragma mark- initForgateRequest
- (void)initForgateRequest{

    NSDictionary *dict = @{ @"userPhone":phoneNumber,
                            @"newPassword":@"123456",
                            @"validation": @"123456"

                            };
    
    DLog(@"initForgateRequest==%@",dict);
    
    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    [manager POST:forgateUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 登录成功
            
            [AlertUtil alertPromptInformationWithDelegate:@"您已经将你的密码重置为: 123456" delegate:self];

            
        }else{ // 登录失败
            AlertUtils *alert = [AlertUtils sharedInstance];
            [alert showWithText:messages inView:self.view lastTime:1.0];

            DLog(@"注册 messages= %@",messages);
        }
        
        [self hideWaitLoading];
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请求失败" inView:self.view lastTime:1.0];
        
        DLog(@"error＝%@", error);
        [self hideWaitLoading];
    }];
    
}




//登录
- (IBAction)loginViewAction:(id)sender {
    
    [_pwdText resignFirstResponder];
    
    if ([@"" isEqual: _pwdText.text]) {
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请输入正确的密码" inView:self.view lastTime:1.0];
        return;
    }
    
    
    [self initRequest];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [_pwdText resignFirstResponder];
    
}



#pragma mark- login
- (void)initRequest{
    
    NSDictionary *dict = @{ @"userPhone":phoneNumber,
                            @"userPassword":_pwdText.text
                            };
    
    DLog(@"dict==%@",dict);

    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    [manager POST:loginUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 登录成功
            
            NSDictionary * isRegister=[responseObject objectForKey:@"result"] ;
            
            NSString *string1= [NSString stringWithFormat:@"%@",[isRegister objectForKey:@"createUser"]];
            NSString *string2= [NSString stringWithFormat:@"%@",[isRegister objectForKey:@"createUserName"]];
            NSString *string3= [NSString stringWithFormat:@"%@",[isRegister objectForKey:@"device"]];
            NSString *string4= [NSString stringWithFormat:@"%@",[isRegister objectForKey:@"userPhone"]];
            NSString *string5= [NSString stringWithFormat:@"%@",[isRegister objectForKey:@"userType"]];
            NSString *string6= [NSString stringWithFormat:@"%@",[isRegister objectForKey:@"id"]];
            NSString *string7= [NSString stringWithFormat:@"%@",[isRegister objectForKey:@"userAge"]];

            NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:
                               string1,@"createUser",
                               string2,@"createUserName",
                               string3,@"device",
                               string4,@"userPhone",
                               string5,@"userType",
                               string6,@"id",
                               string7,@"userAge",

                               nil];
            
            [Users loginSystem:dic];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginOut" object:nil];
            
        }else{ // 登录失败
            
            AlertUtils *alert = [AlertUtils sharedInstance];
            [alert showWithText:messages inView:self.view lastTime:1.0];

            DLog(@"注册 messages= %@",messages);
        }

        [self hideWaitLoading];
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请求失败" inView:self.view lastTime:1.0];
        
        DLog(@"error＝%@", error);
        [self hideWaitLoading];
    }];
    
}


//{
//    info = SUCCESS;
//    message = OK;
//    result =     {
//        createIp = "<null>";
//        createTime = "2015-09-19 11:18:10.355";
//        createUser = "<null>";
//        createUserName = "<null>";
//        device = "150919111806.0";
//        id = 6;
//        isDelete = 0;
//        loginCount = 5;
//        oldPassword = "<null>";
//        order = "<null>";
//        page = "<null>";
//        points = "<null>";
//        rows = "<null>";
//        sort = "<null>";
//        updateIp = "<null>";
//        updateTime = "<null>";
//        updateUser = "<null>";
//        updateUserName = "<null>";
//        userAge = "<null>";
//        userName = "<null>";
//        userPassword = "<null>";
//        userPhone = 13817356763;
//        userType = 0;
//    };
//    status = 2001;
//}


@end
