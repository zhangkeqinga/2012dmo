//
//  MJPasswordView.h
//  MJPasswordView
//
//  Created by tenric on 13-6-29.
//  Copyright (c) 2013年 tenric. All rights reserved.
//



#define kPasswordViewSideLength 280.0
#define kCircleRadius           30.0
#define kCircleLeftTopMargin    10.0
#define kCircleBetweenMargin    40.0
#define kPathWidth              8.0
#define kMinPasswordLength      2//3

#define backgroundColors    COLOR(84.0, 104.0, 130.0, 1.0)
#define circleFillColours   COLOR(84.0, 104.0, 130.0, 1.0)
#define pathColours         COLOR(78.0, 155.0, 266.0, 1.0)
#define circleFillColourHighlighteds  [UIColor blackColor]


#import <UIKit/UIKit.h>

#import "MJCircleLayer.h"
#import "MJPathLayer.h"

//密码状态
typedef enum ePasswordSate {
    ePasswordUnset,   //未设置
    ePasswordRepeat,  //重复输入
    ePasswordExist    //密码设置成功
}ePasswordSate;

@class MJPasswordView;

@protocol MJPasswordDelegate <NSObject>

/** 密码输入完毕回调 */
- (void)passwordView:(MJPasswordView*)passwordView withPassword:(NSString*)password;

@end

@interface MJPasswordView : UIView

/** 代理 */
@property (nonatomic,assign) id<MJPasswordDelegate> delegate;
@property (nonatomic,retain) UIColor* circleFillColour;
@property (nonatomic,retain) UIColor* circleFillColourHighlighted;
@property (nonatomic,retain) UIColor* pathColour;

@property (nonatomic,assign) CGPoint previousTouchPoint;

@property (nonatomic,assign) BOOL isTracking;             //跟踪速度

@property (nonatomic,retain) NSMutableArray* circleLayers;
@property (nonatomic,retain) NSMutableArray* trackingIds;

@property (nonatomic,retain) NSString *truePassword;
@property (nonatomic,retain) NSString *firstPassword;
@property (nonatomic,assign) double circleRadius; //半径
@property (nonatomic,assign) double lineWidth;


- (void)initView;

@end
