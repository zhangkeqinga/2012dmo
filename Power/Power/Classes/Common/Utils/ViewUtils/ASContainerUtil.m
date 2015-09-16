//
//  ASContainerUtil.m
//  ApprovalSystem
//
//  Created by yto on 14-11-27.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import "ASContainerUtil.h"

@implementation ASContainerUtil

// 不固定设置圆角  加边框
+ (void)changeRoundViewWithBorderView:(UIView *)aView withRadius:(float)radius withBorderColor:(UIColor *)bColor {
    aView.layer.masksToBounds = YES;
    aView.layer.cornerRadius = radius;
    aView.layer.borderWidth = 1.0;
    aView.layer.borderColor = [bColor CGColor];
}

@end
