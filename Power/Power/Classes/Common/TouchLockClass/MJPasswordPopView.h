//
//  MJPasswordPopView.h
//  PasswordApp
//
//  Created by yto on 14-7-14.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJPasswordView.h"

#define App_Frame_Height        [[UIScreen mainScreen] applicationFrame].size.height
#define App_Frame_Width         [[UIScreen mainScreen] applicationFrame].size.width

#define PPV_Margin_Left 0
#define PPV_Margin_Right 0
#define PPV_Count 5

extern NSString *const MJ_PASSWORD_TRUE;

typedef enum {
    /** 设置密码第一次 **/
    PasswordTypeSet = 1,
    /** 设置密码第二次 **/
    PasswordTypeRepeat = 2,
    /** 输入密码 **/
    PasswordTypeEnter = 3
    
}PasswordType; // 输入类型

typedef enum {
    /** 设置密码成功 **/
    PasswordSuccessTypeSet = 1,
    /** 输入密码成功 **/
    PasswordSuccessTypeEnter = 2
    
}PasswordSuccessType;


@protocol MJPasswordPopViewDelegate;


@interface MJPasswordPopView : UIView <MJPasswordDelegate> {
    MJPasswordView *passwordView;
    
    MJPasswordView *passwordViewTs;

    UILabel  *messageLabel;  //重新设置手势Label
    UIButton *forgotPwdBtn;
    UIButton *otherBtn;
    UIButton *resetBtn;
    UIButton *backBtn;

@private
    PasswordType currentType;
    BOOL isCanEnter;          // 判断是否存在密码
    int  pswCount;
    BOOL isShowPopView;       // 判断是显示view

}

@property (nonatomic,assign)id <MJPasswordPopViewDelegate> delegate;
@property (nonatomic,assign)BOOL isShowPopView;       // 判断是显示view
@property (nonatomic,strong)UIButton *backBtn;

+ (id)sharePopView;

- (void)setPasswordType:(PasswordType)_type;

- (void)show:(UIView *)aView;

- (void)hidden;

@end



#pragma mark-
#pragma mark-MJPasswordPopViewDelegate
@protocol MJPasswordPopViewDelegate <NSObject>

// 忘记密码
- (void)didForgotPassword:(MJPasswordPopView *)pwdPopView;

// 设置密码成功、输入密码成功
- (void)didPasswordSuccess:(MJPasswordPopView *)pwdPopView withSuccessType:(PasswordSuccessType)successType;

// 切换其他帐号登陆
- (void)switchOtherAccount:(MJPasswordPopView *)pwdPopview;

// 输入5次密码都错误
- (void)enterPasswordErrorLimit:(MJPasswordPopView *)pwdPopview;
@end


