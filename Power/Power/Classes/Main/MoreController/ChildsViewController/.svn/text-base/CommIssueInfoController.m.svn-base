//
//  CommIssueInfoController.m
//  Bull
//
//  Created by mac on 15/7/18.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "CommIssueInfoController.h"

#define testString  [NSString stringWithFormat:@"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试"]

@interface CommIssueInfoController ()
{
    NSInteger indexNum;
    
}
@end

@implementation CommIssueInfoController

@synthesize v_tableView;
@synthesize tableArray;


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden=YES;

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarController.tabBar.hidden=YES;
    self.title=@"";
    
    indexNum=-1;
    
    [self initTableView];
    
}

- (void)initTableView{
    
    
    self.v_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    self.v_tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    self.v_tableView.delegate=self;
    self.v_tableView.dataSource=self;
    self.v_tableView.tableHeaderView.backgroundColor=[UIColor clearColor];
    
    [self.view addSubview:self.v_tableView];
    self.v_tableView.backgroundColor=COLOR(234, 233, 239, 1);
    
}

//
- (void)withTableDataArray:(NSDictionary *)dic_{
    
    self.tableArray = [NSArray array];
    
    if ([[dic_ allKeys] containsObject:@"Problem"]){
        self.tableArray =[dic_ objectForKey:@"Problem"];
//        [self.v_tableView reloadData];

    }
    
}

#pragma mark- UITableView dataSource and delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [self.tableArray count] ;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (indexNum>=0 && indexNum == section) {
        return 2;
    }else{
        return 1;
    }
    
}

#define leftRedLine 15 
#define leftRedLineWidth 3 
#define leftLabel  12

- (NSString *)getStringWithArray:(NSArray *)array_ wihtKey:(NSString *)key_ wihtindex:(NSInteger)index_{
    
    NSString *string=[NSString string];
    if ([array_ count]>index_) {
        NSDictionary *dics_= [array_ objectAtIndex:index_];
        if ([[dics_ allKeys] containsObject:key_]){
            string =[dics_ objectForKey:key_];
        }
    }
    
    return  string;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexNum>=0 && indexNum == indexPath.section && indexPath.row==1) {
    
        NSString *string=[NSString string];
        
        string = [self getStringWithArray:self.tableArray wihtKey:@"answers" wihtindex:indexPath.section];
        
        CGSize sizeFrame = [UnitPath calculateFrameWithContent:string withWidth:ScreenWidth- leftRedLine-leftRedLineWidth-leftLabel-15  withFont:15];
        
        return 20+sizeFrame.height;

    }else{
        
        NSString *string=[NSString string];
        string = [self getStringWithArray:self.tableArray wihtKey:@"problems" wihtindex:indexPath.section];
        
        CGSize sizeFrame = [UnitPath calculateFrameWithContent:string withWidth:ScreenWidth- leftRedLine-leftRedLineWidth-leftLabel-15  withFont:15];

        return 20+sizeFrame.height;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexNum>=0 && indexNum == indexPath.section && indexPath.row==1) {
        
        
        
        NSString *string=[NSString string];
        string = [self getStringWithArray:self.tableArray wihtKey:@"answers" wihtindex:indexPath.section];
        
        CGSize sizeFrame = [UnitPath calculateFrameWithContent:string withWidth:ScreenWidth- leftRedLine-leftRedLineWidth-leftLabel-15  withFont:15];
        UITableViewCell *cell1  =[[UITableViewCell alloc]init];
        cell1.frame=CGRectMake(0, 0, ScreenWidth, 20+sizeFrame.height);
        
        
        UILabel *label1=[[UILabel alloc]init];
        label1.font=[UIFont systemFontOfSize:14.0];
        label1.text=string;
        label1.numberOfLines=50;
        [cell1 addSubview:label1];
        
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cell1).with.offset(10);
            make.left.equalTo(cell1).with.offset(10);
            make.right.equalTo(cell1).with.offset(-10);
            make.bottom.equalTo(cell1).with.offset(-10);
            
        }];
        
        return cell1;
 
    }else{

    
    UITableViewCell *cell1  =[[UITableViewCell alloc]init];
    
    UIView *svb = [UIView new];
    svb.backgroundColor = COLOR(234, 233, 239, 1);
    [cell1 addSubview:svb];
    
    [svb mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(cell1).with.offset(0);
        make.right.equalTo(cell1).with.offset(0);
        make.bottom.equalTo(cell1).with.offset(1);
        make.height.mas_equalTo(1);
        
    }];
    
    
    UIView *sv1 = [UIView new];
    sv1.backgroundColor = [UIColor redColor];
    [cell1 addSubview:sv1];
    
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(cell1).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
        //* 等价于
         make.top.equalTo(cell1).with.offset(12);
         make.left.equalTo(cell1).with.offset(leftRedLine);
         make.width.mas_equalTo(leftRedLineWidth);
         make.height.mas_equalTo(16);
         //*/
        
        /* 也等价于
         make.top.left.bottom.and.right.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
         */
    }];
    
    
    NSString *string=[NSString string];
    string = [self getStringWithArray:self.tableArray wihtKey:@"problems" wihtindex:indexPath.section];

    UILabel *label=[[UILabel alloc]init];
    label.font=[UIFont systemFontOfSize:14.0];
    label.text=string;
    label.numberOfLines=50;
    [cell1 addSubview:label];
    
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell1).with.offset(10);
        make.left.equalTo(sv1).with.offset(leftLabel);
        make.right.equalTo(cell1).with.offset(-10);
        make.bottom.equalTo(cell1).with.offset(-10);
        
    }];
    
    return cell1;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.v_tableView deselectRowAtIndexPath:[self.v_tableView indexPathForSelectedRow] animated:YES];
    
    if (indexNum == indexPath.section) {
        indexNum=-1;
    }else{
        indexNum=indexPath.section;
    }
    
    [self.v_tableView reloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
