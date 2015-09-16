//
//  BasedViewController.h
//  BGPreferentialShare
//
//  Created by Dong on 15-3-12.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BankModel.h"


@interface BasedViewController : UIViewController
{
    WaitingLoadingViewController *parentWaitLoading;
    MRProgressOverlayView *mrgprogressView;
    
}
@property (nonatomic,assign) BOOL loginOrRegister;

@property (nonatomic,strong) BankModel *banksModel;
@property (strong, nonatomic) UIImage * productDetailImage;
@property (strong, nonatomic) ProductModel * productModel_;

-(void)setTitleBackItemNil;
-(void)setTitleBackItem;
-(void)setTitleBackItemImage;
-(void)setTitleBackItemImageAndTitle;

- (BOOL)isnotNetWorking;
- (void)back;

-(void)showWaitLoading;
-(void)showWaitLoadingAtRect:(CGRect )_rect;
-(void)hideWaitLoading;

- (void)withManger:(BankModel *)bankModel_;


//添加功能
-(void)setAddItemTitle;
- (IBAction)addAction:(id)sender;



- (void)showMRProgressWaitLoading;
- (void)hideMRProgressWaitLoading;


@end
