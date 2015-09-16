//
//  AppDelegate.m
//  Power
//
//  Created by tyApple2014 on 15/9/5.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import "AppDelegate.h"


#import "MainViewController.h"
#import "InstructionsController.h"

//第三方框架
#import "AFHTTPRequestOperationManager.h"

//token  保存7天


@interface AppDelegate ()<InstructionsControllerDelegate>

@property  MainViewController *mvc;

@end


@implementation AppDelegate

@synthesize popView;
@synthesize viewController;

@synthesize leftSwipeGestureRecognizer,rightSwipeGestureRecognizer;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //1、检查网络
    [self realTimeNetWorking];
    //2、判断登录是否过期
    //    if ([UnitPath isLoginSecondTime]) { //过期 ...
    //        [Users logoutSystem];
    //    }else {
    //    }
    
    
    //3、
    [self mainEntrance];       //程序入口
    [self addNotification];    //添加通知
    //    [self addGuster];          //添加手势 切换菜单
    
    //    [self unlockGesterNew]; //解锁
    
    //    [self initUMeng];
    
    //2、网络环境的判断
    if (![self isnotNetWorking]) {
        
    }else{
        
        //        [self initRequest];
        //    [self checkVersion:YES]; //版本检测
        
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


//应用程序将要进入活动状态执行
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    //    [self unlockGesterNew];  //手势密码 开锁
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //    [UMessage registerDeviceToken:deviceToken];
    //    NSLog(@"umeng message alias is: %@", [UMFeedback uuid]);
    //    [UMessage addAlias:[UMFeedback uuid] type:[UMFeedback messageType] response:^(id responseObject, NSError *error) {
    //        if (error != nil) {
    //            NSLog(@"%@", error);
    //            NSLog(@"%@", responseObject);
    //        }
    //    }];
}

#pragma mark - //通知唤醒程序
//通知唤醒程序
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    // IOS 7 Support Required
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    if (application.applicationState == UIApplicationStateInactive) {
        //        [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
    }
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    
}


#pragma mark - 解锁
//解锁
- (void)unlockGesterNew{
    //手势密码
    if ([Users  isLoginSystem]) {
        if ([Users isGusterSecrity]) {
            [self clickEnterPassword:nil];
        }
    }
    
}
//设置手势密码锁
- (void)lockGesterNew{
    //手势密码
    if ([Users  isLoginSystem]) {
        if (![Users isGusterSecrity]) {
            [self clickSetPassword:nil];
        }
    }
    
}



#pragma mark-  检查更新
- (void)initRequest{
    
    NSString *device=[NSString stringWithFormat:@"IOS"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON
    
    NSDictionary *dict = @{ @"device":device};
    
    
    //    NSString *urlString=[NSString stringWithFormat:@"%@",versionFresh1];
    //    DLog(@"urlString == %@&%@",urlString,dict);
    
    [manager POST:versionFresh1 parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * isOk=[ NSString stringWithFormat:@"%@",[responseObject objectForKey:@"status"]];
        
        
        //参数: device(设备类型android或者ios)
        //返回结果： id(id)、appInfo(app描述)、appVersion(app版本号)、appType(app类型ios\android)、
        //appIsUpdate(是否强制更新、1强制；0不强制)、appDownloadUrl(app下载地址)、appBuild(app小版本号)
        
        if ([@"2001" isEqual:isOk]) {
            
            //            NSDictionary *dic=[responseObject objectForKey:@"result"];
            //
            //            NSString *string1 = [NSString stringWithFormat:@"%@",[dic objectForKey:@"appInfo"]];
            //            NSString *string2 = [NSString stringWithFormat:@"%@",[dic objectForKey:@"appVersion"]];
            //            NSString *string3 = [NSString stringWithFormat:@"%@",[dic objectForKey:@"appType"]];
            //            NSString *string4 = [NSString stringWithFormat:@"%@",[dic objectForKey:@"appIsUpdate"]];
            //            NSString *string5 = [NSString stringWithFormat:@"%@",[dic objectForKey:@"appDownloadUrl"]];
            //            NSString *string6 = [NSString stringWithFormat:@"%@",[dic objectForKey:@"appBuild"]];
            //
            //            //
            //            DLog(@"=%@=%@=%@=%@=%@=%@",string1,string2,string3,string4 ,string5,string6);
            
        }else{
        }
        //版本信息的获取 appstore
        [self checkVersion:YES];
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"error＝%@", error);
    }];
    
    
}


//检测软件是否需要升级
-(void)checkVersion:(BOOL)isCheck
{
    NSString *newVersion;
    NSURL *url = [NSURL URLWithString:@"http://itunes.apple.com/cn/lookup?id=622520086"];
    //通过url获取数据
    NSString *jsonResponseString =   [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"通过appStore获取的数据是：%@",jsonResponseString);
    
    //解析json数据为数据字典
    NSDictionary *loginAuthenticationResponse = [self dictionaryFromJsonFormatOriginalData:jsonResponseString];
    
    //从数据字典中检出版本号数据
    NSArray *configData = [loginAuthenticationResponse valueForKey:@"results"];
    for(id config in configData)
    {
        newVersion = [config valueForKey:@"version"];
    }
    
    //    NSLog(@"通过appStore获取的版本号是：%@",newVersion);
    
    //获取本地软件的版本号
    NSString *localVersion = [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleVersion"];
    
    NSString *msg = [NSString stringWithFormat:@"你当前的版本是V%@，发现新版本V%@，是否下载新版本？",localVersion,newVersion];
    
    //对比发现的新版本和本地的版本
    if ([newVersion floatValue] > [localVersion floatValue])
    {
        if (isCheck) {
            UIAlertView *createUserResponseAlert = [[UIAlertView alloc] initWithTitle:@"升级提示!" message:msg delegate:self cancelButtonTitle:@"现在升级" otherButtonTitles:nil , nil];
            [createUserResponseAlert show];
            
        }else{
            UIAlertView *createUserResponseAlert = [[UIAlertView alloc] initWithTitle:@"升级提示!" message:msg delegate:self cancelButtonTitle:@"下次再说" otherButtonTitles:@"现在升级" , nil];
            [createUserResponseAlert show];
            
        }
    }
}


//响应升级提示按钮
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //如果选择“现在升级”
    if (buttonIndex == 1)
    {
        //打开iTunes  方法一
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/wan-zhuan-quan-cheng/id692579125?mt=8"]];
        
        /*
         // 打开iTunes 方法二:此方法总是提示“无法连接到itunes”，不推荐使用
         NSString *iTunesLink = @"itms-apps://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftwareUpdate?id=692579125&mt=8";
         [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
         */
        
    }
}

#pragma mark - 辅助方法：将json 格式的原始数据转解析成数据字典
//将json 格式的原始数据转解析成数据字典
-(NSMutableDictionary *)dictionaryFromJsonFormatOriginalData:(NSString *)str
{
    SBJsonParser *sbJsonParser = [[SBJsonParser alloc]init];
    NSError *error = nil;
    //添加autorelease 解决 内存泄漏问题
    NSMutableDictionary *tempDictionary = [[NSMutableDictionary alloc]initWithDictionary:[sbJsonParser objectWithString:str error:&error]];
    return tempDictionary;
}


#pragma mark - 主窗口
- (void)mainEntrance{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    _mvc = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    
    //清楚版本信息 test指示页面 必须要注销
    //    [UnitPath resetDefaults:@"InstructionIndentifiler"];
    
    NSNumber *instructions = [UserDefaults objectForKey:@"InstructionIndentifiler"];
    
    if (! instructions  || ![[UnitPath versionSystemBuild] isEqual:instructions]) { //下载第一次启动
        instruction=[[InstructionsController alloc]init];
        instruction.delegate=self;
        self.window.rootViewController = instruction;
        [Users logoutSystem]; //清除登陆信息
        
    }else {
        
        //        [NSThread sleepForTimeInterval:1.0];
        self.window.rootViewController = _mvc;
        
        [self unlockGesterNew];
        
    }
    
    
}


- (void)addGuster{
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    
    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.window addGestureRecognizer:self.leftSwipeGestureRecognizer];
    [self.window addGestureRecognizer:self.rightSwipeGestureRecognizer];
}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        DLog(@"你在往左边跑啊.");
        if (_mvc.indexNum!=3) {
            _mvc.indexNum++;
            [_mvc selectViewController:_mvc.indexNum];
        }
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        DLog(@"你在往右边跑啊.");
        if (_mvc.indexNum!=0) {
            _mvc.indexNum--;
            [_mvc selectViewController:_mvc.indexNum];
        }
    }
}

- (void)selectMainControler:(NSInteger )indexNum{
    [_mvc selectViewController:indexNum];
}


#pragma mark - //添加通知
- (void)addNotification{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LoginSuccess:) name:@"LoginIsSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccessNotification:) name:@"LoginOut" object:nil];
    
}


-(void)InstructionsDidClicked:(NSUInteger)index;
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[UnitPath versionSystemBuild]  forKey:@"InstructionIndentifiler"];
    
    if (index==800) {
        self.window.rootViewController = _mvc;
        [_mvc selectViewController:2];
    }
    
    if (index==900) {
        self.window.rootViewController = _mvc;
    }
    
}


#pragma mark - //退出登陆  刷新所有的数据
- (void)loginSuccessNotification:(NSNotification *)_notification{
    
    if (_mvc) {
        [_mvc removeFromParentViewController];
        _mvc=nil;
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _mvc = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    self.window.rootViewController = _mvc;
    [_mvc selectViewController:3];
    
    
    
}

- (void)LoginSuccess:(NSNotification *)notification{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    MainViewController *mvc = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    self.window.rootViewController = mvc;
    
}


#pragma mark-友盟统计
- (void)initUMeng{
    //    [MobClick startWithAppkey:UMengAPPKey reportPolicy:BATCH   channelId:@"Web"];  //umzkq
    //    [MobClick updateOnlineConfig];  //在线参数的添加
    //
    //    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    //    [MobClick setAppVersion:version];
    
    //在线参数
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onlineConfigCallBack:) name:UMOnlineConfigDidFinishedNotification object:nil];
    
    
}
- (void)onlineConfigCallBack:(NSNotification *)notification {
    //    DLog(@"loginString=%@", notification.userInfo);
}


/*
 //[MobClick getConfigParams:@"xxxx"];  //获取在线参数
 
 //获取在线参数的方法
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onlineConfigCallBack:) name:UMOnlineConfigDidFinishedNotification object:nil];
 
 - (void)onlineConfigCallBack:(NSNotification *)notification {
 DLog(@"online config has fininshed and params = %@", notification.userInfo);
 }
 
 - (void)viewWillAppear:(BOOL)animated{
 [super viewWillAppear:animated];
 [MobClick beginLogPageView:@"PageOne"];
 }
 - (void)viewWillDisappear:(BOOL)animated{
 [super viewWillDisappear:animated];
 [MobClick endLogPageView:@"PageOne"];
 }
 [MobClick event:@"Forward"];  //统计发生次数
 */

#pragma mark -- 网络环境的监测

- (BOOL)isnotNetWorking{
    //对连接改变做出响应的处理动作。
    NSString * status=[UnitPath internetStatus];
    if ([@"notReachable" isEqual: status]) { //没有连接到网络就弹出提实况
        //        AlertUtils *alert = [AlertUtils sharedInstance];
        //        [alert showWithText:@"网络中断!" inView:self.window lastTime:1.0];
        return NO;
    }else{
        return YES;
    }
}


//#pragma mark-//实时检查网络情况
- (void)realTimeNetWorking{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name: kReachabilityChangedNotification
                                               object: nil];
    hostReach = [Reachability reachabilityWithHostName:@"www.baidu.com"] ;
    [hostReach startNotifier];
}

// 连接改变
- (void)reachabilityChanged: (NSNotification*)note
{
    Reachability*curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}

//处理连接改变后的情况
- (void)updateInterfaceWithReachability: (Reachability*)curReach
{
    //对连接改变做出响应的处理动作。
    NetworkStatus status=[curReach currentReachabilityStatus];
    if (status== NotReachable) { //没有连接到网络就弹出提实况
        [self performSelector:@selector(judgmentNetworking) withObject:nil afterDelay:2.0];
    }
    
}


- (void)judgmentNetworking{
    
    AlertUtils *alert = [AlertUtils sharedInstance];
    [alert showWithText:@"网络中断!" inView:self.window lastTime:1.0];
    
}



#pragma mark - btn action
- (void)clickSetPassword:(id)sender {
    
    popView.isShowPopView=YES;
    popView = [MJPasswordPopView sharePopView];
    [popView setPasswordType:PasswordTypeSet];
    popView.delegate = self;
    popView.backBtn.hidden=NO;
    [popView show:self.window];
}



- (void)clickEnterPassword:(id)sender {
    
    popView.isShowPopView=YES;
    popView = [MJPasswordPopView sharePopView];
    [popView setPasswordType:PasswordTypeEnter];
    popView.delegate = self;
    popView.backBtn.hidden=YES;
    
    [popView show:self.window];
}

#pragma mark - MJPasswordPopViewDelegate
// 忘记密码
- (void)didForgotPassword:(MJPasswordPopView *)pwdPopView {
    popView.isShowPopView=NO;
    
    [Users logoutSystem];  //忘记手势密码
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginOut" object:nil];
    
    DLog(@"%s",__FUNCTION__);
}

// 设置密码成功、输入密码成功
- (void)didPasswordSuccess:(MJPasswordPopView *)pwdPopView withSuccessType:(PasswordSuccessType)successType {
    //    popView.isShowPopView=NO;
    
    
    [Users logGusterSecrity]; //设置密码成功
    
    DLog(@"%s",__FUNCTION__);
}

// 切换其他帐号登陆
- (void)switchOtherAccount:(MJPasswordPopView *)pwdPopview {
    popView.isShowPopView=NO;
    
    
    [Users logoutSystem];  //忘记手势密码
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginOut" object:nil];
    
    DLog(@"%s",__FUNCTION__);
}

// 输入5次密码都错误
- (void)enterPasswordErrorLimit:(MJPasswordPopView *)pwdPopview {
    popView.isShowPopView=NO;
    
    
    [Users logoutSystem];  //忘记手势密码
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginOut" object:nil];
    
    DLog(@"%s",__FUNCTION__);
}



- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"LoginOut" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"LoginIsSuccess" object:nil];
}






#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.HW.Power" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Power" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Power.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
