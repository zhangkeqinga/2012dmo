//
//  MJPathLayer.m
//  MJPasswordView
//
//  Created by tenric on 13-6-30.
//  Copyright (c) 2013年 tenric. All rights reserved.
//

#import "MJPathLayer.h"
#import "MJPasswordView.h"

@implementation MJPathLayer
@synthesize lineWidth;
- (void)drawInContext:(CGContextRef)ctx
{
    if(!self.passwordView.isTracking)
    {
        return;
    }
    
    NSArray* circleIds = self.passwordView.trackingIds;
    int circleId = [[circleIds objectAtIndex:0] intValue];
    CGPoint point = [self getPointWithId:circleId];
    CGContextSetLineWidth(ctx, lineWidth);

    CGContextSetLineJoin(ctx, kCGLineJoinRound);

    const CGFloat *components = CGColorGetComponents(self.passwordView.pathColour.CGColor);
    CGFloat redF = components[0];
    CGFloat greenF = components[1];
    CGFloat blueF = components[2];
    CGContextSetRGBStrokeColor(ctx, redF, greenF, blueF, 0.4);
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, point.x, point.y);
    
    for (int i = 1; i < [circleIds count]; i++)
    {
        circleId = [[circleIds objectAtIndex:i] intValue];
        point = [self getPointWithId:circleId];
        CGContextAddLineToPoint(ctx, point.x, point.y);
    }
   
    point = self.passwordView.previousTouchPoint;
    CGContextAddLineToPoint(ctx, point.x, point.y);
    [self.passwordView.pathColour setStroke];
    CGContextDrawPath(ctx, kCGPathStroke);
}

- (CGPoint)getPointWithId:(int)circleId
{
    CGFloat x = self.passwordView.circleRadius*3+circleId%3*(self.passwordView.circleRadius*2+self.passwordView.circleRadius);
    
    CGFloat y = self.passwordView.circleRadius*3+circleId/3*(self.passwordView.circleRadius*2+self.passwordView.circleRadius);
    
    CGPoint point = CGPointMake(x, y);
    DLog(@"pointx=%f",point.x);
    return point;
}

@end
