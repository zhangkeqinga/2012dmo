//
//  NotificationInfoController.m
//  Bull
//
//  Created by mac on 15/7/5.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "NotificationInfoController.h"
#import "NotificationModel.h"
#import "NotificationCell.h"

@interface NotificationInfoController ()
{
    NSMutableArray *tableData;  //tableView数据存放数组
    NSInteger indexNum;
    
}

@end

@implementation NotificationInfoController

@synthesize tableView=_tableView;
@synthesize tableArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        tableData = [[NSMutableArray alloc] init];
        
        self.tabBarController.tabBar.hidden=YES;

        
    }
    return self;
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden=YES;
    indexNum = -1;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarController.tabBar.hidden=YES;
    self.title=@"消息中心";
    
    [self createUserData];
    [self initTableView];
    
}


-(void)initTableView{
    CGRect frame = self.view.frame;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height)];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor=[UIColor clearColor];
    
    
    UIImageView *verticalImg = [[UIImageView alloc] init];
    verticalImg.image=[UIImage imageNamed:@"thin_vertical_separator@2x.png"];
    [_tableView addSubview:verticalImg];
    verticalImg.frame=CGRectMake(22, 0, 1, 900);
    
   
    [self.view addSubview:_tableView];
    
}


//我需要一点测试数据，直接复制老项目东西
-(void)createUserData{
    
    NotificationModel *user = [[NotificationModel alloc] init];
    [user setTitles:@"系统消息"];
    [user setIntroduction:@"高收益高收益高收益高收益高收益高收益高收益高收益"];
    [user setImagePath:@"panghu.jpg"];
    
    NotificationModel *user2 = [[NotificationModel alloc] init];
    [user2 setTitles:@"系统消息"];
    [user2 setIntroduction:@"高收益高收益高收益高收益高收益益高收益高收益高收益"];
    [user2 setImagePath:@"duolaameng.jpg"];
    
    NotificationModel *user3 = [[NotificationModel alloc] init];
    [user3 setTitles:@"回款消息"];
    [user3 setIntroduction:@"高收益高收益高收益高收益高收益益高收益高收益高收益"];
    [user3 setImagePath:@"daxiong.jpg"];
    
    [tableData addObject:user];
    [tableData addObject:user2];
    [tableData addObject:user3];
    
}


#pragma mark- UITableView dataSource and delegate methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //指定cellIdentifier为自定义的cell
    static NSString *CellIdentifier = @"Cell";
    //自定义cell类
    NotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[NotificationCell alloc] initWithReuseIdentifier:CellIdentifier];
    }
    
    NotificationModel * user = [tableData objectAtIndex:indexPath.row];
    cell.titles.text = user.titles;
//    [cell.typeImage setImage:[UIImage imageNamed:user.imagePath]];
    [cell setIntroductionText:user.introduction];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor clearColor];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexNum == indexPath.row) {
        
        NotificationCell *cell = (NotificationCell *)[self tableView:_tableView cellForRowAtIndexPath:indexPath];
        
        return cell.frame.size.height;

    }else{
        
        return 80;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    if (indexNum ==indexPath.row) {
        indexNum=-1;
    }else{
        indexNum =indexPath.row;
    }
    
    [tableView beginUpdates];
    [tableView endUpdates];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
