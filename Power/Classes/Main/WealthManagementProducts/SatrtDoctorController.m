//
//  SatrtDoctorController.m
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "SatrtDoctorController.h"
#import "SartTeamInfoController.h"


@interface SatrtDoctorController ()

{
    UIPickerView *pickerView;
}
@property(nonatomic,strong)    UIPickerView *pickerView;


@end

@implementation SatrtDoctorController

@synthesize v_tableView;
@synthesize tableArray;
@synthesize selectedView;
@synthesize showView;
@synthesize pickArray;
@synthesize pickerView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tableArray=[NSMutableArray array];
    
    DoctorModel *doctors=[[DoctorModel alloc]init];
    
    doctors.doctorName=@"李建军";      //姓名
    doctors.doctorHosipital=@"合肥附属医院"; //所属医院
    doctors.doctorDepartment=@"科室:心血管科";//科室
    doctors.doctorIntroduce=@"简介:李建军，男，主任医生"; //医生介绍
    doctors.doctorSpecialty=@""; //医生特长
    doctors.typeTag=@"";         //

    
    
    
    showView=[[UIView alloc]init];
    showView.backgroundColor=[UIColor blackColor];
    showView.alpha=0.3;
    showView.frame=CGRectMake(0, 900, ScreenWidth, ScreenHeight- (self.selectedView.frame.origin.y+selectedView.frame.size.height));
    //self.selectedView.frame.origin.y+selectedView.frame.size.height
    [self.view addSubview:showView];
    
    pickArray=[NSMutableArray array];
    
    
    pickerView=[[UIPickerView alloc]initWithFrame:CGRectMake(0, ScreenHeight-325 +330, ScreenWidth, 246)];
    pickerView.delegate=self;
    pickerView.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:pickerView];



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


#define CellHight  110

#pragma mark- ScrollviewDelegate
-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    NSLog(@"index--%lu",(unsigned long)index);
}

#pragma mark- UITableView dataSource and delegate methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 4;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CellHight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    NSArray *imageArray=[NSArray arrayWithObjects:
                         @"Photo1.png",
                         @"Photo2.png",
                         @"Photo3.png",
                         @"Photo4.png",
                         nil];
    
    UIImageView *ImagePhoto=[[UIImageView alloc]init];
    [cell addSubview:ImagePhoto];
    ImagePhoto.image=[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    
    ImagePhoto.frame=CGRectMake(10, 20, 70, 70);
    

    UILabel *label=[[UILabel alloc]init];
    [cell addSubview:label];
    
    label.frame=CGRectMake(110, 18, 200, 30);
    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentLeft;
    label.text=@"徐建平";
    
    UILabel *label1=[[UILabel alloc]init];
    [cell addSubview:label1];
    label1.frame=CGRectMake(110, CellHight/2-10, 200, 30);
    label1.font=[UIFont systemFontOfSize:11];
    label1.textAlignment=NSTextAlignmentLeft;
    label1.text=@"科室: 心血管科";
    
    UILabel *labeltime=[[UILabel alloc]init];
    [cell addSubview:labeltime];
    labeltime.frame=CGRectMake(210, CellHight/2-10, 100, 30);
    labeltime.font=[UIFont systemFontOfSize:11];
    labeltime.textAlignment=NSTextAlignmentLeft;
    labeltime.text=@"职位: 主任医生";
    
    UILabel *label2=[[UILabel alloc]init];
    [cell addSubview:label2];
    label2.frame=CGRectMake(110,  CellHight/2-15+30 , 200, 30);
    label2.font=[UIFont systemFontOfSize:12];
    label2.textAlignment=NSTextAlignmentLeft;
    label2.text=@"心血管科国内前三甲";
    label2.textColor=[UIColor redColor];
    
    
    return cell;
}





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"StarDoctor" bundle:nil];
    
    SartTeamInfoController *doctor = [mainStoryboard instantiateViewControllerWithIdentifier:@"SartTeamInfoController"];
    
    [self.navigationController pushViewController:doctor animated:YES];

    
    
}

- (IBAction)action3:(id)sender {
    
    
    if (pickArray) {
        [pickArray removeAllObjects];
    }
    
    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
    pickArray = [plistDic objectForKey:@"DOCTOR_HOS"];
    
    
    [self.pickerView reloadAllComponents];
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        
        self.pickerView.frame = CGRectMake(0, ScreenHeight-325 , ScreenWidth, 246);
        
        showView.frame=CGRectMake(0, self.selectedView.frame.origin.y+selectedView.frame.size.height, ScreenWidth, ScreenHeight- (self.selectedView.frame.origin.y+selectedView.frame.size.height));
        
        
        
    } completion:^(BOOL finished) {
        
    }];
    
    


}


- (IBAction)action2:(id)sender {
   
    if (pickArray) {
        [pickArray removeAllObjects];
    }
    
    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
    pickArray = [plistDic objectForKey:@"DOCTOR_DKS"];
    
    
    [self.pickerView reloadAllComponents];
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        
        self.pickerView.frame = CGRectMake(0, ScreenHeight-325 , ScreenWidth, 246);
        
                showView.frame=CGRectMake(0, self.selectedView.frame.origin.y+selectedView.frame.size.height, ScreenWidth, ScreenHeight- (self.selectedView.frame.origin.y+selectedView.frame.size.height));
        //
        
        
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}


- (IBAction)action1:(id)sender {
    
    if (pickArray) {
        [pickArray removeAllObjects];
    }

    NSMutableDictionary *plistDic=[PathUtilities readPlistWithFile:@"PropertyList"];
    pickArray = [plistDic objectForKey:@"DOCTOR_DTC"];

    [self.pickerView reloadAllComponents];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        
        self.pickerView.frame = CGRectMake(0, ScreenHeight-325 , ScreenWidth, 246);

        showView.frame=CGRectMake(0, self.selectedView.frame.origin.y+selectedView.frame.size.height, ScreenWidth, ScreenHeight- (self.selectedView.frame.origin.y+selectedView.frame.size.height));
        //
        
        
    } completion:^(BOOL finished) {
    
    }];

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    

    
    [UIView animateWithDuration:0.3 animations:^{
        
        showView.frame=CGRectMake(0, 900, ScreenWidth, ScreenHeight- (self.selectedView.frame.origin.y+selectedView.frame.size.height));
        //
        
        self.pickerView.frame = CGRectMake(0, ScreenHeight , ScreenWidth, 246);

        
    } completion:^(BOOL finished) {
        
        showView.frame=CGRectMake(0, 900, ScreenWidth, ScreenHeight- (self.selectedView.frame.origin.y+selectedView.frame.size.height));

    }];

    
}




- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    
    
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    
    
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
}



#pragma mark - picker delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    return  10;
    
    return 0;
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    //
    UILabel *label;
    if (!view){
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
        label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
        label.textAlignment=NSTextAlignmentCenter;
        [view addSubview:label];
    }
    
    
    if([pickArray count]>row){
        
        label.text = [NSString stringWithFormat:[self.pickArray objectAtIndex:row]];
    }
    
    
    label.textColor =COLORO(0, 0, 0);
    label.font=[UIFont systemFontOfSize:20];
    label.backgroundColor=[UIColor clearColor];
    
    return view ;
    
    return nil;
}


-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0f;
}





@end
