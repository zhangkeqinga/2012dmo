//
//  InstructionsController.h
//  Bull
//
//  Created by Dong on 15/6/20.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  启动指示页面

#import <UIKit/UIKit.h>
#import "QZScrollerView.h"
@protocol InstructionsControllerDelegate <NSObject>

@optional

-(void)InstructionsDidClicked:(NSUInteger)index;

@end

@interface InstructionsController : UIViewController<QZScrollerViewDelegate>
{
    id<InstructionsControllerDelegate> delegate;

}
@property(nonatomic,retain)id<InstructionsControllerDelegate> delegate;
@end
