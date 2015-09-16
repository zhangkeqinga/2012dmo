//
//  ProductModel.h
//  Bull
//
//  Created by mac on 15/7/6.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductModel : NSObject

@property (nonatomic, retain) NSString *i_id ;//(交易记录id)、
@property (nonatomic, retain) NSString *buyMoney; //(本金)、
@property (nonatomic, retain) NSString *repaymentType; //(还款状态)、
@property (nonatomic, retain) NSString *repaymentTypeStr; //(还款状态说明)、
@property (nonatomic, retain) NSString *buyDate ;//(合同编号)、
@property (nonatomic, retain) NSString *payType ;//(支付方式)、
@property (nonatomic, retain) NSString *productName ;//(产品名称)、
@property (nonatomic, retain) NSString *buyStatus ;//(交易状态)、
@property (nonatomic, retain) NSString *buyStatusStr; //(交易状态说明)
@property (nonatomic, retain) NSString *productId ;//(产品id)、
@property (nonatomic, retain) NSString *productRate ;//(产品利率)、
@property (nonatomic, retain) NSString *productRateStr; //(产品利率百分比表示)、
@property (nonatomic, retain) NSString *startDate ;//(用户起息日)、
@property (nonatomic, retain) NSString *endDate ;//(到期日)

@property (nonatomic, retain) NSString *days;//产品期限
@property (nonatomic, retain) NSString *productMinAmount;//(起购金额),
@property (nonatomic, retain) NSString *productLabel;//(产品标签),
@property (nonatomic, retain) NSString *productStdLabel;//(标准标签)、
@property (nonatomic, retain) NSString *productStdLabelUrl;//(标准标签图片)

@property (nonatomic, retain) NSString *productAvaliableAmount;//(可售金额)
@property (nonatomic, retain) NSString *productMount;          //融资金额
@property (nonatomic, retain) NSString *productInfo;//(项目描述),
@property (nonatomic, retain) NSString *fundGuarantee   ;//(资金保障),
@property (nonatomic, retain) NSString *borrowInfo;//(借款方信息),
@property (nonatomic, retain) NSString *borrowId   ;//(借款方id)
@property (nonatomic, retain) NSString *productStartDate   ;//(起息日),
@property (nonatomic, retain) NSString *productEndDate   ;//(到期日),
@property (nonatomic, retain) NSString *repayType   ;//(还款方式),
@property (nonatomic, retain) NSString *buyCounts   ;//(申购人数),
@property (nonatomic, retain) NSString *isOutsell   ;//,
@property (nonatomic, retain) NSString *buyUserLimit   ;//,
@property (nonatomic, retain) NSString *productStatus   ;//

//资产明细
@property (nonatomic, retain) NSString *pIns;//本息 incomes
@property (nonatomic, retain) NSString *incomes;//累计收益
@property (nonatomic, retain) NSString *endIncomes;//到期累计收益
@property (nonatomic, retain) NSString *repaymentStatus;//(还款状态)
@property (nonatomic, retain) NSString *contractCode;//(合同编号)、
//payType(支付方式)、
//productName(产品名称)、
//productId(产品id)、
//productRate(产品利率)、
//productRateStr(产品利率百分比表示)、
//startDate(用户起息日)、
//endDate(到期日)

//返回结果：date(日期)，

@property (nonatomic, retain) NSString *phone;//(手机号)、
//@property (nonatomic, retain) NSString *buyMoney;//(购买金额)、
@property (nonatomic, retain) NSString *createTime;//(购买时间)


//@property (nonatomic, retain) NSString *productInfo;//(项目概述),
@property (nonatomic, retain) NSString *productDetailFeilds;//(项目详细描述字段(资金用途|还款来源)

@property (nonatomic, retain) NSString *productDetailInfo;//(项目描述相关文件图片URL(借款合同、营业执
@property (nonatomic, retain) NSString *productImage;//(项目描述图片

@property (nonatomic, retain) NSString *fundGuaranteeDetailFeilds;//(资金保障详细描述：担保方式
@property (nonatomic, retain) NSString *fundGuaranteeDetailInfo;//(资金保障详细描述, 对应描述字段,
@property (nonatomic, retain) NSString *fundGuaranteeImage;//(资金保障相关文件图片url(担保函、营业执



@property (nonatomic, retain) NSString *borrowComName;//(借款方公司名称),
@property (nonatomic, retain) NSString *borrowComRange;//(借款方公司经营范围),
@property (nonatomic, retain) NSString *borrowComInfo;//(借款方公司概述),
@property (nonatomic, retain) NSString *borrowComDetailFields;//(借款方详细字段(营业执照|法人) , 以 | 分割),
@property (nonatomic, retain) NSString *borrowComDetailInfo;//(借款方详细字段(营业执照|法人)详细描述 , 以 | 分割),
@property (nonatomic, retain) NSString *borrowComImage;//(图片URL：借款方的营业执照等)



@end




//@property (nonatomic, retain) NSString *project_id;
//@property (nonatomic, retain) NSString *product_name;
//@property (nonatomic, retain) NSString *product_rate;
//@property (nonatomic, retain) NSString *product_start_date;
//@property (nonatomic, retain) NSString *partner_start_date;
//@property (nonatomic, retain) NSString *product_end_date;
//@property (nonatomic, retain) NSString *product_last_date;
//@property (nonatomic, retain) NSString *product_online_date;
//@property (nonatomic, retain) NSString *product_arrived_date;
//@property (nonatomic, retain) NSString *product_back_rate;
//@property (nonatomic, retain) NSString *product_amount;
//@property (nonatomic, retain) NSString *product_avaliable_amount;
//@property (nonatomic, retain) NSString *product_min_amount;
//@property (nonatomic, retain) NSString *product_max_amount;
//@property (nonatomic, retain) NSString *product_paid_amount;
//@property (nonatomic, retain) NSString *product_stauts_code;
//@property (nonatomic, retain) NSString *product_stauts_name;
//@property (nonatomic, retain) NSString *product_set_code;
//@property (nonatomic, retain) NSString *product_set_name;
//@property (nonatomic, retain) NSString *product_type_code;
//@property (nonatomic, retain) NSString *product_type_name;
//@property (nonatomic, retain) NSString *product_order;
//@property (nonatomic, retain) NSString *product_label;
//@property (nonatomic, retain) NSString *repayment_type;
//@property (nonatomic, retain) NSString *create_time;
//@property (nonatomic, retain) NSString *create_user;
//@property (nonatomic, retain) NSString *create_user_name;
//@property (nonatomic, retain) NSString *create_ip;
//@property (nonatomic, retain) NSString *modify_time;
//@property (nonatomic, retain) NSString *modify_user;
//@property (nonatomic, retain) NSString *modify_user_name;
//@property (nonatomic, retain) NSString *modify_ip;
//@property (nonatomic, retain) NSString *product_info;
//@property (nonatomic, retain) NSString *product_detail_feilds;
//@property (nonatomic, retain) NSString *product_detail_info;
//@property (nonatomic, retain) NSString *product_image;
//@property (nonatomic, retain) NSString *fund_guarantee;
//@property (nonatomic, retain) NSString *fund_guarantee_detail_feilds;
//@property (nonatomic, retain) NSString *fund_guarantee_detail_info;
//@property (nonatomic, retain) NSString *fund_guarantee_image;
//@property (nonatomic, retain) NSString *borrower_id;
//@property (nonatomic, retain) NSString *contract_code;
//@property (nonatomic, retain) NSString *creditor_id;
//@property (nonatomic, retain) NSString *elect_contract_tmp;
//@property (nonatomic, retain) NSString *auto_online_date;
//@property (nonatomic, retain) NSString *buy_user_limit;
//@property (nonatomic, retain) NSString *is_outsell;
//
