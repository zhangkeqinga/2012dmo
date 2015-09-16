//
//  NotificationCell.m
//  Bull
//
//  Created by mac on 15/7/19.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "NotificationCell.h"

@implementation NotificationCell

- (void)awakeFromNib {
    // Initialization code
}


-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        [self performSelector:@selector(initLayuot) withObject:self afterDelay:0.2];
        [self initLayuot];
    }
    return self;
}


//初始化控件
-(void)initLayuot{
    self.typeImage = [[UIImageView alloc] init];
    self.typeImage.image=[UIImage imageNamed:@"infoCenter_dealMsg@2x.png"];
    [self addSubview:self.typeImage];
    
    [self.typeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.equalTo(self).with.offset(10);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(24);
    }];

    
    
    
//    self.verticalImg = [[UIImageView alloc] init];
//    self.verticalImg.image=[UIImage imageNamed:@"thin_vertical_separator@2x.png"];
//    [self addSubview:self.verticalImg];
//    
//    [self.verticalImg mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self.typeImage.mas_centerX);
//        make.top.equalTo(self).with.offset(0);
//        make.bottom.equalTo(self).with.offset(0);
//        make.width.mas_equalTo(1);
//        
//    }];

    
    self.boxImg = [[UIImageView alloc] init];
    self.boxImg.image=[UIImage imageNamed:@"infoCenter_msgFrame.png"];
    [self addSubview:self.boxImg];
    
    [self.boxImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(3);
        make.left.equalTo(self).with.offset(40);
        make.right.equalTo(self).with.offset(-10);
        make.bottom.equalTo(self).with.offset(-3);

    }];

    
    _titles = [[UILabel alloc] init];
    [self addSubview:_titles];
    
    [self.titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(11);
        make.left.equalTo(self).with.offset(66);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
        
    }];

    
    _timelabel = [[UILabel alloc] initWithFrame:CGRectMake(71, 5, 250, 40)];
    [self addSubview:_timelabel];
    _timelabel.textAlignment=NSTextAlignmentRight;
    
    [self.timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(11);
        make.right.equalTo(self).with.offset(-20);
        make.width.mas_equalTo(126);
        make.height.mas_equalTo(20);
        
    }];
    
    _introduction = [[UILabel alloc] initWithFrame:CGRectMake(5, 78, 250, 40)];
    [self addSubview:_introduction];
    
    [self.introduction mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(34);
        make.left.equalTo(self).with.offset(66);
        make.right.equalTo(self).with.offset(-20);
        make.bottom.equalTo(self).with.offset(-10);
        
    }];
    
}


//赋值 and 自动换行,计算出cell的高度
-(void)setIntroductionText:(NSString*)text{
    
    CGRect frame = [self frame];          //获得当前cell高度
    self.introduction.text = text;        //文本赋值
    self.introduction.numberOfLines = 10; //设置label的最大行数
    CGSize size = CGSizeMake(300, 1000);
    CGSize labelSize = [self.introduction.text sizeWithFont:self.introduction.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
    
    self.introduction.frame = CGRectMake(self.introduction.frame.origin.x, self.introduction.frame.origin.y, labelSize.width, labelSize.height);
    
    //计算出自适应的高度
    frame.size.height = labelSize.height+100;
    
    self.frame = frame;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
