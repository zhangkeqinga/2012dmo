//
//  PointApplyInfoCommitController.h
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  提交

#import "BasedAFNetworkController.h"

@interface PointApplyInfoCommitController : BasedAFNetworkController
<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>


@property (strong, nonatomic) IBOutlet UITableView *v_tableView;
@property (strong, nonatomic) NSMutableArray *tableArray;

@end
