//
//  NotificationCell.h
//  Bull
//
//  Created by mac on 15/7/19.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface NotificationCell : UITableViewCell

@property(nonatomic,retain) UILabel *titles;          //标题
@property(nonatomic,retain) UILabel *introduction;  //内容
@property(nonatomic,retain) UILabel *timelabel;     //时间

@property(nonatomic,retain) UIImageView *typeImage;   //
@property(nonatomic,retain) UIImageView *verticalImg; //
@property(nonatomic,retain) UIImageView *boxImg;      //

//给用户介绍赋值并且实现自动换行
-(void)setIntroductionText:(NSString*)text;
//初始化cell类
-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier;

@end
