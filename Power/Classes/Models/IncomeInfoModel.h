//
//  IncomeInfoModel.h
//  Bull
//
//  Created by mac on 15/7/23.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  收益明细实体类

#import <Foundation/Foundation.h>

@interface IncomeInfoModel : NSObject

@property(nonatomic,strong)NSString *date;//(日期)，
@property(nonatomic,strong)NSString *dayIncome;//

@property(nonatomic,strong)NSString *i_id;//(交易记录id)、
@property(nonatomic,strong)NSString *buyMoney;//(本金)、
@property(nonatomic,strong)NSString *pIns;//(本息)、
@property(nonatomic,strong)NSString *incomes;//(当前累计收益)、
@property(nonatomic,strong)NSString *endIncomes;//(到期日累计收益)、
@property(nonatomic,strong)NSString *repaymentStatus;//(还款状态)、
@property(nonatomic,strong)NSString *contractCode;//(合同编号)、
@property(nonatomic,strong)NSString *payType;//(支付方式)、
@property(nonatomic,strong)NSString *productName;//(产品名称)、
@property(nonatomic,strong)NSString *productId;//(产品id)、
@property(nonatomic,strong)NSString *productRate;//(产品利率)、
@property(nonatomic,strong)NSString *productRateStr;//(产品利率百分比表示)、
@property(nonatomic,strong)NSString *startDate;//(用户起息日)、
@property(nonatomic,strong)NSString *endDate;//(到期日)
@property(nonatomic,strong)NSArray  *productArray;//(到期日)


@end
