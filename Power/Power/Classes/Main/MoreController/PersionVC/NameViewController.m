//
//  NameViewController.m
//  Power
//
//  Created by mac on 15/9/16.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import "NameViewController.h"

@interface NameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;

@end

@implementation NameViewController
@synthesize delegate;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"姓名";
    [self setTitleBackItemImageAndTitle];

    // Do any additional setup after loading the view from its nib.
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    
}

- (IBAction)makeSureAction:(id)sender {
    
    [delegate nameInfo:_nameText.text];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_nameText resignFirstResponder];
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
