//
//  LoginPwdVC.h
//  Power
//
//  Created by mac on 15/9/18.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import "BasedAFNetworkController.h"

@interface LoginPwdVC : BasedAFNetworkController
<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
@property (weak, nonatomic) IBOutlet UIButton *forgateBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (strong, nonatomic) NSString *phoneNumber;
@end
