//
//  FirstPageViewController.h
//  Power
//
//  Created by mac on 15/9/12.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import "BasedAFNetworkController.h"

#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
#import "EScrollerView.h"
#import "AdvertModel.h"


#import "PersionInfoController.h"
#import "AppointlistController.h"



@interface FirstPageViewController : BasedAFNetworkController
<EScrollerViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *productView;
@property (strong, nonatomic) IBOutlet UITableView *v_tableView;


@end
