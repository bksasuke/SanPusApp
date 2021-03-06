//
//  AppDelegate.m
//  hidezo
//
//  Created by Tung Dao on 9/7/15.
//  Copyright (c) 2015 Tung Dao. All rights reserved.
//

#import "AppDelegate.h"
#import "Utils.h"
#import "HidezoAccount.h"
#import "AppController.h"
#import "SVProgressHUD.h"
#import "Login/LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if ([Utils isIphone35Inch]) {
        _storyboard = [UIStoryboard storyboardWithName:@"SmallMain" bundle:[NSBundle mainBundle]];
    } else {
        _storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    }
    
    [self setupSideMenu];
    
    [self checkAccountLogin];
    
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

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Setting Side Menu

- (void)setupSideMenu
{    
    self.container = (MFSideMenuContainerViewController *)self.window.rootViewController;
    UINavigationController *navigationController = (UINavigationController *)[self viewControllerWithIndentifier:@"navigationController"];
    UIViewController *leftSideMenuViewController = [self viewControllerWithIndentifier:@"LeftMenuViewController"];
    [self.container setLeftMenuViewController:leftSideMenuViewController];
    [self.container setCenterViewController:navigationController];
    [self.container setRightMenuViewController:nil];
}

#pragma mark - SharedInstance

+ (AppDelegate *)sharedInstance
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

#pragma mark - ViewController

- (UIViewController *)viewControllerWithIndentifier:(NSString *)identifier
{
    return [_storyboard instantiateViewControllerWithIdentifier:identifier];
}

- (UIViewController *)currentActiveViewController
{
    return [[self.container.centerViewController viewControllers] lastObject];
}

#pragma mark - Check Login

- (void)checkAccountLogin
{
    HidezoAccount *account = [[AppController sharedInstance] getAccountFromUserDefault];
    if (!account) {
        self.window.rootViewController = [self viewControllerWithIndentifier:@"LoginViewController"];
    }
    else {
        self.window.rootViewController = self.container;
    }
}


@end
