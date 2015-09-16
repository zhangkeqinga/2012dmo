//
//  Utils_URL.h
//  Bull
//
//  Created by Dong on 15-3-20.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#ifndef Bull_Utils_URL_h
#define Bull_Utils_URL_h

#define AS_Login_Service @"http://58.32.246.78:8380"  // 正式环境


//测试ip
//#define headUrltest @"http://192.168.1.104:8080"
//#define headUrltest @"http://120.26.67.238"  //
#define headUrltest @"http://www.jinbull.com"  //

//#define headUrltest @"http://192.168.1.105:8080"  //

//生产ip
#define headUrl @"http://120.26.67.38"


#pragma mark--版本信息
#define versionFresh [NSString stringWithFormat:@"%@/jinbull/app_info.do?",headUrltest]

//6：	app更新接口：http://www.jinbull.com/jinbull/app/info.do?
//参数: device(设备类型android或者ios) 第6个接口
//返回结果： id(id)、appInfo(app描述)、appVersion(app版本号)、appType(app类型ios\android)、
//appIsUpdate(是否强制更新、1强制；0不强制)、appDownloadUrl(app下载地址)、appBuild(app小版本号)
#define versionFresh1 [NSString stringWithFormat:@"%@/jinbull/app/info.do?",headUrltest]


#pragma mark--个人信息
//参数：phone  第2个接口
#define isRegester [NSString stringWithFormat:@"%@/jinbull/users/is_regist.do?",headUrltest]
//登陆 参数：phone、password、logindevice  第1个接口
#define loginURL   [NSString stringWithFormat:@"%@/jinbull/users/login.do?",headUrltest]
//注册接口： //参数phone、password、vetiryCode  第3个接口
#define regester   [NSString stringWithFormat:@"%@/jinbull/users/regist.do?",headUrltest]
//参数phone、password、confirmPwd、vetiryCode  第5个接口
#define forgetPSW  [NSString stringWithFormat:@"%@/jinbull/users/forget_pwd.do?",headUrltest]
//更新密码接口 //参数phone、oldpwd、password、confirmPwd 第4个接口
#define changePSW  [NSString stringWithFormat:@"%@/jinbull/users/update_pwd.do?",headUrltest]

//获取短信验证码  第11个接口
#define smsVerification  [NSString stringWithFormat:@"%@/jinbull/sms/auth_code.do?",headUrltest]

#pragma mark--银行卡信息
//参数：uid  phone  第7个接口
#define bankList    [NSString stringWithFormat:@"%@/jinbull/bank/list.do?",headUrltest]
//参数：uid、phone、bankCard、 bankName、 bankUserName、 bankUserPhone、 bankIdCard   第8个接口
#define bankAdd     [NSString stringWithFormat:@"%@/jinbull/bank/add.do?",headUrltest]
//参数：id、phone 第9个接口
#define bankRemove  [NSString stringWithFormat:@"%@/jinbull/bank/remove.do?",headUrltest]
//参数：id、phone、bankAddress、bankBranch  10 更新开户行
#define bankInfoFresh    [NSString stringWithFormat:@"%@/jinbull/bank/modify_opening.do?",headUrltest]

//id(银行卡id, 即bank_id)、phone  12 查询银行卡开户行信息
//id(银行卡id), uid(用户uid),
//bankCard(银行卡号),
//bankName(银行卡名称)，
//bankUserName(银行卡用户名称)
//bankAddress(开户行省市),
//bankBranch(开户支行)
#define bankSingleInfo    [NSString stringWithFormat:@"%@/jinbull/bank/getById.do?",headUrltest]
//参数：phone(手机号)、bankCard（银行卡帐号）  //13：	识别银行卡类型   等待后台修改
#define bankTypeUrl    [NSString stringWithFormat:@"%@/jinbull/bank/discern.do?",headUrltest]

#pragma mark--我的资产
//我的资产  14:
//参数：uid(用户id)、phone(手机号)
//返回结果：uid、idCard(身份证id)、phone(手机号)、user(用户姓名)、totalBuyMoney(已购总金额)、
//dayIncomes(当日收益)、totalIncomes(累计收益)、totalWealth(总资产)
#define myassetsUrl  [NSString stringWithFormat:@"%@/jinbull/deal/my.do?",headUrltest]

//资产明细  15:
//参数：uid(用户id)、phone(手机号)、offset(当前查看的记录条数)
//返回结果：id(交易记录id)、buyMoney(本金)、pIns(本息)、incomes(当前累计收益)、endIncomes(到期日累计收益)、
//repaymentStatus(还款状态)、contractCode(合同编号)、payType(支付方式)、productName(产品名称)、
//productId(产品id)、productRate(产品利率)、productRateStr(产品利率百分比表示)、startDate(用户起息日)、endDate(到期日)
#define myassetsInfoUrl  [NSString stringWithFormat:@"%@/jinbull/deal/detail.do?",headUrltest]


// 需要打马赛克
//18:	产品申购记录：http://www.jinbull.com/jinbull/deal/list.do?
//参数：productId(产品id)、offset(当前查看的记录条数)
//返回结果：id(交易记录id)、phone(手机号)、buyMoney(购买金额)、createTime(购买时间)
#define allPeopleBuyUrl  [NSString stringWithFormat:@"%@/jinbull/deal/list.do?",headUrltest]


//收益明细 20  日收益
//参数：uid、phone、offset(当前已加载的记录条数)
//返回结果：date(日期)， dayIncome(日收益)，list{productId(产品id), productName(产品名字), income(产品收益)}
#define incomeUrl  [NSString stringWithFormat:@"%@/jinbull/deal/income.do?",headUrltest]

//交易记录 购买记录 16:
//参数：uid(用户id)、phone(手机号)、offset(当前已加载的记录条数)
//返回结果：id(交易记录id)、buyMoney(本金)、repaymentType(还款状态)、repaymentTypeStr(还款状态说明)、
//buyDate(合同编号)、payType(支付方式)、productName(产品名称)、buyStatus(交易状态)、buyStatusStr(交易状态说明)
//productId(产品id)、productRate(产品利率)、productRateStr(产品利率百分比表示)、startDate(用户起息日)、endDate(到期日)
#define buyProductListUrl  [NSString stringWithFormat:@"%@/jinbull/deal/deal.do?",headUrltest]

//还款记录 21
//参数：uid、phone、offset(当前查看的记录条数)  /repayment/list.do?
//返回结果：id(还款记录id), productName(产品名称) money(本息), status(状态), date(还款时间)
#define repaymentUrl  [NSString stringWithFormat:@"%@/jinbull/repayment/list.do?",headUrltest]

//产品申购记录条数
//参数：productId(产品id)
//返回结果：已经申购的人数
#define productBuyNumUrl  [NSString stringWithFormat:@"%@/jinbull/deal/count.do?",headUrltest]

//产品申购记录
//参数：productId(产品id)、offset(当前查看的记录条数)
//返回结果：id(交易记录id)、phone(手机号)、buyMoney(购买金额)、createTime(购买时间)
#define productBuyListUrl  [NSString stringWithFormat:@"%@/jinbull/deal/list.do?",headUrltest]

//产品购买
//参数：uid(用户id)、producId(产品id)、bankId(银行卡id)、buyMoney(购买金额)
//返回结果：成功
#define buyProductUrl  [NSString stringWithFormat:@"%@/jinbull/deal/buy.do?",headUrltest]


#pragma mark - 产品- 产品

//31：  广告
//返回结果：id(广告id), imageUrl(图片地址), imageLabel(图片标签), startDate(活动开始时间), endDate(活动结束时间), linkUrl(网页地址)
#define firstPageUrl  [NSString stringWithFormat:@"%@/jinbull/app/banner.do?",headUrltest]

//25：	精品推荐
//返回结果：productId(产品id), productName(产品名称), days(产品期限), productMinAmount(起购金额), productLabel(产品标签), productRateStr(百分比利率)
//productStdLabel(标准标签)、productStdLabelUrl(标准标签图片)
#define recommendUrl  [NSString stringWithFormat:@"%@/jinbull/product/recommend.do?",headUrltest]


#pragma mark -产品列表
//22:	热卖产品：http://www.jinbull.com/jinbull/product/selling.do?
//参数：offset(当前查看的记录条数)
//返回结果：productId(产品id), productName(产品名称), days(产品期限), productMinAmount(起购金额), productLabel(产品标签), productRateStr(百分比利率)
//异常：  1：offset参数没有绑定
#define productListHotUrl  [NSString stringWithFormat:@"%@/jinbull/product/selling.do?",headUrltest]

//24:	募款完成产品：
//参数：offset(当前查看的记录条数)
//返回结果：productId(产品id), productName(产品名称), days(产品期限), productMinAmount(起购金额), productLabel(产品标签), productRateStr(百分比利率)
//异常：  1：offset参数没有绑定
#define productListFishUrl  [NSString stringWithFormat:@"%@/jinbull/product/sellout.do?",headUrltest]

//23:	还款完成产品：
//参数：offset(当前查看的记录条数)
//返回结果：productId(产品id), productName(产品名称), days(产品期限), productMinAmount(起购金额), productLabel(产品标签), productRateStr(百分比利率)
//异常：  1：offset参数没有绑定
#define productListBackUrl  [NSString stringWithFormat:@"%@/jinbull/product/repayed.do?",headUrltest]


//32 产品列表
//"newr:(新手产品列表) //selling:(热卖产品列表) //sellout:(售罄产品列表) //repay:(已经还款产品列表)
//product/list.do
#define productListAllUrl  [NSString stringWithFormat:@"%@/jinbull/product/list.do?",headUrltest]


#pragma mark -产品详情

//26：	产品基础信息：http://www.jinbull.com/jinbull/product/base.do?
//参数：productId(产品id)
//返回结果：productId(产品id), productName(产品名称), days(产品期限), productMinAmount(起购金额),
//productAvaliableAmount(可售金额)、productMount(融资金额), productRate(小数年化利率), productRateStr(百分比利率)
#define productBasedInfoUrl  [NSString stringWithFormat:@"%@/jinbull/product/base.do?",headUrltest]


//27：	产品详情：http://www.jinbull.com/jinbull/product/detail.do?
//参数：productId(产品id)
//返回结果：productId(产品id), productName(产品名称), days(产品期限), productMinAmount(起购金额),
//productAvaliableAmount(可售金额)、productMount(融资金额), productRate(小数年化利率), productRateStr(百分比利率),
//productInfo(项目描述), fundGuarantee(资金保障), borrowInfo(借款方信息), borrowId(借款方id)
//productStartDate(起息日), productEndDate(到期日), repayType(还款方式), buyCounts(申购人数),
//isOutsell, buyUserLimit, productStatus

#define productDetailUrl  [NSString stringWithFormat:@"%@/jinbull/product/detail.do?",headUrltest]

//17:	产品申购记录条数：http://www.jinbull.com/jinbull/deal/count.do?
//参数：productId(产品id) 	返回结果：已经申购的人数
#define productSellNumUrl  [NSString stringWithFormat:@"%@/jinbull/deal/count.do?",headUrltest]

//28：	项目描述详情：http://www.jinbull.com/jinbull/product/pinfo.do?
//参数：productId(产品id)
//返回结果： productInfo(项目概述), productDetailFeilds(项目详细描述字段(资金用途|还款来源)等, 以|分隔),
//productDetailInfo(项目描述相关文件图片URL(借款合同、营业执照、税务登记证、借款方公司副本)), productImage(项目描述图片
#define descriptionXMUrl  [NSString stringWithFormat:@"%@/jinbull/product/pinfo.do?",headUrltest]


//29：	资金保障详情：http://www.jinbull.com/jinbull/product/pfund.do?
//参数：productId(产品id)
//返回结果：productId(产品id), productName(产品名称), fundGuarantee(资金保障)
//fundGuaranteeDetailFeilds(资金保障详细描述：担保方式|担保方简介|资金安全⋯, 以|分隔),
//fundGuaranteeDetailInfo(资金保障详细描述, 对应描述字段, 以|分隔),
//fundGuaranteeImage(资金保障相关文件图片url(担保函、营业执照、抵达担保函、土地使用权等))
#define descriptionZZUrl  [NSString stringWithFormat:@"%@/jinbull/product/pfund.do?",headUrltest]


//30：	借款方信息：http://www.jinbull.com/jinbull/product/pborrower.do?
//参数：borrowId(借款方id)
//返回结果：id(借款方id),borrowComName(借款方公司名称),borrowComRange(借款方公司经营范围),
//borrowComInfo(借款方公司概述),borrowComDetailFields(借款方详细字段(营业执照|法人) , 以 | 分割),
//borrowComDetailInfo(借款方详细字段(营业执照|法人)详细描述 , 以 | 分割),borrowComImage(图片URL：借款方的营业执照等)
#define descriptionJKUrl  [NSString stringWithFormat:@"%@/jinbull/product/pborrower.do?",headUrltest]



// 需要token、验证token的签名信息和传入phone参数是否一致
//19:	产品购买：http://www.jinbull.com/jinbull/deal/buy.do?
//参数：uid(用户id)、producId(产品id)、bankId(银行卡id)、buyMoney(购买金额)  //返回结果：成功
#define buyUrl  [NSString stringWithFormat:@"%@/jinbull/deal/buy.do?",headUrltest]






#endif
