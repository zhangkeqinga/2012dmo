//
//  ChangePasswordController.m
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "ChangePasswordController.h"

@interface ChangePasswordController ()
@property (weak, nonatomic) IBOutlet UITextField *oldPwdText;
@property (weak, nonatomic) IBOutlet UITextField *newsPwdText;
@property (weak, nonatomic) IBOutlet UITextField *sureNewPwdText;

@end

@implementation ChangePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    
    self.title= @"修改密码";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)makeSure:(id)sender{
    
    if ([@"" isEqualToString:  _oldPwdText.text ]) {
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请输入旧密码" inView:self.view lastTime:1.0];
    
        return;
    }
    
    if (![ValidateUtil secretCodeLegal: _newsPwdText.text ]) {
        
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请输入格式正确的密码" inView:self.view lastTime:1.0];
        return;

    }
    
    if (![ValidateUtil secretCodeLegal:  _sureNewPwdText.text ]) {
        
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请输入格式正确的密码" inView:self.view lastTime:1.0];
        return;
        
    }

    
    
    if (![_sureNewPwdText.text isEqualToString:_newsPwdText.text]) {
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"两次新密码不一致,请重新输入" inView:self.view lastTime:1.0];
        return;

    }
    
    
    [self initRequest];
    
    
}

#pragma mark- 修改密码
- (void)initRequest{
    
    NSDictionary *dict = @{ @"userPhone": [Users phoneNumber],
                            @"newPassword": _newsPwdText.text,
                            @"oldPassword": _oldPwdText.text,
                            @"token": @" "

                            };
    
    DLog(@"修改密码dict==%@",dict);
    
    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager POST:changePwdUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 成功
           
            [AlertUtil alertPromptInformationWithDelegateTag:@"修改密码成功"  delegate:self witTag:1000];

        }else{ //
            [AlertUtil alertPromptInformationWithDelegateTag:messages  delegate:self witTag:1001];

            
        }
        
        [self hideWaitLoading];
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请求失败" inView:self.view lastTime:1.0];
        
        DLog(@"error＝%@", error);
        [self hideWaitLoading];
    }];
    
}

//
//{
//    info = SUCCESS;
//    message = OK;
//    result =     (
//                  {
//                      createIp = "<null>";
//                      createTime = "2015-09-06 16:19:04.444";
//                      createUser = "<null>";
//                      createUserName = "<null>";
//                      doctorAge = 35;
//                      doctorHospital = "\U4e0a\U6d77\U4eba\U6c11\U533b\U9662";
//                      doctorImage = "<null>";
//                      doctorInfo = "\U7b80\U4ecb";
//                      doctorName = "\U7530\U6e90";
//                      doctorSection = "<null>";
//                      doctorSectionRank = "<null>";
//                      doctorSpecial = "\U7279\U957f";
//                      doctorTitle = "\U4f4f\U9662\U533b\U5e08";
//                      id = 1;
//                      isDelete = 0;
//                      order = "<null>";
//                      page = "<null>";
//                      rows = "<null>";
//                      sort = "<null>";
//                      teamId = 1;
//                      updateIp = "<null>";
//                      updateTime = "<null>";
//                      updateUser = "<null>";
//                      updateUserName = "<null>";
//                  }
//                  );
//    status = 2001;
//}
//


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (alertView.tag) {
        case 1000:
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
            
        case 1001:
        {
            DLog(@"error");
        }
            break;
            
        default:
            break;
    }
}


@end
