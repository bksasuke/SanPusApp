//
//  BaseViewController.h
//  hidezo
//
//  Created by Tung Dao on 9/7/15.
//  Copyright (c) 2015 Tung Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVProgressHUD.h"
#import "MFSideMenu.h"
#import "AppController.h"
#import "STAlertView.h"
#import "SVPullToRefresh.h"

@interface BaseViewController : UIViewController
{
    AppController *_appController;
    STAlertView *_errorAlertView;
    UIView *_blurView;
    STAlertView *_addAlertView;
    STAlertView *_removeAlertView;
}

#pragma mark - Bar Button
- (void)addLeftMenuButton2;

- (void)addLeftMenuButton;

- (void)addRightMenuButton;

- (void)addBackButton;

- (void)addPlayingButton;

#pragma mark - Progress

- (void)showProgressWithMessage:(NSString *)message;

- (void)showerrorProgressMessage:(NSString *)message;

- (void)showSuccessProgressMessage:(NSString *)message;

- (void)dismissProgress;

#pragma mark - AlertView

- (void)showErrorAlertWithMessage:(NSString *)message
                cancelButtonBlock:(STAlertViewBlock)theCancelButtonBlock
                 otherButtonBlock:(STAlertViewBlock)theOtherButtonBlock;

@end
