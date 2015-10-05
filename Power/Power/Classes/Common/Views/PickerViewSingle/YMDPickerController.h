//
//  YMDPickerController.h
//  PasswordApp
//
//  Created by yto on 14-8-5.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YearMonthPickerController.h"

@class YMDPickerController;
@protocol YMDPickerControllerDelegate <NSObject>
@optional

// 返回一个时间
- (void)pickerDone:(YMDPickerController *)viewController selectedDate:(NSDate *)time ;

// 返回一段时间
- (void)pickerDone:(YMDPickerController *)viewController selectedStartDate:(NSDate *)sDate selectedEndDate:(NSDate *)eDate;

// 隐藏键盘
- (void)pickerHiddenKeyboard;

@end

@interface YMDPickerController : UIViewController {
    UITextField *hiddenTextField;
    UIDatePicker *picker;
    
    UIButton *startBtn;
    UIButton *endBtn;
    
    DateType dType;
    NSDate *startDate;
    NSDate *endDate;
}

@property (nonatomic,strong) UITextField *hiddenTextField;
@property (nonatomic,strong) UIView *hiddenView;

@property (nonatomic,assign) id <YMDPickerControllerDelegate> delegate;
@property (nonatomic,assign) BOOL isShowTwoTime;
@property (nonatomic,strong) UIDatePicker *picker;

/**
 * 显示
 **/
- (void)displayView;

/**
 * 隐藏
 **/
- (void)hideView;

/**
 * 设置初始时间
 **/
- (void)setDateStart:(NSDate *)date animated:(BOOL)animated ;
- (void)setDateEnd:(NSDate *)date animated:(BOOL)animated   ;
@end
