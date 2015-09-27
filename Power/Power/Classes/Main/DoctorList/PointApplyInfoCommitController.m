//
//  PointApplyInfoCommitController.m
//  Bull
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import "PointApplyInfoCommitController.h"

#import "AFHTTPSessionManager.h"



@interface PointApplyInfoCommitController ()
@property(nonatomic) CGPoint point;

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *age;
@property(nonatomic,strong)NSString *phone;
@property(nonatomic,strong)NSString *section;
@property(nonatomic,strong)NSString *illdesc;
@property(nonatomic,strong)NSString *time;

//@property(nonatomic,strong)NSString *name;
//@property(nonatomic,strong)NSString *name;


@end

@implementation PointApplyInfoCommitController
@synthesize v_tableView;
@synthesize point;
@synthesize tableArray;
@synthesize imageArray;
@synthesize appointModel;
@synthesize doctorModel;


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    
}


- (void)withMangerDic:(NSDictionary *)doctordic_{
    
    doctorModel = [[DoctorModel alloc]init];
    doctorModel.doctorid = [doctordic_ objectForKey:@"id"];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBackItemImageAndTitle];
    self.title = @"预约";
    
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
    
    
    //上传图片
    [self initdataImage];
    
    
//    [self initRequestPostImage];
//    [self initReq];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.v_tableView.contentOffset=self.point;
        
    } completion:^(BOOL finished) {
        
//        [AlertUtil alertPromptInformationWithDelegate:@"已经成功预约" delegate:self];
        
    }];
    
    
    DLog(@"提交");
    
}




- (void)initdataImage{
    
    
    NSDictionary *dict = @{ @"uid": [Users userId],
                            @"tid": doctorModel.doctorid,
                            @"diseaseInfo": appointModel.illInfo,
                            //                            @"diseaseImgae": @"111",
                            @"appointmentTime": [UnitPath currentDateFormater],
                            @"token": @"",
                            @"type": @"1"
                            };

    
    DLog(@" 上传影像dict = %@",dict);
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15.0;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
  
    NSString * kAccessToken = @"";
    
    [manager.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:kAccessToken] forHTTPHeaderField:kAccessToken];
    
    
    
    [manager POST:appointMentUrl parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        for (int i = 0 ; i< [self.imageArray count]; i++){
            
            UIImage *images= [self.imageArray objectAtIndex:i];
            NSData* imageData = UIImagePNGRepresentation(images);

            [formData appendPartWithFileData:imageData
                                        name:@"upload"
                                    fileName:[NSString stringWithFormat:@"image%d.png",i]
                                    mimeType:@"image/png"];
            
        }
        
        
//        [formData appendPartWithFileData:fileData
//                                    name:@"upload"
//                                fileName:@"image.png"
//                                mimeType:@"image/png"];
        
        
        
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
        DLog(@" 上传影像responseObject = %@",responseObject);
        
        if(responseObject)
        {
//            if(success == nil) return;
//            success(responseObject);
            
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        if(failure == nil) return;
//        failure(error);
    }];
    
    
}


//*
- (void)initReq{
    
    
    NSDictionary *dict = @{ @"uid": [Users userId],
                            @"tid": doctorModel.doctorid,
                            @"diseaseInfo": appointModel.illInfo,
//                            @"diseaseImgae": @"111",
                            @"appointmentTime": [UnitPath currentDateFormater],
                            @"token": @"",
                            @"type": @"1"
                            };

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestOperation *operation = [manager POST:appointMentUrl
                                           parameters:dict
                            constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                
                                
                                if (self.imageArray.count > 0) {
                                    
                                    NSObject *firstObj = [self.imageArray objectAtIndex:0];
                                    
                                    if ([firstObj isKindOfClass:[UIImage class]]) {     // 图片
                                        
                                        for(NSInteger i=0; i<self.imageArray.count; i++) {
                                            
                                            UIImage *eachImg = [self.imageArray objectAtIndex:i];
                                            
                                            NSData *eachImgData = UIImageJPEGRepresentation(eachImg, 0.5);
                                           
                                            [formData appendPartWithFileData:eachImgData name:[NSString stringWithFormat:@"img%ld", i+1] fileName:[NSString stringWithFormat:@"img%ld.jpg", i+1] mimeType:@"image/jpeg"];
                                            
                                            
                                        }
                                    }
                                }
                                
                            } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                
                                DLog(@"post Big success returnedDic=%@", responseObject);
                                
                            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                
                                DLog(@"post big file fail error=%@", error);
                                
                            }];
    
    
    
    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        
        NSLog(@"bytesWritten=%lu, totalBytesWritten=%lld, totalBytesExpectedToWrite=%lld", (unsigned long)bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
        
    }];
    

}


 
 //*/

#pragma mark- 上传影像 预约医生
- (void)initRequestPostImage{
    
    
    NSDictionary *dict = @{ @"uid": [Users userId],
                            @"tid": doctorModel.doctorid,
                            @"diseaseInfo": appointModel.illInfo,
                            @"diseaseImgae": @"111",
                            @"appointmentTime": [UnitPath currentDateFormater],
                            @"token": @"",
                            @"type": @"1"   
                            };
    
    
    DLog(@"消息dict==%@",dict);
    [self showWaitLoading];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    
    [manager POST:appointMentUrl parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * messages=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"message"] ];
        NSString * status=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"] ];
        
        if ([@"2001" isEqual:status]) { // 成功
            
            NSMutableArray * result=[responseObject objectForKey:@"result"];
            NSString *string= [NSString stringWithFormat:@"%@",result];
            
            if (result && ![@"<null>" isEqualToString:string]) {
                
                tableArray = result;
                DLog(@" tableArray= %@",tableArray);
                
                [self.v_tableView reloadData];
            }
            
        }
        else if ([@"5010" isEqual:status]) { //

            AlertUtils *alert = [AlertUtils sharedInstance];
            [alert showWithText:messages inView:self.view lastTime:1.0];
        
        }
        else{ //
            
            DLog(@" messages= %@",messages);
        }
        
        [self hideWaitLoading];
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        
        AlertUtils *alert = [AlertUtils sharedInstance];
        [alert showWithText:@"请求失败" inView:self.view lastTime:1.0];
        
        DLog(@"error＝%@", error);
        [self hideWaitLoading];
    }];
    
}







@end
