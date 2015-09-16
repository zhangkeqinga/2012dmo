//
//  MJPasswordView.m
//  MJPasswordView
//
//  Created by tenric on 13-6-29.
//  Copyright (c) 2013年 tenric. All rights reserved.
//



#import "MJPasswordView.h"

@interface MJPasswordView()

@property (nonatomic,retain) MJPathLayer* pathLayer;


- (void) setLayerFrames;

@end

@implementation MJPasswordView
@synthesize circleRadius;
@synthesize lineWidth;

- (void) dealloc
{
    self.circleLayers = nil;
    self.circleFillColour = nil;
    self.trackingIds = nil;
    self.pathLayer = nil;
    
    [super dealloc];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    }
    return self;
}

- (void)initView {
    self.backgroundColor = [UIColor clearColor];
    
    self.pathColour = pathColours;
    self.circleFillColour = circleFillColours;
    self.circleFillColourHighlighted = circleFillColourHighlighteds;
    
    self.circleLayers = [NSMutableArray arrayWithCapacity:9];
    self.trackingIds = [NSMutableArray arrayWithCapacity:9];
    
    MJCircleLayer* circleLayer;

    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            circleLayer = [MJCircleLayer layer];
            circleLayer.passwordView = self;
            [self.circleLayers addObject:circleLayer];
            [self.layer addSublayer:circleLayer];
        }
    }
    
    self.pathLayer = [MJPathLayer layer];
    
//    self.pathLayer.backgroundColor=[UIColor redColor].CGColor;  //测试
    
    self.pathLayer.passwordView = self;
    self.pathLayer.lineWidth=self.lineWidth;

    [self.layer addSublayer:self.pathLayer];
    [self setLayerFrames];
}

- (void) setLayerFrames
{
    CGPoint point;
    MJCircleLayer* circleLayer;
    
    circleRadius=self.frame.size.width/12;

    for (int i = 0; i < 3; i++)  //圆心
    {
        for (int j = 0; j < 3; j++)
        {
            //circleRadius - circleRadius*2 circleRadius - circleRadius*2 - circleRadius
            CGFloat x = circleRadius*2+j*(circleRadius*2+circleRadius);
            CGFloat y = circleRadius*2+i*(circleRadius*2+circleRadius);
            point = CGPointMake(x, y);
            circleLayer = [self.circleLayers objectAtIndex:i*3+j];
            circleLayer.frame = CGRectMake(x, y, circleRadius*2, circleRadius*2);
//            DLog(@"pointx111=%f",point.x);
            [circleLayer setNeedsDisplay];
        }
    }
    
    self.pathLayer.frame = self.bounds;
    [self.pathLayer setNeedsDisplay];
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];

    self.isTracking = NO;
    
    UITouch* touch = [touches anyObject];
    
    self.previousTouchPoint = [touch locationInView:self];
    
    MJCircleLayer* circleLayer;
    for (int i = 0; i < 9; i++)
    {
        circleLayer = [self.circleLayers objectAtIndex:i];
        if ([self containPoint:_previousTouchPoint inCircle:circleLayer.frame])
        {
            circleLayer.highlighted = YES;
            [circleLayer setNeedsDisplay];
            self.isTracking = YES;
            [self.trackingIds addObject:[NSNumber numberWithInt:i]];
            break;
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    if (self.isTracking)
    {
        UITouch* touch = [touches anyObject];
        self.previousTouchPoint = [touch locationInView:self];
        [self.pathLayer setNeedsDisplay];
        MJCircleLayer* circleLayer;
        for (int i = 0; i < 9; i++)
        {
            circleLayer = [self.circleLayers objectAtIndex:i];
            if ([self containPoint:_previousTouchPoint inCircle:circleLayer.frame])
            {
                if (![self hasVistedCircle:i])
                {
                    circleLayer.highlighted = YES;
                    [circleLayer setNeedsDisplay];
                    [self.trackingIds addObject:[NSNumber numberWithInt:i]];
                    break;
                }
            }
        }
//        [self.pathLayer setNeedsDisplay];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    NSString* password = [self getPassword:self.trackingIds];
    
    //密码输入完毕回调
    if (password.length > kMinPasswordLength)
    {
        [self.delegate passwordView:self withPassword:password];
    }else {
        
//        AlertUtils *alert = [AlertUtils sharedInstance];
//        [alert showWithText:@"请设置4位以上的手势密码" inView:self lastTime:1.0];

    }

    [self resetTrackingState];
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    [self resetTrackingState];
}

- (BOOL)hasVistedCircle:(int)circleId
{
    BOOL hasVisit = NO;
    for (NSNumber* number in self.trackingIds)
    {
        if ([number intValue] == circleId)
        {
            hasVisit = YES;
            break;
        }
    }
    return hasVisit;
}

- (void)resetTrackingState
{
    self.isTracking = NO;
    
    MJCircleLayer* circleLayer;
    for (int i = 0; i < 9; i++)
    {
        circleLayer = [self.circleLayers objectAtIndex:i];
        if (circleLayer.highlighted == YES)
        {
            circleLayer.highlighted = NO;
            [circleLayer setNeedsDisplay];
        }
    }
    [self.trackingIds removeAllObjects];
    
    [self.pathLayer setNeedsDisplay];
}

- (BOOL)containPoint:(CGPoint)point inCircle:(CGRect)rect
{
    CGPoint center = CGPointMake(rect.origin.x+rect.size.width/2, rect.origin.y+rect.size.height/2);
    BOOL isContain = ((center.x-point.x)*(center.x-point.x)+(center.y-point.y)*(center.y-point.y)-circleRadius*circleRadius)<0;
    return isContain;
}

- (NSString*)getPassword:(NSArray*)array
{
    NSMutableString* password = [[[NSMutableString alloc] initWithCapacity:9] autorelease];
    for (int i = 0; i < [array count]; i++)
    {
        NSNumber* number = [array objectAtIndex:i];
        [password appendFormat:@"%d",[number intValue]];
    }
    return password;
}
@end
