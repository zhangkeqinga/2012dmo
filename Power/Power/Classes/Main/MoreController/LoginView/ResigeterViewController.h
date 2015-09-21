//
//  ResigeterViewController.h
//  PowerfullDoctors
//
//  Created by mac on 15/8/30.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  注册

#import "BasedAFNetworkController.h"

@interface ResigeterViewController : BasedAFNetworkController
<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneText;
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (strong, nonatomic)  NSString  * deviceNumber;

@end
