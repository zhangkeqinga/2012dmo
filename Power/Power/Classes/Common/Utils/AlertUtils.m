//
//  AlertUtils.m
//  TaiPing
//
//  Created by he fei on 11-12-21.
//  Copyright (c) 2011年 BBDTEK. All rights reserved.
//

#import "AlertUtils.h"


static AlertUtils *alertUtils = nil;
@implementation AlertUtils
@synthesize lastTime;

+ (AlertUtils *)sharedInstance {
    if (!alertUtils) {
        alertUtils = [[AlertUtils alloc] init];
        alertUtils.lastTime = 2;
    }
    return alertUtils;
}

+ (BOOL)tryToRelease {
	if ([alertUtils retainCount] == 1) {
		[alertUtils release];
		alertUtils = nil;
		return YES;
	}else {
		return NO;
	}
}

//MBProgessHUD 弹窗口
- (void)showWithText:(NSString *)alertText inView:(UIView *)view lastTime:(unsigned int)time {
    
    self.lastTime = time;
    
    hud = [[MBProgressHUD alloc] initWithFrame:CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height)]; 
    
    [view addSubview:hud];
    
    hud.labelText = alertText;
    
    hud.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]] autorelease];
    
    hud.mode = MBProgressHUDModeCustomView;
    
    [hud show:YES];
	[hud showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
    
	hud.delegate = self;
    
}

-(void)showInView:(UIView *)view selector:(SEL)selector onTarget:(id)target alertText:(NSString *)text withObject:(id)object{
    hud = [[MBProgressHUD alloc] initWithFrame:CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height)]; 
    [view addSubview:hud];
    hud.dimBackground = NO;
    
    if (text != nil) {
        hud.labelText = text;
    }
    
    [hud show:YES];
    [hud showWhileExecuting:selector onTarget:target withObject:object animated:YES];
	hud.delegate = self;
    
}

- (void)showWithText:(NSString *)alertText inView:(UIView *)view{
    //    self.lastTime = time;
    
    loding_hud = [[MBProgressHUD alloc] initWithFrame:CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height)]; 
    
    [view addSubview:loding_hud];
    
    loding_hud.labelText = alertText;
    
    loding_hud.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]] autorelease];
    
    loding_hud.mode = MBProgressHUDModeCustomView;
    
    [loding_hud show:YES];
    //	[hud showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
    
//	loding_hud.delegate = self;
    
}

- (void)hideHud{
    [loding_hud hide:YES];
}
- (void) myTask {
	// Do something usefull in here instead of sleeping ...
	sleep(lastTime);
}

- (void)hudWasHidden {
	// Remove HUD from screen when the HUD was hidded
	[hud removeFromSuperview];
    
    if (hud != nil) {
        [hud release];
        hud = nil;
    }
}

- (void)alertWithTitle:(NSString *)title message:(NSString *)message ctitle:(NSString *)ctitle otitle:(NSString *)otitle tag:(NSInteger)tag {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message
												   delegate:self cancelButtonTitle:ctitle otherButtonTitles:otitle, nil];
	alert.tag = tag;
	[alert show];	
	[alert release];
}

- (UIPopoverController *)popoverControllerWithContentSize:(CGSize)size contentViewController:(id)controller {
    UIPopoverController *popover = [[[UIPopoverController alloc] initWithContentViewController:controller] autorelease];
    popover.popoverContentSize = size;
    
    return popover;
}

@end
