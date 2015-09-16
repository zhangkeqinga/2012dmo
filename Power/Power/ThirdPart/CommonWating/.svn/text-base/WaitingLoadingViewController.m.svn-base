//
//  WaitingLoadingViewController.m
//  YTongExpress
//
//  Created by Kang Pengcheng on 13-1-8.
//  Copyright (c) 2013年 wuxiaozhen. All rights reserved.
//

#import "WaitingLoadingViewController.h"

@interface WaitingLoadingViewController ()

@end

@implementation WaitingLoadingViewController
@synthesize activityIndicator;
@synthesize activityImage;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight);
  
//    RoundedImgClass *imgRound=[[RoundedImgClass alloc]initWithFrame:CGRectMake(0, 0, 100, 60)];
//    imgRound.backgroundColor=[UIColor blackColor];
//    imgRound.alpha= 0.7;
//    
//    self.view.backgroundColor=[UIColor clearColor];
//    [self.view addSubview:imgRound];
//    imgRound.center=self.view.center;
//    
//    activityIndicator.center = self.view.center;
//    
//    [self.view sendSubviewToBack:imgRound];
    
    activityIndicator.center = self.view.center;
    activityImage.center = self.view.center;


}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) hiddenWaitingLoadingView
{

    [UIView animateWithDuration:0.3
                     animations:^{
                         self.view.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         [self.view removeFromSuperview];
                     }];
}

@end
