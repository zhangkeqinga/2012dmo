//
//  UIButton+EnlargeEdge.m
//  MDBClient
//
//  Created by jhony on 14-12-19.
//  Copyright (c) 2014年 YTO—孙建龙. All rights reserved.
//

#import "UIButton+EnlargeEdge.h"

@implementation UIButton (EnlargeEdge)

static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)setEnlargeEdge:(CGFloat)size{
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left{
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect{
    NSNumber *topNum = objc_getAssociatedObject(self, &topNameKey);
    NSNumber *rightNum = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber *bottomNum = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber *leftNum = objc_getAssociatedObject(self, &leftNameKey);
    
    if(topNum && rightNum && bottomNum && leftNum){
        return CGRectMake(self.bounds.origin.x-leftNum.floatValue,
                          self.bounds.origin.y-topNum.floatValue,
                          self.bounds.size.width+leftNum.floatValue+rightNum.floatValue,
                          self.bounds.size.height+topNum.floatValue+bottomNum.floatValue);
    }else{
        return self.bounds;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect rect = [self enlargedRect];
    if(CGRectEqualToRect(rect, self.bounds)){
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? YES : NO;
}








@end
