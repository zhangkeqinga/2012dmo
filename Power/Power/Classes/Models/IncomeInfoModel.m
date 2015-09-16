//
//  IncomeInfoModel.m
//  Bull
//
//  Created by mac on 15/7/23.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "IncomeInfoModel.h"

@implementation IncomeInfoModel

@synthesize i_id;//(交易记录id)、
@synthesize buyMoney;//(本金)、
@synthesize pIns;//(本息)、
@synthesize incomes;//(当前累计收益)、
@synthesize endIncomes;//(到期日累计收益)、
@synthesize repaymentStatus;//(还款状态)、
@synthesize contractCode;//(合同编号)、
@synthesize payType;//(支付方式)、
@synthesize productName;//(产品名称)、
@synthesize productId;//(产品id)、
@synthesize productRate;//(产品利率)、
@synthesize productRateStr;//(产品利率百分比表示)、
@synthesize startDate;//(用户起息日)、
@synthesize endDate;//(到期日)
@synthesize productArray; //产品列表

@synthesize date;//(日期)，
@synthesize dayIncome;//


@end
