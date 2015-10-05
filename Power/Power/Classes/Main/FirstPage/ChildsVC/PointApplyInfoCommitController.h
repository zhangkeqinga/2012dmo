//
//  PointApplyInfoCommitController.h
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  预约专家

#import "BasedAFNetworkController.h"
#import "AppointMode.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <ImageIO/ImageIO.h>

#import "AFURLResponseSerialization.h"
#import "AFSecurityPolicy.h"

@interface PointApplyInfoCommitController : BasedAFNetworkController
<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UITableView *v_tableView;
@property (strong, nonatomic) NSMutableArray *tableArray;
@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) AppointMode *appointModel;
@property (strong, nonatomic) DoctorModel *doctorModel;

- (void)withMangerDic:(NSDictionary *)doctordic_;
- (void)withMangerInfo:(NSString*)title;

@end
