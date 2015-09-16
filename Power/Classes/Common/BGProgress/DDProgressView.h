//
//  DDProgressView.h
//  demo
//
//  Created by mac on 15/7/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDProgressView : UIView
{
@private
    float progress ;
    UIColor *innerColor ;
    UIColor *outerColor ;
    UIColor *emptyColor ;
}

@property (nonatomic,retain) UIColor *innerColor ;
@property (nonatomic,retain) UIColor *outerColor ;
@property (nonatomic,retain) UIColor *emptyColor ;
@property (nonatomic,assign) float progress ;

@end
