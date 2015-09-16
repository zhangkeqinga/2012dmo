//
//  PersionInfoEditeVC.h
//  Power
//
//  Created by mac on 15/9/17.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import "BasedAFNetworkController.h"


@protocol PersionInfoEditeVCDelegate <NSObject>

- (void)persionIllnessInfomation:(NSString *)illness_;

@end

@interface PersionInfoEditeVC : BasedAFNetworkController<UITextViewDelegate>


@property (nonatomic,assign)id <PersionInfoEditeVCDelegate> delegate;


@end
