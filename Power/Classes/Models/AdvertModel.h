//
//  AdvertModel.h
//  Bull
//
//  Created by mac on 15/7/23.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdvertModel : NSObject

@property(nonatomic,strong)NSString *i_id;//(广告id)、
@property(nonatomic,strong)NSString *imageUrl;//(图片地址)
@property(nonatomic,strong)NSString *imageLabel;//(图片标签),
@property(nonatomic,strong)NSString *startDate;//(活动开始时间)
@property(nonatomic,strong)NSString *endDate;//(活动结束时间)
@property(nonatomic,strong)NSString *linkUrl;//(网页地址)


@end
