//
//  CheckVIewController.m
//  PowerfullDoctors
//
//  Created by mac on 15/8/26.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "CheckVIewController.h"

@interface CheckVIewController ()

@property(nonatomic) CGPoint point;

@end

@implementation CheckVIewController

@synthesize point;


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitleBackItemImageAndTitle];
    
    self.point=self.backScrollview.contentOffset;
    
    // Do any additional setup after loading the view.
}

- (IBAction)searchAction:(id)sender {
    self.searchNumber.text=@"";
    self.startTime.text=@"";
    self.endTime.text=@"";
    
    [self.searchNumber resignFirstResponder];
    [self.startTime resignFirstResponder];
    [self.endTime resignFirstResponder];

//    [AlertUtil alertSuerAndCancelWithDelegate:@"查询成功" delegate:self];
    
    
    [UIView animateWithDuration:0.3 animations:^{
    
        self.backScrollview.contentOffset=self.point;

    } completion:^(BOOL finished) {
        
        UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"PersionInfo" bundle:nil];
        MedicalViewController *friendControl = [mainStoryboard instantiateViewControllerWithIdentifier:@"MedicalViewController"];
        [self.navigationController pushViewController:friendControl animated:YES];
        

    }];

    
    //do something request
    
    
    
    
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.backScrollview.contentOffset=CGPointMake(self.point.x,  self.point.y+65*(textField.tag-1101));
        
    } completion:^(BOOL finished) {
        
    }];

    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.backScrollview.contentOffset=self.point;
        
    } completion:^(BOOL finished) {
        
    }];

    
    [textField resignFirstResponder];
    return YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
