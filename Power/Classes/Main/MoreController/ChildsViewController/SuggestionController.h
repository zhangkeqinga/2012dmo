//
//  SuggestionController.h
//  Bull
//
//  Created by mac on 15/7/5.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  意见反馈


/*
   语言的国际化 3中情况：http://www.tuicool.com/articles/eyqa2im
 
 */


//友盟的意见反馈
//#import "UMFeedback.h"

#import "BasedViewController.h"

@interface SuggestionController : BasedViewController<UITextViewDelegate>//,UMFeedbackDataDelegate>

@property(nonatomic,strong) IBOutlet UITextView * suggetTxtview;
@property(nonatomic,strong) IBOutlet UIButton * commitBtn;
@property(nonatomic,strong) NSString * stringTxt;

//@property(nonatomic,strong) UMFeedback *feedback;


@end
