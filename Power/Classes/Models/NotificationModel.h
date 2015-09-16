//
//  NotificationModel.h
//  Bull
//
//  Created by mac on 15/7/19.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationModel : NSObject

@property (nonatomic,copy) NSString *titles;       //->标题
@property (nonatomic,copy) NSString *introduction; //->内容
@property (nonatomic,copy) NSString *times;    //

@property (nonatomic,copy) NSString *imagePath;    //->图片


@end
