//

#define SystemVersion                       [[[UIDevice currentDevice] systemVersion] floatValue];
#define ApplicationDelegate                 ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define NavBarHeight                        self.navigationController.navigationBar.bounds.size.height
#define TabBarHeight                        self.tabBarController.tabBar.bounds.size.height
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y
#define SelfViewWidth                       self.view.bounds.size.width
#define SelfViewHeight                      self.view.bounds.size.height
#define RectX(f)                            f.origin.x
#define RectY(f)                            f.origin.y
#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height
#define RectSetWidth(f, w)                  CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectSetHeight(f, h)                 CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define RectSetX(f, x)                      CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define RectSetY(f, y)                      CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define RectSetSize(f, w, h)                CGRectMake(RectX(f), RectY(f), w, h)
#define RectSetOrigin(f, x, y)              CGRectMake(x, y, RectWidth(f), RectHeight(f))
#define RGB(r, g, b)                        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define HEXCOLOR(c)                         [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]
#define F(string, args...)                  [NSString stringWithFormat:string, args]
#define ALERT(title, msg)                   [[[UIAlertView alloc]     initWithTitle:title\
                                                message:msg\
                                                delegate:nil\
                                                cancelButtonTitle:@"确定"\
                                                otherButtonTitles:nil] show]


//
#ifdef DEBUG
#define DLog(...) NSLog(__VA_ARGS__)
#define DMethod() NSLog(@"%s", __func__)
#else
#define DLog(...)
#define DMethod()
#endif


//获IOS系统版本号
#define IOS_7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7)

//获取屏幕的尺寸
#define boundsFrame [[UIScreen mainScreen] bounds]
//
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define COLORO(R, G, B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]
#define COLORZ(R, G, B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:0]
//
#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)   //判断当前的设备型号

#define BACKVIEWCOLOR  COLORO(240, 240, 240)
#define BACKVIEWACOLOR  COLORO(234, 233, 239)

//
#define DEVICE_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define DEVICE_WIDTH  [[UIScreen mainScreen] bounds].size.width



//
#ifdef DEBUG
#define DLog(...) NSLog(__VA_ARGS__)
#define DMethod() NSLog(@"%s", __func__)
#else
#define DLog(...)
#define DMethod()
#endif






//