//
//  NavigationController.m
//  Bull
//
//  Created by Grant on 15/3/24.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    //    [bar setTranslucent:NO];
    if (iOS8) {
        bar.translucent = NO;
    }
    //    bar.translucent = NO;
    
    bar.tintColor = [UIColor whiteColor];
    bar.tintColor = [UIColor blackColor];

    //    bar.barTintColor = kRGBAColor(103, 84, 244, 1.0f);
    
//    [bar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    
    
    [bar setTitleTextAttributes:@{
                                  //                                  NSFontAttributeName : [UIFont systemFontOfSize:20],
                                  NSForegroundColorAttributeName :[UIColor blackColor]}];

    
    //    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    ////    [barItem setBackgroundImage:nil forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    ////    [barItem setBackgroundImage:nil forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    //
    //    NSDictionary *dict = @{
    ////                           UITextAttributeFont : [UIFont systemFontOfSize:23],
    ////                           UITextAttributeTextColor : [UIColor redColor],
    //                           NSShadowAttributeName : [NSValue valueWithUIOffset:UIOffsetZero]
    //                           };
    //    [barItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    //    [barItem setTitleTextAttributes:dict forState:UIControlStateHighlighted];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationBar.translucent = NO;
    
    //去掉UINavigationBar下面的一条线
    
//    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]){
//        
//        NSArray *list = self.navigationBar.subviews;
//        
//        for (id obj in list)
//        {
//            if ([obj isKindOfClass:[UIImageView class]])
//            {
//                UIImageView *imageView = (UIImageView *)obj;
//                
//                imageView.hidden = YES;
//            }
//        }
//        
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -20, 420, 64)];
////        imageView.image = [UIImage imageNamed:@"navigationbar_bg"];
//        
//        imageView.backgroundColor=COLOR(240, 243, 244, 1);
//        
//        [self.navigationBar addSubview:imageView];
//        [self.navigationBar sendSubviewToBack:imageView];
//        
//        
//    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
