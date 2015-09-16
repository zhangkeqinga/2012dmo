//
//  PersionInfoEditeVC.m
//  Power
//
//  Created by mac on 15/9/17.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import "PersionInfoEditeVC.h"

@interface PersionInfoEditeVC ()
@property (weak, nonatomic) IBOutlet UITextView *illnessInfo;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;

@end

@implementation PersionInfoEditeVC

@synthesize delegate;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.illnessInfo resignFirstResponder];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title= @"健康状况";
    [self setTitleBackItemImageAndTitle];

}


- (IBAction)commintAction:(id)sender {
    
    [self.illnessInfo resignFirstResponder];

    if ([delegate respondsToSelector:@selector(persionIllnessInfomation:)]) {
        [delegate persionIllnessInfomation:self.illnessInfo.text];
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)textViewDidBeginEditing:(UITextView *)textView{
    
    
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    
    
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return YES;

}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    return YES;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
