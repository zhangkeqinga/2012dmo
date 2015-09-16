//
//  dataModel.h
//  MDBClient
//
//  Created by YTO on 13-7-29.
//  Copyright (c) 2013年 YTO—jhony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataModel : NSObject


@property (nonatomic, retain) NSString *sendMsgType;

@property (nonatomic, retain) NSString *msgTitle;
@property (nonatomic, retain) NSString *msgContent;
@property (nonatomic, retain) NSString *createTime;

@end
