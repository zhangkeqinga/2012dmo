//
//  PointApplyInfoCommitController.m
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "PointApplyInfoCommitController.h"

@interface PointApplyInfoCommitController ()
@property(nonatomic) CGPoint point;

@end

@implementation PointApplyInfoCommitController
@synthesize v_tableView;
@synthesize point;
@synthesize tableArray;
@synthesize imageArray;
@synthesize appointModel;


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBackItemImageAndTitle];
    
    v_tableView.tableFooterView = [[UIView alloc] init];
    self.point=self.v_tableView.contentOffset;
    tableArray = [NSMutableArray array];
    imageArray = [NSMutableArray array];
    appointModel = [[AppointMode alloc]init];
    
    tableArray=[NSMutableArray arrayWithObjects:
                    @"患者姓名",
                    @"患者年龄",
                    @"手机号码",
                    @"科室",
                    @"病情描述",
                    @"添加影像图片",
//                    @"添加影像病例",
                    @"提交",
                    nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#define CellHight  110
#pragma mark- tableViewDelegate



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableArray count];
}
#pragma mark- UITableView dataSource and delegate methods


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if(indexPath.row<[tableArray count]-1){
        
        UILabel *label=[[UILabel alloc]init];
        [cell addSubview:label];
        label.frame=CGRectMake(25, 0, ScreenWidth-40, 35);
        label.font=[UIFont systemFontOfSize:14];
        label.textAlignment=NSTextAlignmentLeft;
        label.text=@"患者姓名";
        label.text=[tableArray objectAtIndex:indexPath.row];
        
        if(indexPath.row<5){

        UITextField *textField=[[UITextField alloc]init];
        textField.delegate=self;
        textField.tag=1000+indexPath.row;
        textField.frame=CGRectMake(25, 40, ScreenWidth-40, 35);
        [cell addSubview:textField];
        textField.borderStyle=UITextBorderStyleRoundedRect;
        textField.backgroundColor=COLORO(227, 228, 225);
        
        switch (indexPath.row) {
            case 0:
                textField.text = appointModel.name ;
                break;
            case 1:
                textField.text = appointModel.age ;
                break;
            case 2:
                textField.text = appointModel.phone ;
                break;
            case 3:
                textField.text = appointModel.departments ;
                break;
            case 4:
                textField.text = appointModel.illInfo;
                break;
            default:
                break;
        }
            

            
            
            
        }else{
            
            if(indexPath.row==5){
                NSInteger conditonNumber = 3;

                if (self.imageArray) {
                    if ([self.imageArray count]>0) {
                        NSInteger x = [self.imageArray count]<3 ? [self.imageArray count]:conditonNumber;
                        for (int i=0; i< x ;i++) {
                            
                            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
                            button.frame=CGRectMake(25 +i*40, 40, 35, 35);
                            button.backgroundColor=[UIColor grayColor];
                            button.alpha=0.6;
                            [button setBackgroundImage:[self.imageArray objectAtIndex:i ] forState:UIControlStateNormal];
                            [cell addSubview:button];
                            [button addTarget:self action:@selector(selectIamgeAction:) forControlEvents:UIControlEventTouchUpInside];
                        }
                    }
                    if ([self.imageArray count]<=conditonNumber-1) {
                        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
                        button.frame=CGRectMake(25 +[self.imageArray count]*40, 40, 35, 35);
                        button.backgroundColor=[UIColor grayColor];
                        button.alpha=0.6;
                        [button setTitle:@"＋" forState:UIControlStateNormal];
                        [cell addSubview:button];
                        [button addTarget:self action:@selector(selectIamgeAction:) forControlEvents:UIControlEventTouchUpInside];
                    }
            
                }
                else{
                    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
                    button.frame=CGRectMake(25 , 40, 35, 35);
                    button.backgroundColor=[UIColor grayColor];
                    button.alpha=0.6;
                    [button setTitle:@"＋" forState:UIControlStateNormal];
                    [cell addSubview:button];
                    [button addTarget:self action:@selector(selectIamgeAction:) forControlEvents:UIControlEventTouchUpInside];
                    
                }
                
                
            }
            if(indexPath.row==6){
                
                UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
                button.frame=CGRectMake(25, 40, 35, 35);
                button.backgroundColor=[UIColor grayColor];
                button.alpha=0.6;
                [button setTitle:@"＋" forState:UIControlStateNormal];
                [cell addSubview:button];

            }
            
        }
        
    }
    
//    if (indexPath.row==[tableArray count]) {
    
    else{
        
        UIButton *buttons=[UIButton buttonWithType:UIButtonTypeCustom];
        [buttons setTitle:@"提交" forState:UIControlStateNormal];
        [buttons setBackgroundImage:[UIImage imageNamed:@"button_red.png"] forState:UIControlStateNormal];
        buttons.frame=CGRectMake(20, (80-45)/2, ScreenWidth-40, 45);
        [buttons addTarget:self action:@selector(commmitAction:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview: buttons];
        
    }
    
    return cell;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
}



- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.v_tableView.contentOffset=CGPointMake(self.point.x,  self.point.y+80*(textField.tag-1000));

//        self.v_tableView.contentOffset=self.point;
        
    } completion:^(BOOL finished) {
        
        
        
    }];

}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField  {
    
    for (int i=0; i<5; i++) {
        UITextField *textField=(UITextField *)[self.view viewWithTag:1000+i];
        switch (i) {
            case 0:
                appointModel.name = textField.text;
                break;
            case 1:
                appointModel.age = textField.text;

                break;
            case 2:
                appointModel.phone = textField.text;

                break;
            case 3:
                appointModel.departments = textField.text;

                break;
            case 4:
                appointModel.illInfo = textField.text;

                break;
                
            default:
                break;
        }
        
    }

    
    return YES;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.v_tableView.contentOffset=self.point;
        
    } completion:^(BOOL finished) {
        
    }];

    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)commmitAction:(id)sender{
    
    for (int i=0; i<5; i++) {
        UITextField *textField=(UITextField *)[self.view viewWithTag:1000+i];
        [textField resignFirstResponder];

        if ([@"" isEqualToString:textField.text]) {
            
            NSString *string =[NSString stringWithFormat:@"请输入%@",[self.tableArray objectAtIndex:i]];
            AlertUtils *alert = [AlertUtils sharedInstance];
            [alert showWithText:string inView:self.view lastTime:1.0];

            return ;
        }

        if (!self.imageArray || [self.imageArray count]<=0) {
            AlertUtils *alert = [AlertUtils sharedInstance];
            [alert showWithText:@"请选择影像图片" inView:self.view lastTime:1.0];
            return ;
        
        }
        
        
        
    }

    [UIView animateWithDuration:0.3 animations:^{
        self.v_tableView.contentOffset=self.point;
        
    } completion:^(BOOL finished) {
       
        
        //test
//        [AlertUtil alertSuerAndCancelWithDelegate:@"已经成功预约" delegate:self];
        [AlertUtil alertPromptInformationWithDelegate:@"已经成功预约" delegate:self];

    }];

    
    DLog(@"提交");

}

//
//

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if(buttonIndex==1){
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"" inView:self.view lastTime:1.0];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


//选择影像
- (IBAction)selectIamgeAction:(id)sender{
    
    UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypeCamera;
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing=YES;
    picker.sourceType=sourceType;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
    
    
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    UIImage * image=[info objectForKey:UIImagePickerControllerEditedImage];
    [self performSelector:@selector(selectPic:) withObject:image afterDelay:0.1];
    
}



- (void)selectPic:(UIImage*)image
{
    
    [self.imageArray addObject:image];
    
    [self.v_tableView reloadData];

    
//    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
//    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
//    [self.view addSubview:imageView];
    
//    [self performSelectorInBackground:@selector(detect:) withObject:nil];
    
}




-(void)imagePickerControllerDIdCancel:(UIImagePickerController*)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
