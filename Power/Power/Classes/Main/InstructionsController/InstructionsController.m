//
//  InstructionsController.m
//  Bull
//
//  Created by Dong on 15/6/20.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "InstructionsController.h"

@interface InstructionsController ()

@end

@implementation InstructionsController
@synthesize delegate;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initProudctView];

}


- (void)initProudctView{
    
    QZScrollerView *scroller=[[QZScrollerView alloc]
                             initWithFrameRect:CGRectMake(0, 0, ScreenWidth, ScreenHeight)
                             ImageArray:[NSArray arrayWithObjects:@"image2@2x.jpg",@"image3@2x.jpg",@"image2@2x.jpg", nil]
                             TitleArray:[NSArray arrayWithObjects:@"1",@"2", nil]];
    scroller.delegate=self;
    
    [self.view addSubview:scroller];
    
}


-(void)QZScrollerViewDidClicked:(NSUInteger)index{
    
    if (index==800) {
        if ([delegate respondsToSelector:@selector(InstructionsDidClicked:)]) {
            [delegate InstructionsDidClicked:800];
        }

    }
    if (index==900) {
        if ([delegate respondsToSelector:@selector(InstructionsDidClicked:)]) {
            [delegate InstructionsDidClicked:900];
        }

    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
