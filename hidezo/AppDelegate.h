//
//  AppDelegate.h
//  hidezo
//
//  Created by Tung Dao on 9/7/15.
//  Copyright (c) 2015 Tung Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFSideMenuContainerViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UIStoryboard *storyboard;
@property (nonatomic, strong) MFSideMenuContainerViewController *container;

+ (AppDelegate *)sharedInstance;
- (UIViewController *)viewControllerWithIndentifier:(NSString *)identifier;
- (UIViewController *)currentActiveViewController;
- (void)checkAccountLogin;

@end

