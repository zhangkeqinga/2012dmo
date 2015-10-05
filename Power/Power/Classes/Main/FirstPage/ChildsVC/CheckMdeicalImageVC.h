//
//  CheckMdeicalImageVC.h
//  Power
//
//  Created by mac on 15/10/2.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import "BasedAFNetworkController.h"
#import "AFURLResponseSerialization.h"

@interface CheckMdeicalImageVC : BasedAFNetworkController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>

@property (strong, nonatomic) NSMutableArray *imageArray;

- (void)withMangerInfo:(NSString*)title;

@end
