//
//  RelationController.m
//  Bull
//
//  Created by mac on 15/7/5.
//  Copyright (c) 2015年 Grant. All rights reserved.
//  联系我们

#import "RelationController.h"

#import "RelationCell.h"
#import "RelationHeadCell.h"


@interface RelationController ()

@end

@implementation RelationController

@synthesize v_tableView;
@synthesize tableArray;


- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBarController.tabBar.hidden=YES;
    self.title=@"联系我们";
    
    tableArray = [NSArray array];
    
    [self getTableDataArray];
}

//获取联系方式
- (void)getTableDataArray{
    
    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
    tableArray = [plistDic objectForKey:@"RelationShip"];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark- UITableView dataSource and delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableArray count]+1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 160;
    }else{
        return 44;
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier1 = @"RelationHeadCell";
    static NSString *identifier2 = @"RelationCell";
    
    if (indexPath.row==0) {
        
        RelationCell *cell1 = [tableView dequeueReusableCellWithIdentifier:identifier1 forIndexPath:indexPath];
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell1;
    }else{
       
        RelationCell *cell2 = [tableView dequeueReusableCellWithIdentifier:identifier2 forIndexPath:indexPath];
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if ([tableArray count]>indexPath.row-1 ) {
            
            NSDictionary *dic_=[tableArray objectAtIndex:indexPath.row-1];
            cell2.titleImg.image = [UIImage imageNamed:[dic_ objectForKey:@"Img"]];
            cell2.titleLb.text = [dic_ objectForKey:@"Title"];

            
        }
        
        return cell2;
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.v_tableView deselectRowAtIndexPath:[self.v_tableView indexPathForSelectedRow] animated:YES];

    if (indexPath.row!=0) {
        
        if ([tableArray count]>indexPath.row-1 ) {
            
            NSDictionary *dic_=[tableArray objectAtIndex:indexPath.row-1];
            NSString *string = [dic_ objectForKey:@"Title"];
            
            NSArray *arays=[string componentsSeparatedByString:@":"];
            

            if (arays ) {
                if ([arays count]>1) {
                  
                    NSString *strings =[arays objectAtIndex:1];
                    
                    strings = [UnitPath clearsSpaceString:strings];
                    
                    if (![@"" isEqual:strings]) {
                        
                        AlertUtils *alert = [AlertUtils sharedInstance];
                        [alert showWithText:@"复制成功" inView:self.view lastTime:1.0];

                        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                        pasteboard.string = strings;

                    }
                    
                    

                    
                }
            }
            
        }

        

    }
    
    
}

@end
