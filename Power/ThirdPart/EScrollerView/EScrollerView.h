//
//  EScrollerView.h
//  icoiniPad
//
//  Created by Ethan on 12-11-24.
//
//

#import <UIKit/UIKit.h>

@protocol EScrollerViewDelegate <NSObject>

@optional
-(void)EScrollerViewDidClicked:(NSUInteger)index;

@end

@interface EScrollerView : UIView<UIScrollViewDelegate> {
	
    CGRect viewSize;
	UIScrollView *scrollView;
	NSArray *imageArray;
    NSArray *titleArray;
    
    UIPageControl *pageControl;
    UILabel *noteTitle;
    NSInteger currentPageIndex;

    id<EScrollerViewDelegate> delegate;
    
    
    
    //
    int TimeNum;
    BOOL Tend;

    
}
@property(nonatomic,retain)id<EScrollerViewDelegate> delegate;
@property(nonatomic,retain)	UIScrollView *scrollView;

-(id)initWithFrameRect:(CGRect)rect ImageArray:(NSArray *)imgArr TitleArray:(NSArray *)titArr;

@end
