//
//  SinglePickerVC.h
//  Power
//
//  Created by mac on 15/9/16.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#define FirstComponent 0
#define SubComponent 1
#define ThirdComponent 2

#import <UIKit/UIKit.h>

@class SinglePickerVC;

@protocol SinglePickerVCDelegate <NSObject>

@optional
/**
 * 选择
 **/

- (void)pickerDone:(SinglePickerVC *)viewController selectedString:(NSString *)selectString;

/**
 * 隐藏选择器
 **/

- (void)pickerHiddenKeyboard;

@end

@interface SinglePickerVC : UIViewController
<UIPickerViewDataSource,UIPickerViewDelegate>{
    
    UITextField *hiddenTextField;
    UIPickerView *picker;
    
    NSString  * proviceName;
    NSString  * cityName;
    NSString  * townName;
    
}

@property (nonatomic,strong) UIPickerView *picker;
@property (nonatomic,strong) UITextField *hiddenTextField;
@property (nonatomic,assign) id <SinglePickerVCDelegate> delegate;

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,retain)NSDictionary* dict;

@property(nonatomic,retain)NSArray* firstArray;



- (IBAction)clickCancel:(id)sender;    //cancel
- (IBAction)clickConfirm:(id)sender;   //sure

- (void)displayView;

/**
 * 设置初始时间段数据
 **/
- (void)setDetaultDataArray:(NSArray *)dataDic;
- (void)createTextOkButton ;


@end
