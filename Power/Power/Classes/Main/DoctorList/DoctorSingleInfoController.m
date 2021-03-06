//
//  DoctorSingleInfoController.m
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "DoctorSingleInfoController.h"
#import "PointApplyInfoCommitController.h"

@interface DoctorSingleInfoController ()

@property(nonatomic,strong)NSDictionary *dics;

@end

@implementation DoctorSingleInfoController
@synthesize v_tableView;
@synthesize dics;


- (void)withMangerDic:(NSDictionary *)doctordic_{
    dics = doctordic_;
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;

    self.title = @"医生介绍";
    
}
#pragma mark- viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBackItemImageAndTitle];
    
    v_tableView.tableFooterView = [[UIView alloc] init];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#define CellHight  110
#pragma mark- tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        return 0;
    }
    else if (section==1) {
        return 10;
    }
    else{
        return 10;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=COLORO(240, 240, 240);
    view.frame=CGRectMake(0, 0, ScreenWidth, 10);
    return view;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    else if (section==1) {
        return 1;
    }
    else{
        return 1;
    }
}
#pragma mark- UITableView dataSource and delegate methods


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 190;
    }
    else if (indexPath.section==1) {
        
        NSString *strings=[self.dics objectForKey:@"doctorSpecial"];
        CGSize sizeFrame = [UnitPath calculateFrameWithContent:strings];
        return 20+sizeFrame.height;
    }
    else{
        
        NSString *strings=[self.dics objectForKey:@"doctorInfo"];

        CGSize sizeFrame = [UnitPath calculateFrameWithContent:strings];
        return 20+sizeFrame.height;

    }}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];

    if (indexPath.section==0) {
        
        UIImageView *Imageback=[[UIImageView alloc]init];
        [cell addSubview:Imageback];
        Imageback.image=[UIImage imageNamed:@"背景医院.png"];
        Imageback.frame=CGRectMake(0, 0, ScreenWidth, 190);
        
        
        UIImageView *ImagePhoto=[[UIImageView alloc]init];
        [cell addSubview:ImagePhoto];
        ImagePhoto.frame=CGRectMake((ScreenWidth-100)/2, 15, 100, 100);

        NSString *stringUrl=[dics objectForKey:@"doctorImage"];
        stringUrl = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)stringUrl, nil, nil, kCFStringEncodingUTF8));
        NSURL *url =[NSURL URLWithString:stringUrl];
        [ImagePhoto sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"product_DetailInfo"]];

        
        UILabel *label=[[UILabel alloc]init];
        label.frame=CGRectMake(0, 115, ScreenWidth, 30);
        label.font=[UIFont systemFontOfSize:16];
        label.textAlignment=NSTextAlignmentCenter;
        label.text=@"姓名";
        [cell addSubview:label];
//        label.text= [self.dics objectForKey:@"name"];
        label.text= [self.dics objectForKey:@"doctorName"];

        
        UILabel *label2=[[UILabel alloc]init];
        label2.frame=CGRectMake(0, 140, ScreenWidth/2-10, 30);
        label2.font=[UIFont systemFontOfSize:14];
        label2.textAlignment=NSTextAlignmentRight;
        label2.text=@"职称";
        [cell addSubview:label2];
//        label2.text=[NSString stringWithFormat:@"%@",[self.dics objectForKey:@"position"]];
        label2.text= [self.dics objectForKey:@"doctorTitle"];


        UILabel *label1=[[UILabel alloc]init];
        label1.frame=CGRectMake(ScreenWidth/2+10, 140, ScreenWidth/2-10, 30);
        label1.font=[UIFont systemFontOfSize:14];
        label1.textAlignment=NSTextAlignmentLeft;
        label1.text=@"科室";
        [cell addSubview:label1];
//        label1.text=[NSString stringWithFormat:@"%@", [self.dics objectForKey:@"doctorSection"]];
        label1.text= [NSString stringWithFormat:@"(%@)",[self.dics objectForKey:@"doctorSection"]];
        
        
        UIButton *pointBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [cell addSubview:pointBtn];
        pointBtn.frame=CGRectMake(ScreenWidth-80, 15, 60, 26);
        [pointBtn setBackgroundImage:[UIImage imageNamed:@"12_03.png"] forState:UIControlStateNormal];
        [pointBtn setTitle:@"预约" forState:UIControlStateNormal];
        [pointBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        pointBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        
        
        [pointBtn addTarget:self action:@selector(pointDoctor:) forControlEvents:UIControlEventTouchUpInside];


        
    }else     if (indexPath.section==1) {
      
        NSString *strings=[self.dics objectForKey:@"doctorSpecial"];
        CGSize sizeFrame = [UnitPath calculateFrameWithContent:strings];

        UILabel *label=[[UILabel alloc]init];
        [cell addSubview:label];
        
        label.frame=CGRectMake(20, 0, ScreenWidth-40, 20+sizeFrame.height);
        label.numberOfLines =100;
        label.font=[UIFont systemFontOfSize:14];
        label.textAlignment=NSTextAlignmentLeft;
        label.text=@"职业医院：北京阜外心血管医院";
        label.text= [self.dics objectForKey:@"doctorSpecial"];


    }else {
        
        NSString *strings=[self.dics objectForKey:@"doctorInfo"];
        CGSize sizeFrame = [UnitPath calculateFrameWithContent:strings];

        
        UILabel *label=[[UILabel alloc]init];
        [cell addSubview:label];
        
        label.frame=CGRectMake(20, 5, ScreenWidth-40, 20+sizeFrame.height);
        label.numberOfLines =200;
        label.font=[UIFont systemFontOfSize:14];
        label.textAlignment=NSTextAlignmentLeft;
        label.text=@"医生详细介绍";
        label.text= [self.dics objectForKey:@"doctorInfo"];

    }
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    if (indexPath.row == 0){
        
        
        
    }
    
}


- (IBAction)pointDoctor:(id)sender{
    NSLog(@"预约");
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"AppointDoctor" bundle:nil];
    PointApplyInfoCommitController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"PointApplyInfoCommitController"];
    [doctor withMangerDic:self.dics];
    [doctor withMangerInfo:@"预约"];
    [self.navigationController pushViewController:doctor animated:YES];
    
}






@end
