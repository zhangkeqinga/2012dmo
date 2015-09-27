//
//  MainViewController.h
//  Bull
//
//  Created by Grant on 15/3/19.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController

@property(nonatomic,assign) NSInteger indexNum;

- (void)loginSuccess:(BOOL)isLogin ;

- (void)selectViewController:(NSInteger)indexnumber;

@end
