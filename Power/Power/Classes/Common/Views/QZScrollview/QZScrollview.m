//
//  QZScrollview.m
//  Bull
//
//  Created by mac on 15/7/11.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "QZScrollview.h"

@implementation QZScrollview

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
    NSLog(@"用户点击了scroll上的视图%@,是否开始滚动scroll",view);
    //返回yes 是不滚动 scroll 返回no 是滚动scroll
    return YES;
}
- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    
    NSLog(@"用户点击的视图 %@",view);
    
    //NO scroll不可以滚动 YES scroll可以滚动
    return NO;
}

@end
