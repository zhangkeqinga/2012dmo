//
//  AlertUtils.h
//  TaiPing
//
//  Created by he fei on 11-12-21.
//  Copyright (c) 2011年 BBDTEK. All rights reserved.
//  管理所有弹窗
//  

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface AlertUtils : NSObject <MBProgressHUDDelegate> {
@private
    MBProgressHUD *hud;
    MBProgressHUD *loding_hud;
}
@property (nonatomic) unsigned int lastTime;
+ (AlertUtils *)sharedInstance;
+ (BOOL)tryToRelease;

//弹窗－MBProgressHUD样式
//显示弹窗－MBProgressHUD
- (void)showWithText:(NSString *)alertText inView:(UIView *)view lastTime:(unsigned int)lastTime;
//弹窗－MBProgressHUD 执行响应事件
- (void)showInView:(UIView *)view selector:(SEL)selector onTarget:(id)target alertText:(NSString *)text withObject:(id)object;

//弹窗－UIAlertView样式
- (void)alertWithTitle:(NSString *)title message:(NSString *)message ctitle:(NSString *)ctitle otitle:(NSString *)otitle tag:(NSInteger)tag;

//弹窗－UIPopoverController样式
//- (UIPopoverController *)popoverControllerWithContentSize:(CGSize)size plist:(NSString *)plistName pdelegate:(id<DataListControllerDelegate>)pdelegate action:(SEL)action;
- (UIPopoverController *)popoverControllerWithContentSize:(CGSize)size contentViewController:(id)controller;
//隐藏弹出框
- (void)hideHud;

//显示弹窗－MBProgressHUD
- (void)showWithText:(NSString *)alertText inView:(UIView *)view;
@end
