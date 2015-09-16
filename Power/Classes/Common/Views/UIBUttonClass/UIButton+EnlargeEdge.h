//
//  UIButton+EnlargeEdge.h
//  MDBClient
//
//  Created by jhony on 14-12-19.
//  Copyright (c) 2014年 YTO—孙建龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIButton (EnlargeEdge)


- (void)setEnlargeEdge:(CGFloat)size;
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;
@end
