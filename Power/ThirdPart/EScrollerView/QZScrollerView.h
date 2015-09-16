//
//  QZScrollerView.h
//  Bull
//
//  Created by Dong on 15/6/20.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GrayPageControl.h"

@protocol QZScrollerViewDelegate <NSObject>

@optional

-(void)QZScrollerViewDidClicked:(NSUInteger)index;

@end


@interface QZScrollerView : UIView<UIScrollViewDelegate>
{
    CGRect viewSize;
    UIScrollView *scrollView;
    
    NSArray *imageArray;
    NSArray *titleArray;
    UILabel *noteTitle;
    NSInteger currentPageIndex;

    UIPageControl *pageControl;
    id<QZScrollerViewDelegate> delegate;

    UIButton * noteBtn;
    UIButton * nextBtn;
}

@property(nonatomic,retain)id<QZScrollerViewDelegate> delegate;
-(id)initWithFrameRect:(CGRect)rect ImageArray:(NSArray *)imgArr TitleArray:(NSArray *)titArr;

@end
