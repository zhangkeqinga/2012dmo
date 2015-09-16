//
//  ASContainerUtil.h
//  ApprovalSystem
//
//  Created by yto on 14-11-27.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//  容器修改类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ASContainerUtil : NSObject

// 不固定设置圆角 加边框
+ (void)changeRoundViewWithBorderView:(UIView *)aView withRadius:(float)radius withBorderColor:(UIColor *)bColor;

@end
