//
//  GrayPageControl.m
//  Bull
//  http://blog.csdn.net/zcl369369/article/details/7341090
//  Created by Dong on 15/6/20.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "GrayPageControl.h"

@implementation GrayPageControl
//-(id) initWithCoder:(NSCoder *)aDecoder

//{

//    self = [super initWithCoder:aDecoder];

//

//    activeImage = [[UIImage imageNamed:@"RedPoint.png"] retain];

//    inactiveImage = [[UIImage imageNamed:@"BluePoint.png"] retain];

//

//    return self;

//}

-(id) initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    activeImage = [UIImage imageNamed:@"image2@2x.jpg"] ;
    inactiveImage = [UIImage imageNamed:@"image3@2x.jpg"];
    
    
    return self;
    
}

-(void) updateDots

{
    
    for (int i = 0; i < [self.subviews count]; i++)
        
    {
        
        UIImageView* dot = [self.subviews objectAtIndex:i];
        
        if (i == self.currentPage) dot.image = activeImage;
        
        else dot.image = inactiveImage;
        
    }
    
}

-(void) setCurrentPage:(NSInteger)page

{
    
    [super setCurrentPage:page];
    
    [self updateDots];
    
}@end
