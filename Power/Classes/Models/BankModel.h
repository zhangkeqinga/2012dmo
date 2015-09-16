//
//  BankModel.h
//  Bull
//
//  Created by mac on 15/7/11.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankModel : NSObject


@property(nonatomic,strong)NSString * bankAddress;
@property(nonatomic,strong)NSString * bankBranch;
@property(nonatomic,strong)NSString * bankCard;
@property(nonatomic,strong)NSString * bankIdCard;
@property(nonatomic,strong)NSString * bankName;
@property(nonatomic,strong)NSString * bankUserName;
@property(nonatomic,strong)NSString * bankUserPhone;
@property(nonatomic,strong)NSString * createTime;
@property(nonatomic,strong)NSString * createUser;
@property(nonatomic,strong)NSString * i_id;
@property(nonatomic,strong)NSString * uid;
@property(nonatomic,strong)NSString * updateTime;
@property(nonatomic,strong)NSString * isBound;

@property(nonatomic,strong)NSString * allPermiss;
@property(nonatomic,strong)NSString * dayPermiss;


@end
