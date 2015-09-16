//
//  ProductModel.m
//  Bull
//
//  Created by mac on 15/7/6.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel

@synthesize i_id ;//(交易记录)、
@synthesize buyMoney; //(本金)、
@synthesize repaymentType; //(还款状态)、
@synthesize repaymentTypeStr; //(还款状态说明)、
@synthesize buyDate ;//(合同编号)、
@synthesize payType ;//(支付方式)、
@synthesize productName ;//(产品名称)、
@synthesize buyStatus ;//(交易状态)、
@synthesize buyStatusStr; //(交易状态说明)
@synthesize productId ;//(产品)、
@synthesize productRate ;//(产品利率)、
@synthesize productRateStr; //(产品利率百分比表示)、
@synthesize startDate ;//(用户起息日)、
@synthesize endDate ;//(到期日)
@synthesize days;//产品期限

@synthesize productAvaliableAmount;//(可售金额)
@synthesize productMount;          //融资金额
@synthesize productInfo;//(项目描述),
@synthesize fundGuarantee   ;//(资金保障),
@synthesize borrowInfo;//(借款方信息),
@synthesize borrowId   ;//(借款方id)
@synthesize productStartDate   ;//(起息日),
@synthesize productEndDate   ;//(到期日),
@synthesize repayType   ;//(还款方式),
@synthesize buyCounts   ;//(申购人数),
@synthesize isOutsell   ;//,
@synthesize buyUserLimit   ;//,
@synthesize productStatus   ;//

@synthesize pIns;//本息
@synthesize contractCode;//(合同编号)、
@synthesize incomes;
@synthesize endIncomes;//到期累计收益
@synthesize repaymentStatus;//(还款状态)、

@synthesize phone;//(手机号)、
//@synthesize buyMoney;//(购买金额)、
@synthesize createTime;//(购买时间)

@synthesize productDetailFeilds;//(项目详细描述字段(资金用途|还款来
@synthesize productDetailInfo;//(项目描述相关文件图片URL(借款合同、
@synthesize productImage;//(项目描述图片


@synthesize fundGuaranteeDetailFeilds;//(资金保障详细描述：担保方式
@synthesize fundGuaranteeDetailInfo;//(资金保障详细描述, 对应描述字段,
@synthesize fundGuaranteeImage;//(资金保障相关文件图片url(担保函、营业执


@synthesize borrowComName;//(借款方公司名称),
@synthesize borrowComRange;//(借款方公司经营范
@synthesize borrowComInfo;//(借款方公司概述),
@synthesize borrowComDetailFields;//(借款方详
@synthesize borrowComDetailInfo;//(借款方详细
@synthesize borrowComImage;//(图片URL：借款方

@synthesize productMinAmount;  //起购

@end



//@synthesize project_;                            //
//@synthesize product_name;                          //
//@synthesize product_rate;                          //
//@synthesize product_start_date;                    //
//@synthesize partner_start_date;                    //
//@synthesize product_end_date;                      //
//@synthesize product_last_date;                     //
//@synthesize product_online_date;                   //
//@synthesize product_arrived_date;                  //
//@synthesize product_back_rate;                     //
//@synthesize product_amount;                        //
//@synthesize product_avaliable_amount;              //
//@synthesize product_min_amount;                    //
//@synthesize product_max_amount;                    //
//@synthesize product_pa_amount;                   //
//@synthesize product_stauts_code;                   //
//@synthesize product_stauts_name;                   //
//@synthesize product_set_code;                      //
//@synthesize product_set_name;                      //
//@synthesize product_type_code;                     //
//@synthesize product_type_name;                     //
//@synthesize product_order;                         //
//@synthesize product_label;                         //
//@synthesize repayment_type;                        //
//@synthesize create_time;                           //
//@synthesize create_user;                           //
//@synthesize create_user_name;                      //
//@synthesize create_ip;                             //
//@synthesize modify_time;                           //
//@synthesize modify_user;                           //
//@synthesize modify_user_name;                      //
//@synthesize modify_ip;                             //
//@synthesize product_info;                          //
//@synthesize product_detail_feilds;                 //
//@synthesize product_detail_info;                   //
//@synthesize product_image;                         //
//@synthesize fund_guarantee;                        //
//@synthesize fund_guarantee_detail_feilds;          //
//@synthesize fund_guarantee_detail_info;            //
//@synthesize fund_guarantee_image;                  //
//@synthesize borrower_;                           //
//@synthesize contract_code;                         //
//@synthesize creditor_;                           //
//@synthesize elect_contract_tmp;                    //
//@synthesize auto_online_date;                      //
//@synthesize buy_user_limit;                        //
//@synthesize is_outsell;                            //
//
