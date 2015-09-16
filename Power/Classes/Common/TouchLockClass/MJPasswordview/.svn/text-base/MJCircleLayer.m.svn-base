//
//  MJCircleLayer.m
//  MJCircleView
//
//  Created by tenric on 13-6-29.
//  Copyright (c) 2013年 tenric. All rights reserved.
//

#import "MJCircleLayer.h"
#import "MJPasswordView.h"

@implementation MJCircleLayer

- (void)drawInContext:(CGContextRef)ctx
{

    self.cornerRadius = self.frame.size.height/2;
    self.borderWidth = 2.0;
    self.borderColor = self.passwordView.circleFillColour.CGColor;
    
    if (self.highlighted)
    {
        CGContextSetFillColorWithColor(ctx, self.passwordView.circleFillColourHighlighted.CGColor);
        
        // fansj  ----绘制手势密码添加中间圆心
        CGFloat centerX = self.frame.size.width/2;
        CGFloat centerY = self.frame.size.height/2;
        CGFloat radius = (self.frame.size.height-10)/2;
        
        CGContextAddArc(ctx, centerX, centerY, radius, 0, 2*M_PI, 0); //添加一个圆
        CGContextDrawPath(ctx, kCGPathFill);//绘制填充
        
        CGContextSetFillColorWithColor(ctx, self.passwordView.pathColour.CGColor);
        CGContextAddArc(ctx, centerX, centerY, 10, 0, 2*M_PI, 0); //添加一个圆
        CGContextDrawPath(ctx, kCGPathFill);//绘制填充
    }
}


@end
