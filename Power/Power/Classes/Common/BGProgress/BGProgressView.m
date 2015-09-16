//
//  BGProgressView.m
//  11223344
//
//  Created by Grant on 14-8-7.
//  Copyright (c) 2014年 BG. All rights reserved.
//

#import "BGProgressView.h"


#define DEGREES_TO_RADIANS(angle) ((angle) * (M_PI/180))

#define kSpeed 1

#define kRGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define kNumberFont(s) [UIFont fontWithName:@"Arial" size:s]

#define _trackLayerColor    [UIColor whiteColor]  //kRGBAColor(78, 99, 177, 1.0)    //
#define _outTrackLayerColor kRGBAColor(240,240,240,1)  //环线
#define _inTrackLayerColor  kRGBAColor(240,240,240,1)  //环线


@interface BGProgressView()

@property (assign, nonatomic) float startAngle;
@property (assign, nonatomic) float endAngle;

@end


@implementation BGProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setup];

        
        
        
    }
    return self;
}

- (void)setup
{
    _trackLayer = [CAShapeLayer new];
    [self.layer addSublayer:_trackLayer];
    _trackLayer.fillColor = nil;
    _trackLayer.lineCap = kCALineCapRound;
    _trackLayer.frame = self.bounds;
    
    _outTrackLayer = [CAShapeLayer new];
    [self.layer addSublayer:_outTrackLayer];
    _outTrackLayer.fillColor = nil;
    _outTrackLayer.lineCap = kCALineCapRound;
    _outTrackLayer.frame = self.bounds;
    _outTrackLayer.lineWidth = 1;
    
    _inTrackLayer = [CAShapeLayer new];
    [self.layer addSublayer:_inTrackLayer];
    _inTrackLayer.fillColor = nil;
    _inTrackLayer.lineCap = kCALineCapRound;
    _inTrackLayer.frame = self.bounds;
    _inTrackLayer.lineWidth = 1;
    
    _progressLayer = [CAShapeLayer new];
    [self.layer addSublayer:_progressLayer];
    _progressLayer.fillColor = nil;
//    _progressLayer.lineCap = kCALineCapRound;  //设置 线头的样式
    _progressLayer.frame = self.bounds;
    
    self.progressWidth = 5; //默认5
    
    CGFloat r = CGRectGetHeight(self.bounds) / 2;
    
    //当前值
    _currentLabel = [[UICountingLabel alloc] init];
    _currentLabel.bounds = CGRectMake(0, 0, 200, 60);
    _currentLabel.center = CGPointMake(CGRectGetMidX(self.bounds), r + r * cosf(45) - 5);
    _currentLabel.textAlignment = NSTextAlignmentCenter;
    _currentLabel.method = UILabelCountingMethodEaseInOut;
//    _currentLabel.font = kNumberFont(30.0);
    _currentLabel.text = @"0";
    _currentLabel.format = @"%.1f";
    [self addSubview:_currentLabel];
    
    //当前值单位
    _itenUnit = [[UILabel alloc] init];
    _itenUnit.bounds = CGRectMake(0, 0, 160, 30);
    _itenUnit.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    _itenUnit.textAlignment = NSTextAlignmentCenter;
    _itenUnit.font = [UIFont systemFontOfSize:14.0];
    [self addSubview:_itenUnit];
    
    //当前值的名称
    _currentTitle = [[UILabel alloc] init];
    _currentTitle.bounds = CGRectMake(0, 0, 160, 30);
    _currentTitle.center = CGPointMake(CGRectGetMidX(self.bounds), r + r * cosf(45));
    _currentTitle.textAlignment = NSTextAlignmentCenter;
    _currentTitle.font = [UIFont systemFontOfSize:14.0];
    _currentTitle.textColor = kRGBAColor(44, 62, 131, 1.0);
    [self addSubview:_currentTitle];
    
    //最小值
    _mimLabel = [[UILabel alloc] init];
    _mimLabel.bounds = CGRectMake(0, 0, 100, 30);
    _mimLabel.center = CGPointMake(r / 2, CGRectGetHeight(self.bounds) - r * cosf(30));
    _mimLabel.textAlignment = NSTextAlignmentCenter;
//    _mimLabel.font = kNumberFont(12.0);
    _mimLabel.text = @"0";
//    [self addSubview:_mimLabel];
    
    //最大值
    _maxLabel = [[UILabel alloc] init];
    _maxLabel.bounds = CGRectMake(0, 0, 100, 30);
    _maxLabel.center = CGPointMake(r * 3 / 2, CGRectGetHeight(self.bounds) - r * cosf(30));
    _maxLabel.textAlignment = NSTextAlignmentCenter;
//    _maxLabel.font = kNumberFont(12.0);
    _maxLabel.text = @"100";
//    [self addSubview:_maxLabel];
    
    _addData_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_addData_btn setTitle:@"产品名称" forState:UIControlStateNormal];
    
    _addData_btn.titleLabel.font = kNumberFont(18.0);
    
    [_addData_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    _addData_btn.bounds = CGRectMake(0, 0, 110, 110);
//    _addData_btn.backgroundColor=[UIColor blueColor];
    _addData_btn.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds) - 15);
    
    [self addSubview:_addData_btn];
    
    UIView *line = [[UIView alloc] init];
    line.bounds = CGRectMake(0, 0, self.bounds.size.width - 40, 1);
    line.center = CGPointMake(self.bounds.size.width / 2, CGRectGetMidY(self.bounds) + 8);
    line.backgroundColor = [UIColor grayColor];
    [self addSubview:line];
    
    _startAngle = 0;
    _endAngle = 360;
    
    
    [self loadTrack];
    
    [self loadOutTrack];
    
    [self loadInTrack];
}

- (void)awakeFromNib
{
    [self setup];  
}

//加载背景圆弧
- (void)loadTrack
{
    CGFloat c = MIN(self.frame.size.width, self.frame.size.height) / 2.0;
    
    CGPoint center = CGPointMake(c, c);
    
    _trackPath = [UIBezierPath bezierPathWithArcCenter:center radius:(self.bounds.size.width - _progressWidth)/ 2 - 3
                                            startAngle:DEGREES_TO_RADIANS(_startAngle + 180)
                                              endAngle:DEGREES_TO_RADIANS(_endAngle + 180) clockwise:YES];
    
    _trackLayer.path = _trackPath.CGPath;
    
//    _trackLayer.strokeColor = kRGBAColor(78, 99, 177, 1.0).CGColor;
    
    _trackLayer.strokeColor = _trackLayerColor.CGColor;

}

- (void)loadOutTrack
{
    CGFloat c = MIN(self.frame.size.width, self.frame.size.height) / 2.0;
    
    CGPoint center = CGPointMake(c, c);
    
    _trackPath = [UIBezierPath bezierPathWithArcCenter:center radius:(self.bounds.size.width - _progressWidth)/ 2 + 2
                                            startAngle:DEGREES_TO_RADIANS(_startAngle + 180)
                                              endAngle:DEGREES_TO_RADIANS(_endAngle + 180) clockwise:YES];
    
    _outTrackLayer.path = _trackPath.CGPath;
    
//    _outTrackLayer.strokeColor = kRGBAColor(193, 193, 193, 1.0).CGColor;
    _outTrackLayer.strokeColor = _outTrackLayerColor.CGColor;

}

- (void)loadInTrack
{
    CGFloat c = MIN(self.frame.size.width, self.frame.size.height) / 2.0;
    
    CGPoint center = CGPointMake(c, c);
    
    _trackPath = [UIBezierPath bezierPathWithArcCenter:center radius:(self.bounds.size.width - _progressWidth)/ 2 - 8
                                            startAngle:DEGREES_TO_RADIANS(_startAngle + 180)
                                              endAngle:DEGREES_TO_RADIANS(_endAngle + 180) clockwise:YES];
    
    
    _inTrackLayer.path = _trackPath.CGPath;
    
//    _inTrackLayer.strokeColor = kRGBAColor(193, 193, 193, 1.0).CGColor;
    
    _inTrackLayer.strokeColor = _inTrackLayerColor.CGColor;

}

//加载前景圆弧
- (void)loadProgress
{
    float angle = [self setAngleForValue];
    
    CGFloat c = MIN(self.frame.size.width, self.frame.size.height) / 2.0;
    
    CGPoint center = CGPointMake(c, c);
    
    _progressPath = [UIBezierPath bezierPathWithArcCenter:center radius:(self.bounds.size.width - _progressWidth)/ 2
                                               startAngle:DEGREES_TO_RADIANS(_startAngle + 180)
                                                 endAngle:angle clockwise:YES];
    
    _progressLayer.path = _progressPath.CGPath;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    pathAnimation.duration = _duration;
    
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    
    [_progressLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
}

//传递参数值 属性值设置
- (void)setValueWithMax:(float)maxValue
               minValue:(float)minValue
           currentValue:(float)currentValue
          progressWidth:(float)width
               itemUnit:(NSString *)unit
               title:(NSString *)title
{
    if([title isEqualToString:@"血糖值(空腹)"] && currentValue != 0){
        _currentLabel.format = @"%.1f";
    }
    else{
        _currentLabel.format = @"%.0f";
    }
    
    if(minValue > maxValue){
        
        _maxValue = minValue;
        
        _minValue = maxValue;
    }
    else{
        _maxValue = maxValue;
        
        _minValue = minValue;
    }
    
    _currentValue = currentValue;
    
    _progressWidth = width;
    
//    _trackLayer.lineWidth = _progressWidth / 3;
    
//    _progressLayer.lineWidth = _progressWidth;
    _progressLayer.lineWidth = _progressWidth-1;

    _currentTitle.text = title;
    
    _itenUnit.text = unit;
    
    _trackLayer.lineWidth = width;
    
    [self calculateTime];
}

//计算当前值对应在圆弧中的角度
- (float)setAngleForValue
{
    if(_currentValue > _maxValue){
        _supValue = _maxValue;
    }
    else{
        _supValue = _currentValue;
    }
    float ratio = (_supValue - _minValue) / (_maxValue - _minValue);
    
    float angle = DEGREES_TO_RADIANS(_startAngle + (_endAngle - _startAngle) * ratio + 180);
    
    return angle;
}

//计算圆弧转动的持续时间
- (void)calculateTime
{
    _duration = (_currentValue - _minValue) / (_maxValue - _minValue) / kSpeed;
    
    [self loadProgress];
    
    [self setValue];
}

- (void)setValue
{
    _mimLabel.text = [NSString stringWithFormat:@"%.0f",_minValue];
    
    _maxLabel.text = [NSString stringWithFormat:@"%.0f",_maxValue];
    
    _currentLabel.textColor = _progressColor;
     
    [_currentLabel countFrom:0 to:_currentValue withDuration:_duration];
    _currentLabel.hidden=YES;

}

- (void)setTrackColor:(UIColor *)trackColor
{
    _trackLayer.strokeColor = trackColor.CGColor;
}

- (void)setProgressColor:(UIColor *)progressColor
{
    _progressLayer.strokeColor = progressColor.CGColor;
    
    _currentLabel.textColor = progressColor;
    
    _mimLabel.textColor = progressColor;
    
    _maxLabel.textColor = progressColor;
    
//    _currentTitle.textColor = progressColor;
    
    _itenUnit.textColor = progressColor;
}

@end
