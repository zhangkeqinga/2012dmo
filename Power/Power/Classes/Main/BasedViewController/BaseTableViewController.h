//
//  BaseTableViewController.h
//  Bull
//
//  Created by Grant on 15/4/1.
//  Copyright (c) 2015年 Grant. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TouchTableViewDelegate <NSObject>

@optional

- (void)tableView:(UITableView *)tableView
     touchesBegan:(NSSet *)touches
        withEvent:(UIEvent *)event;

- (void)tableView:(UITableView *)tableView
 touchesCancelled:(NSSet *)touches
        withEvent:(UIEvent *)event;

- (void)tableView:(UITableView *)tableView
     touchesEnded:(NSSet *)touches
        withEvent:(UIEvent *)event;

- (void)tableView:(UITableView *)tableView
     touchesMoved:(NSSet *)touches
        withEvent:(UIEvent *)event;

- (void)TTWTableViewDelegate;


@end


@interface BaseTableViewController : UITableViewController
{
    WaitingLoadingViewController *parentWaitLoading;
    MRProgressOverlayView *mrgprogressView;
    
    id<TouchTableViewDelegate> touchDelegate;
    
}
    
@property (nonatomic,assign) id<TouchTableViewDelegate> touchDelegate;

-(void)setTitleBackItemNil;
-(void)setTitleBackItem;
-(void)setTitleBackItemImage;
-(void)setTitleBackItemImageAndTitle;


- (void)back;

- (BOOL)isnotNetWorking;


-(void)showWaitLoading;
-(void)showWaitLoadingAtRect:(CGRect )_rect;
-(void)hideWaitLoading;



- (void)showMRProgressWaitLoading;
- (void)hideMRProgressWaitLoading;



@end
