//
//  CheckMdeicalImageVC.m
//  Power
//
//  Created by mac on 15/10/2.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//  我的影像 ＋ 添加影像

#import "CheckMdeicalImageVC.h"
#import "AFHTTPSessionManager.h"

@interface CheckMdeicalImageVC ()
{
    
    NSInteger index_;
}
@property(nonatomic,strong)NSMutableArray * images;
@property(nonatomic,strong)UIActionSheet * myActionSheet;
@property(nonatomic,strong)UIView *showimageView;
@property(nonatomic,strong)UIView *backimageView;

@end

@implementation CheckMdeicalImageVC

@synthesize imageArray;
@synthesize images;
@synthesize myActionSheet;
@synthesize showimageView;
@synthesize backimageView;



- (void)viewDidLoad {
    [super viewDidLoad];

    index_ = 0;
    self.imageArray =[NSMutableArray array];
    
    [self freshView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)freshView{

    if (backimageView) {
        [backimageView removeFromSuperview];
        backimageView=nil;
        
    }
    
    backimageView = [[UIView alloc]init];
    backimageView.frame = CGRectMake(0, 0, ScreenWidth , ScreenHeight-64);
//    backimageView.backgroundColor= [UIColor redColor];
    [self.view addSubview:backimageView];
    
    NSInteger conditonNumber = 10;  //限制图片的个数
    
    if (self.imageArray) {
        
        if ([self.imageArray count]>0) {
            
            NSInteger x = [self.imageArray count] < conditonNumber ? [self.imageArray count]:conditonNumber;
            
            
            for (int i=0; i< x ;i++) {
                
                UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
                button.frame=CGRectMake(25 +i*50, 38, 45, 45);
                button.backgroundColor=[UIColor grayColor];
                button.alpha=0.6;
                [button setBackgroundImage:[self.imageArray objectAtIndex:i ] forState:UIControlStateNormal];
                [self.backimageView addSubview:button];
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
            [self.backimageView addSubview:button];
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
        [self.backimageView addSubview:button];
        [button addTarget:self action:@selector(selectIamgeAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    
    UIButton *buttonadd=[UIButton buttonWithType:UIButtonTypeCustom];
    buttonadd.frame=CGRectMake(25 , 100, ScreenWidth-50, 35);
    [buttonadd setBackgroundImage:[UIImage imageNamed:@"button_red.png"] forState:UIControlStateNormal];
    
    [buttonadd setTitle:@"提交" forState:UIControlStateNormal];
    [self.backimageView addSubview:buttonadd];
    [buttonadd addTarget:self action:@selector(commmitAction:) forControlEvents:UIControlEventTouchUpInside];

    

    
}


- (void)withMangerInfo:(NSString*)title;
{
    self.title = title;
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
        
//        if (view.frame.size.width < ScreenWidth) {
//            [UIView animateWithDuration:0.3 animations:^{
//                view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
//                
//            } completion:^(BOOL finished) {
//                
//            }];
//            
//            
//        }
        
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
                
                
                [self freshView];
//                [self.v_tableView reloadData];
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
        DLog(@"filePath = %@",filePath);
        
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
    
    [self freshView];
//    [self.v_tableView reloadData];
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
    
    //上传影像接口暂时不能使用 测试
    AlertUtils *alert = [AlertUtils sharedInstance];
    [alert showWithText:@"已经上传" inView:self.view lastTime:1.0];

    
//        if (!self.imageArray || [self.imageArray count]<=0) {
//            
//            AlertUtils *alert = [AlertUtils sharedInstance];
//            [alert showWithText:@"请选择影像图片" inView:self.view lastTime:1.0];
//            
//            return ;
//        }
//    
//    //上传图片
//    [self initdataImage];
    
    DLog(@"提交");
    
}



#pragma mark- initdataImage  添加我的影像

- (void)initdataImage{
    
    NSDictionary *dict = @{ @"uid": [Users userId],
                            @"tid": @"doctorModel.doctorid",
                            @"diseaseInfo": @"appointModel.illInfo",
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



//NSString *server_base = [NSString stringWithFormat:@"%@/users/uploadResource.json", _server];
//
//ASINetworkQueue *queue = [[ASINetworkQueue alloc] init];
//
//ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:server_base]];
//
//[ASIHTTPRequest setShouldUpdateNetworkActivityIndicator: NO];
//[request setDelegate :self];
//[request setDidFinishSelector:@selector(sendCommentSucc:)];
//[request setDidFailSelector:@selector(sendCommentFail:)];
//// res 就是 需要上传图片文件的路径
//[request setFile:res forKey:@"res"];
//
//[queue addOperation:request];
//[queue go];



@end
