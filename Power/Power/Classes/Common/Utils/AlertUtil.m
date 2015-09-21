//
//  AlertUtil.m
//  YTongExpress
//
//  Created by wuxiaozhen on 12/20/12.
//  Copyright (c) 2012 wuxiaozhen. All rights reserved.
//

#import "AlertUtil.h"

@implementation AlertUtil

+(void) alertPromptInformation:(NSString *) info
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:info delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    
}

+(void) alertPromptInformationWithDelegate:(NSString *) info  delegate: (id) del
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:info delegate:del cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

+(void) alertPromptInformationWithDelegateTag:(NSString *) info  delegate: (id) del witTag:(int)tag
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:info delegate:del cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    alert.tag=tag;
    [alert show];
}


+(void) alertLoginWithDelegate:(NSString *) info  delegate: (id) del
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:info delegate:del cancelButtonTitle:@"登录" otherButtonTitles:@"无账号下单", nil];
    [alert show];
    
}


+(void) alertSuerAndCancelWithDelegate:(NSString *) info  delegate: (id) del
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:info delegate:del cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    
}


+(void) alertSuerAndCancelWithDelegate:(NSString *) info  delegate: (id) del withTag:(NSInteger)tag_
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:info delegate:del cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    alert.tag=tag_;
    
    [alert show];
    
}



+ (void)alertViewAutoDissmiss:(UIAlertView *)alertView  withInfo:(NSString *)infoString  delegate: (id) del{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息" message:infoString delegate:del cancelButtonTitle:@"" otherButtonTitles:@"", nil];
    
    [alert show];
    [self performSelector:@selector(dimissAlert:) withObject:alert afterDelay:2.0];

}

- (void) dimissAlert:(UIAlertView *)alert {
    if(alert)     {
        [alert dismissWithClickedButtonIndex:[alert cancelButtonIndex] animated:YES];
    }
}



@end
