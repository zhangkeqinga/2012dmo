//
//  BGProgressView.h
//  11223344
//
//  Created by Grant on 14-8-7.
//  Copyright (c) 2014年 BG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICountingLabel.h"

@interface BGProgressView : UIView
{
    CAShapeLayer *_trackLayer;
    UIBezierPath *_trackPath;
    CAShapeLayer *_progressLayer;
    UIBezierPath *_progressPath;
    CAShapeLayer *_outTrackLayer;
    CAShapeLayer *_inTrackLayer;
}

@property (strong, nonatomic) UIColor *trackColor;
@property (strong, nonatomic) UIColor *progressColor;
@property (assign, nonatomic) float   progress;
@property (assign, nonatomic) float   progressWidth;

@property (assign, nonatomic) float maxValue;
@property (assign, nonatomic) float minValue;
@property (assign, nonatomic) float currentValue;
@property (assign, nonatomic) float duration;

@property (strong, nonatomic) UICountingLabel *currentLabel;//当前指标值
@property (strong, nonatomic) UILabel         *mimLabel;    //指标的最小值
@property (strong, nonatomic) UILabel         *maxLabel;    //指标的最大值
@property (strong, nonatomic) UILabel         *itenUnit;    //指标的单位
@property (strong, nonatomic) UILabel         *currentTitle;//当前值名称

@property (assign, nonatomic) float supValue;

@property (strong, nonatomic) UIButton *addData_btn;

- (void)setValueWithMax:(float)maxValue
               minValue:(float)minValue
           currentValue:(float)currentValue
          progressWidth:(float)width
               itemUnit:(NSString *)unit
               title:(NSString *)type;

@end
