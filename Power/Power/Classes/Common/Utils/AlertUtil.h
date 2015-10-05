//
//  AlertUtil.h
//  YTongExpress
//
//  Created by wuxiaozhen on 12/20/12.
//  Copyright (c) 2012 wuxiaozhen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertUtil : NSObject

+(void) alertPromptInformation:(NSString *) info;
+(void) alertPromptInformationWithDelegate:(NSString *) info  delegate: (id) del;

+(void) alertPromptInformationWithDelegateTag:(NSString *) info  delegate: (id) del witTag:(int)tag;


+(void) alertLoginWithDelegate:(NSString *) info  delegate: (id) del;
+(void) alertSuerAndCancelWithDelegate:(NSString *) info  delegate: (id) del;

+(void) alertSuerAndCancelWithDelegate:(NSString *) info  delegate: (id) del withTag:(NSInteger)tag_;
+(void) alertSuereAndCancelAndShowImageWithDelegate:(NSString *) info  delegate: (id) del withTag:(NSInteger)tag_;

+ (void)alertViewAutoDissmiss:(UIAlertView *)alertView  withInfo:(NSString *)infoString  delegate: (id) del;

@end
