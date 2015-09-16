//
//  RoundedImgClass.h
//  MDBClient
//
//  Created by jhony on 14-5-26.
//  Copyright (c) 2014年 YTO—jhon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundedImgClass : UIImageView

//  是否带圆角  是否带边框
- (id)initWithFrame:(CGRect)frame isRounded:(BOOL)round isBorder:(BOOL)border;

@end
