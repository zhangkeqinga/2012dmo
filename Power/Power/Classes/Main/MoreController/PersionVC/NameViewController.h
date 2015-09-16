//
//  NameViewController.h
//  Power
//
//  Created by mac on 15/9/16.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import "BasedAFNetworkController.h"


@protocol NameViewControllerDelegate <NSObject>

- (void)nameInfo:(NSString *)name_;

@end

@interface NameViewController : BasedAFNetworkController<UITextFieldDelegate>
{
//    id <NameViewControllerDelegate> delegate;
}

@property (nonatomic,assign)id <NameViewControllerDelegate> delegate;

@end
