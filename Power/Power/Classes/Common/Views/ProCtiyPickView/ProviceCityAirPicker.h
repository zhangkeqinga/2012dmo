//
//  ProviceCityAirPicker.h
//  Power
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import <UIKit/UIKit.h>


#define FirstComponent 0
#define SubComponent 1
#define ThirdComponent 2

#import <UIKit/UIKit.h>

@class ProviceCityAirPicker;

@protocol ProviceCityAirPickerDelegate <NSObject>

@optional
/**
 * 选择省市
 **/

- (void)pickerTownDone:(ProviceCityAirPicker *)viewController provice:(NSString *)_provice ;
- (void)pickerTownDone:(ProviceCityAirPicker *)viewController provice:(NSString *)_provice city:(NSString *)_city;
- (void)pickerTownDone:(ProviceCityAirPicker *)viewController provice:(NSString *)_provice city:(NSString *)_city town:(NSString *)_town;

/**
 * 隐藏选择器
 **/

- (void)pickerHiddenKeyboard;

@end

@interface ProviceCityAirPicker : UIViewController

<UIPickerViewDataSource,UIPickerViewDelegate>{
    
    UITextField *hiddenTextField;
    UIPickerView *picker;
    
    NSString  * proviceName;
    NSString  * cityName;
    NSString  * townName;
    
}

@property (nonatomic,strong) UIPickerView *picker;
@property (nonatomic,strong) UITextField *hiddenTextField;
@property (nonatomic,assign) id <ProviceCityAirPickerDelegate> delegate;

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,retain)NSDictionary* dict;
@property(nonatomic,retain)NSArray* firstArray;
@property(nonatomic,retain)NSArray* secondArray;
@property(nonatomic,retain)NSArray* thirdPickerArray;
@property(nonatomic,retain)NSArray* selectArray;

@property(nonatomic,assign)NSInteger selectNum;  //1 选择省 2 选择城市 3 选择城镇


- (IBAction)clickCancel:(id)sender;    //cancel
- (IBAction)clickConfirm:(id)sender;   //sure

- (void)displayView;

/**
 * 设置初始时间段数据
 **/
- (void)setDetaultDataArray:(NSDictionary *)dataDic;
- (void)createTextOkButton ;


@end

