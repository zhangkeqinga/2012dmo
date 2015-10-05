//
//  QZScrollerView.m
//  Bull
//
//  Created by Dong on 15/6/20.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "QZScrollerView.h"

#define buttonDistance  15  //左右间距
#define buttonBottom    40  //button的高度
#define bottomDistace   10  //上下间距

@implementation QZScrollerView
@synthesize delegate;

-(id)initWithFrameRect:(CGRect)rect ImageArray:(NSArray *)imgArr TitleArray:(NSArray *)titArr
{
    
    if ((self=[super initWithFrame:rect])) {
        self.userInteractionEnabled=YES;
        
        titleArray=titArr ;
        
        NSMutableArray *tempArray=[NSMutableArray arrayWithArray:imgArr];
        imageArray = [NSArray arrayWithArray:tempArray] ;
        viewSize=rect;
        
        NSUInteger pageCount=[imageArray count];
        
        scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, viewSize.size.width, viewSize.size.height)];
        scrollView.pagingEnabled = YES;
        scrollView.contentSize = CGSizeMake(viewSize.size.width * pageCount, 0);
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.scrollsToTop = NO;
        scrollView.delegate = self;
        
        
        for (int i=0; i<pageCount; i++) {
            NSString *imgURL=[imageArray objectAtIndex:i];
            UIImageView *imgView=[[UIImageView alloc] init] ;
            
            if ([imgURL hasPrefix:@"http://"]) {
                //网络图片 请使用ego异步图片库
                //[imgView setImageWithURL:[NSURL URLWithString:imgURL]];
            }
            else
            {
                UIImage *img=[UIImage imageNamed:[imageArray objectAtIndex:i]];
                [imgView setImage:img];
                
            }
            
            [imgView setFrame:CGRectMake(viewSize.size.width*i, 0,viewSize.size.width, viewSize.size.height)];
            imgView.tag=i;
            
            
            UITapGestureRecognizer *Tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imagePressed:)];
            [Tap setNumberOfTapsRequired:1];
            [Tap setNumberOfTouchesRequired:1];
            imgView.userInteractionEnabled=YES;
            [imgView addGestureRecognizer:Tap];
            
            [scrollView addSubview:imgView];
        }
        
        [scrollView setContentOffset:CGPointMake(0, 0)];
        [self addSubview:scrollView];
        
        
        //说明文字层
        UIView *noteView=[[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-buttonBottom- bottomDistace*2-30,ScreenWidth,30)];
        
        [noteView setBackgroundColor:[UIColor clearColor]];
        float pageControlWidth=(pageCount-2)*10.0f+40.f;
        float pagecontrolHeight=20.0f;
      
        pageControl=[[UIPageControl alloc]initWithFrame:
                     CGRectMake((self.frame.size.width-pageControlWidth)/2,6,
                                pageControlWidth,
                                pagecontrolHeight)];
        
        pageControl.currentPage=0;
        pageControl.numberOfPages=pageCount;
        [noteView addSubview:pageControl];
        
        noteBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        noteBtn.frame=CGRectMake(ScreenWidth*(pageCount-1)+15,
                                 ScreenHeight-buttonBottom- bottomDistace,
                                 (ScreenWidth-buttonDistance*3)/2,
                                 buttonBottom);
        
        [noteBtn setTitle:@"登陆/注册" forState:UIControlStateNormal];
        [noteBtn setBackgroundColor:[UIColor grayColor]];
        [noteBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [scrollView addSubview:noteBtn];
        noteBtn.tag=800;
        
        [noteBtn addTarget:self action:@selector(instructionLogin:) forControlEvents:UIControlEventTouchUpInside];
        
        
        nextBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        nextBtn.frame=CGRectMake(ScreenWidth*(pageCount-1)+(ScreenWidth-buttonDistance*3)/2+30,
                                 ScreenHeight-buttonBottom- bottomDistace,
                                 (ScreenWidth-buttonDistance*3)/2,
                                 buttonBottom);
        
        
        [nextBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        [nextBtn setBackgroundColor:[UIColor grayColor]];
        [nextBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [scrollView addSubview:nextBtn];
        nextBtn.tag=900;

        [nextBtn addTarget:self action:@selector(instructionLogin:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:noteView];
    }
    
    return self;
    
}


- (IBAction)instructionLogin:(id)sender{
    switch ([sender tag]) {
        case 800:  //注册
        {
            if ([delegate respondsToSelector:@selector(QZScrollerViewDidClicked:)]) {
                [delegate QZScrollerViewDidClicked:800];
            }

        }
            break;
        case 900:  //跳过
        {
            if ([delegate respondsToSelector:@selector(QZScrollerViewDidClicked:)]) {
                [delegate QZScrollerViewDidClicked:900];
            }

        }
            break;
            default:
            break;
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    currentPageIndex=page;
    pageControl.currentPage=page;

   
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView
{
    
}

- (void)imagePressed:(UITapGestureRecognizer *)sender
{
    
    if ([delegate respondsToSelector:@selector(QZScrollerViewDidClicked:)]) {
        [delegate QZScrollerViewDidClicked:sender.view.tag];
    }
}

@end
