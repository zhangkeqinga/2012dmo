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
{
    NSInteger index_;
}

@property(nonatomic) CGPoint point;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *age;
@property(nonatomic,strong)NSString *phone;
@property(nonatomic,strong)NSString *section;
@property(nonatomic,strong)NSString *illdesc;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSMutableArray * images;
@property(nonatomic,strong)UIActionSheet * myActionSheet;
@property(nonatomic,strong)UIView *showimageView;

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
@synthesize images;
@synthesize myActionSheet;
@synthesize showimageView;


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setTitleBackItemImageAndTitle];
    self.tabBarController.tabBar.hidden=YES;
    
}


- (void)withMangerDic:(NSDictionary *)doctordic_{
    
    doctorModel = [[DoctorModel alloc]init];
    doctorModel.doctorid = [doctordic_ objectForKey:@"id"];
    
}

- (void)withMangerInfo:(NSString*)title;
{
    self.title = title;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleBackItemImageAndTitle];
//    self.title = @"预约";
    
    v_tableView.tableFooterView = [[UIView alloc] init];
    self.point=self.v_tableView.contentOffset;
    tableArray = [NSMutableArray array];
    imageArray = [NSMutableArray array];
    appointModel = [[AppointMode alloc]init];
    
    index_ = -1;
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


//scrollview 滑动的时候取消键盘的高度
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    for (int i = 0 ; i< 5; i++ ) {
        UITextField *textField= (UITextField *)[self.view viewWithTag:1000+i];
        [textField resignFirstResponder];
        
    }

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
                textField.keyboardType = UIKeyboardTypeNumberPad;

                break;
            case 2:
                textField.text = appointModel.phone ;
                textField.keyboardType = UIKeyboardTypeNumberPad;
                
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
                
                NSInteger conditonNumber = 3;  //限制图片的个数

                if (self.imageArray) {
                    
                    if ([self.imageArray count]>0) {
                       
                        NSInteger x = [self.imageArray count]<3 ? [self.imageArray count]:conditonNumber;
                        for (int i=0; i< x ;i++) {
                            
                            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
                            button.frame=CGRectMake(25 +i*50, 38, 45, 45);
                            button.backgroundColor=[UIColor grayColor];
                            button.alpha=0.6;
                            [button setBackgroundImage:[self.imageArray objectAtIndex:i ] forState:UIControlStateNormal];
                            [cell addSubview:button];
                            button.tag = i ;
                            [button addTarget:self action:@selector(deleteIamgeAction:) forControlEvents:UIControlEventTouchUpInside];
                        }
                    }
                    
                    if ([self.imageArray count]<=conditonNumber-1) {
                        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
                        button.frame=CGRectMake(25 +[self.imageArray count]*50, 38, 45, 45);
                        button.backgroundColor=[UIColor grayColor];
                        button.alpha=0.6;
                        [button setTitle:@"＋" forState:UIControlStateNormal];
                        [cell addSubview:button];
                        [button addTarget:self action:@selector(selectIamgeAction:) forControlEvents:UIControlEventTouchUpInside];
                        
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
        buttons.frame=CGRectMake(25, (80-45)/2, ScreenWidth-45, 33);
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


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
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




// 添加所有的手势
- (void) addGestureRecognizerToView:(UIView *)view
{
    // 旋转手势
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateView:)];
    [view addGestureRecognizer:rotationGestureRecognizer];
    
    // 缩放手势
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [view addGestureRecognizer:pinchGestureRecognizer];
    
    // 移动手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [view addGestureRecognizer:panGestureRecognizer];
}

// 处理旋转手势
- (void) rotateView:(UIRotationGestureRecognizer *)rotationGestureRecognizer
{
    UIView *view = rotationGestureRecognizer.view;
    if (rotationGestureRecognizer.state == UIGestureRecognizerStateBegan || rotationGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformRotate(view.transform, rotationGestureRecognizer.rotation);
        [rotationGestureRecognizer setRotation:0];
    }
}

// 处理缩放手势
- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    UIView *view = pinchGestureRecognizer.view;
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        pinchGestureRecognizer.scale = 1;
    }
}

// 处理拖拉手势
- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer
{
    UIView *view = panGestureRecognizer.view;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [panGestureRecognizer translationInView:view.superview];
        [view setCenter:(CGPoint){view.center.x + translation.x, view.center.y + translation.y}];
        [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
    }
}


#pragma mark - deleteIamgeAction 删除影像

- (IBAction)deleteIamgeAction:(id)sender{
    
    index_ = [sender tag];
    
//    [AlertUtil alertSuerAndCancelWithDelegate:@"删除影像" delegate:self withTag:2000];
    
    [AlertUtil alertSuereAndCancelAndShowImageWithDelegate:@"删除/预览影像" delegate:self withTag:2000];
    
}

//
//

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (alertView.tag == 2000){  //删除影像
        if(buttonIndex==0){
            
        }
        if(buttonIndex==1){
            
            if (showimageView) {
                [showimageView removeFromSuperview];
                showimageView = nil;
            }
            
            showimageView = [[UIView alloc]init];
            showimageView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            [self.view addSubview:showimageView];
            showimageView.backgroundColor = [UIColor clearColor];
            
            UIImageView *backImage = [[UIImageView alloc]init];
            backImage.image = [UIImage imageNamed:@"black_alph4.png"];
            backImage.frame=showimageView.frame;
            backImage.backgroundColor=[UIColor clearColor];
            [showimageView addSubview:backImage];
            
            
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            imageView.image = [self.imageArray objectAtIndex:index_];
            [showimageView addSubview:imageView];
            
            UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame= CGRectMake(20, 20, 40, 40);
            [button setImage:[UIImage imageNamed:@"Button_X.png"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(removeImageShow:) forControlEvents:UIControlEventTouchUpInside];
            
            [showimageView addSubview:button];
            showimageView.backgroundColor = [UIColor whiteColor];
            
            
//            showimageView.alpha = 0.3;
            
            
            [self addGestureRecognizerToView:imageView];
            
            //如果处理的是图片，别忘了
            [imageView setUserInteractionEnabled:YES];
            [imageView setMultipleTouchEnabled:YES];
            
        }
        if(buttonIndex==2){
            if (self.imageArray.count > index_ ) {
                
                [self.imageArray removeObjectAtIndex:index_];
                [self.v_tableView reloadData];
            }

        }

    }else {
        
        if(buttonIndex==1){
            AlertUtils *alert = [AlertUtils sharedInstance];
            [alert showWithText:@"" inView:self.view lastTime:1.0];
            
            [self.navigationController popViewControllerAnimated:YES];
        }

    }
    
    
}


- (IBAction)removeImageShow:(id)sender{
    
    [UIView animateWithDuration:0.3 animations:^{
        if (showimageView) {
            showimageView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight);
        }
        
    } completion:^(BOOL finished) {
       
        if (showimageView) {
            [showimageView removeFromSuperview];
            showimageView = nil;
        }

    }];
    

}

-(void)openMenu
{
    //在这里呼出下方菜单按钮项
    myActionSheet = [[UIActionSheet alloc]
                     initWithTitle:nil
                     delegate:self
                     cancelButtonTitle:@"取消"
                     destructiveButtonTitle:nil
                     otherButtonTitles: @"打开照相机", @"从手机相册获取",nil];
    [myActionSheet showInView:self.view];
    
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    //呼出的菜单按钮点击后的响应
    if (buttonIndex == myActionSheet.cancelButtonIndex)
    {
        NSLog(@"取消");
    }
    
    switch (buttonIndex)
    {
        case 0:  //打开照相机拍照
            [self takePhoto];
            break;
            
        case 1:  //打开本地相册
            [self LocalPhoto];
            break;
    }
}


//开始拍照
-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
//        [self presentModalViewController:picker animated:YES];
        [self presentViewController:picker animated:YES completion:^{ }];

        
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

//打开本地相册
-(void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
//    [self presentModalViewController:picker animated:YES];
    [self presentViewController:picker animated:YES completion:^{ }];
}

//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        //先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil)
        {
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        else
        {
            data = UIImagePNGRepresentation(image);
        }
        
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
        
        //得到选择后沙盒中图片的完整路径
        NSString * filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        
        //关闭相册界面
//        [picker dismissModalViewControllerAnimated:YES];
        [picker dismissViewControllerAnimated:YES completion:^{  }];
        
        //创建一个选择后图片的小图标放在下方
        //类似微薄选择图后的效果
        
//        UIImageView *smallimage = [[UIImageView alloc] initWithFrame:CGRectMake(50, 120, 40, 40)] ;
//        smallimage.image = image;
        
        [self performSelector:@selector(selectPic:) withObject:image afterDelay:0.1];

        //加在视图中
//        [self.view addSubview:smallimage];
        
    }
    
}


- (void)selectPic:(UIImage*)image
{
    [self.imageArray addObject:image];
    [self.v_tableView reloadData];
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"您取消了选择图片");
//    [picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:^{  }];
    
}

-(void)sendInfo
{
//    NSLog(@"图片的路径是：%@", filePath);
//    
//    NSLog(@"您输入框中的内容是：%@", _textEditor.text);
}



//选择影像
- (IBAction)selectIamgeAction:(id)sender{
    [self openMenu];
}




-(void)imagePickerControllerDIdCancel:(UIImagePickerController*)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

- (IBAction)commmitAction:(id)sender{
    
    for (int i=0; i<3; i++) {
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
                                           
                                            [formData appendPartWithFileData:eachImgData name:[NSString stringWithFormat:@"img%d", i+1] fileName:[NSString stringWithFormat:@"img%d.jpg", i+1] mimeType:@"image/jpeg"];
                                            
                                            
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
