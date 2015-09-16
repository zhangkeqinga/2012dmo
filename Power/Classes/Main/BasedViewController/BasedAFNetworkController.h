//
//  BasedAFNetworkController.h
//  Bull
//
//  Created by mac on 15/7/22.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "BasedViewController.h"

@interface BasedAFNetworkController : BasedViewController
@property (nonatomic, strong) AFHTTPRequestSerializer <AFURLRequestSerialization> * requestSerializer;
@property(nonatomic,strong) NSMutableArray *tableArray;


@end
