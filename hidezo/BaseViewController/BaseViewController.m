//
//  BaseViewController.m
//  hidezo
//
//  Created by Tung Dao on 9/7/15.
//  Copyright (c) 2015 Tung Dao. All rights reserved.
//

#import "BaseViewController.h"
#import "Utils.h"
#import "AppDelegate.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _appController = [AppController sharedInstance];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
#pragma mark - Bar Button

- (void)addLeftMenuButton2 {
    UIButton *leftMenuButton = [[UIButton alloc] init];
    leftMenuButton.frame = CGRectMake(20, 20, 24 ,24);
    [leftMenuButton setBackgroundImage:[UIImage imageNamed:@"menu_btn"] forState:UIControlStateNormal];
    [leftMenuButton addTarget:self action:@selector(onShowLeftMenuAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftMenuButton];
}

- (void)addLeftMenuButton
{
    UIButton *leftMenuButton = [[UIButton alloc] init];
    leftMenuButton.frame = CGRectMake(0.0, 0.0, 22, 22);
    [leftMenuButton setBackgroundImage:[UIImage imageNamed:@"menu_btn"] forState:UIControlStateNormal];
    [leftMenuButton addTarget:self action:@selector(onShowLeftMenuAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftMenuButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.navigationItem.hidesBackButton = YES;
}

- (void)addRightMenuButton
{
    UIButton *rightMenuButton = [[UIButton alloc] init];
    rightMenuButton.frame = CGRectMake(0.0, 0.0, 22, 22);
    [rightMenuButton setBackgroundImage:[UIImage imageNamed:@"ic_favourite"] forState:UIControlStateNormal];
    [rightMenuButton addTarget:self action:@selector(onShowRightMenuAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightMenuButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)addBackButton
{
    UIButton *leftMenuButton = [[UIButton alloc] init];
    leftMenuButton.frame = CGRectMake(0.0, 0.0, 24, 24);
    [leftMenuButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftMenuButton addTarget:self action:@selector(onBackAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftMenuButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.navigationItem.hidesBackButton = YES;
}

- (void)addPlayingButton
{
    UIButton *playingButton = [[UIButton alloc] init];
    playingButton.frame = CGRectMake(0.0, 0.0, 57, 24);
    [playingButton setBackgroundImage:[UIImage imageNamed:@"play_now"] forState:UIControlStateNormal];
    [playingButton addTarget:self action:@selector(onShowPlayingAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *playingBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:playingButton];
    self.navigationItem.rightBarButtonItem = playingBarButtonItem;
}

#pragma mark - MenuAction

- (void)onShowLeftMenuAction
{
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (void)onShowRightMenuAction
{
    [self.menuContainerViewController toggleRightSideMenuCompletion:nil];
}

- (void)onBackAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Progress

- (void)showProgressWithMessage:(NSString *)message
{
    [SVProgressHUD showWithStatus:message];
}

- (void)showerrorProgressMessage:(NSString *)message
{
    [SVProgressHUD showErrorWithStatus:message];
}

- (void)showSuccessProgressMessage:(NSString *)message
{
    [SVProgressHUD showSuccessWithStatus:message];
}

- (void)dismissProgress
{
    [SVProgressHUD dismiss];
}

#pragma mark - AlertView

- (void)showErrorAlertWithMessage:(NSString *)message
                cancelButtonBlock:(STAlertViewBlock)theCancelButtonBlock
                 otherButtonBlock:(STAlertViewBlock)theOtherButtonBlock
{
    _errorAlertView = [[STAlertView alloc] initWithTitle:nil message:message cancelButtonTitle:nil otherButtonTitles:@"確定" cancelButtonBlock:theCancelButtonBlock otherButtonBlock:theOtherButtonBlock];
}

@end
