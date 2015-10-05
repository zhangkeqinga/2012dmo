//
//  AppDelegate.h
//  Power
//
//  Created by tyApple2014 on 15/9/5.
//  Copyright (c) 2015年 huiwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "MJPasswordPopView.h"


@class Reachability;
@class ICETutorialController;
//@class InstructionsController;
//@class MainViewController;



#import "MainViewController.h"
#import "InstructionsController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,MJPasswordPopViewDelegate>

{
    MJPasswordPopView *popView;
    InstructionsController *instruction;
    Reachability  *hostReach;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *mvc;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@property (strong, nonatomic) MJPasswordPopView *popView;;
@property (strong, nonatomic) ICETutorialController *viewController;

@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;

- (void)selectMainControler:(NSInteger )indexNum;


@end


//多国语言
//NSLocalizedString(@"suggestion", nil);



