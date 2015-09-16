//
//  YearMonthPickerController.h
//  PasswordApp
//
//  Created by yto on 14-7-28.
//  Copyright (c) 2014年 yto_yewankun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MinYear  1800
#define MinMonth 1

typedef enum {
    /** 开始时间 **/
    DateTypeStart,
    /** 结束时间 **/
    DateTypeEnd
}DateType;

@class YearMonthPickerController;

@protocol YearMonthPickerControllerDelegate <NSObject>

@optional

- (void)pickerDone:(YearMonthPickerController *)viewController selectedYear:(int)year selecetedMonth:(int)month;

/**
 * 选择两个时间的回调方法
 **/

- (void)pickerDone:(YearMonthPickerController *)viewController startYear:(int)sYear startMonth:(int)sMonth endYear:(int)eYear endMonth:(int)eMonth;


/**
 * 隐藏选择器
 **/
- (void)pickerHiddenKeyboard;


@end

@interface YearMonthPickerController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>{
    
    UITextField *hiddenTextField;
    UIPickerView *picker;
    
    UIButton *startBtn;
    UIButton *endBtn;
    
    DateType dType;
    
    UILabel *mycom1;
    
    // 纪录当前选择的时间
    int startYear;
    int startMonth;
    int endYear;
    int endMonth;
}

@property (nonatomic,strong) UITextField *hiddenTextField;
@property (nonatomic,assign) id <YearMonthPickerControllerDelegate> delegate;
@property (nonatomic,assign) BOOL isShowTwoTime;

- (IBAction)clickCancel:(id)sender;
- (IBAction)clickConfirm:(id)sender;

- (void)displayView;
/**
 * 设置初始时间
 **/
- (void)setDetaultDateStart:(NSDate *)date animated:(BOOL)animated;
- (void)setDetaultDateEnd:(NSDate *)date animated:(BOOL)animated;

@end
