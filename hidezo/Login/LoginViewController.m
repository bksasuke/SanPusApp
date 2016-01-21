//
//  LoginViewController.m
//  hidezo
//
//  Created by Tung Dao on 9/23/15.
//  Copyright © 2015 Tung Dao. All rights reserved.
//

#import "LoginViewController.h"
#import "AppController.h"
#import "HidezoAccount.h"
#import "AppDelegate.h"
#import "FriendListViewController.h"
@interface LoginViewController () <UIScrollViewDelegate>
{
    AppDelegate *_appDelegate;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    _appDelegate = [AppDelegate sharedInstance];
    self.txtUUID.delegate = self;
    self.scrollView.frame = CGRectMake(0, 20, 320, 640);
    self.scrollView.backgroundColor = [UIColor lightGrayColor];
    self.scrollView.contentInset = UIEdgeInsetsMake(160, 0, 160, 0);
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)checkLogin:(id)sender
{
    if (self.txtUUID.text && ![self.txtUUID.text isEqualToString:@""]) {
        [self showProgressWithMessage:nil];
        [_appController parseCheckLoginHidezoWithId:self.txtUUID.text completion:^(BOOL success, NSString *status) {
            [self dismissProgress];
            [self.txtUUID resignFirstResponder];
                    HidezoAccount *acc = [[HidezoAccount alloc] init];
                    acc.userId = self.txtUUID.text;
                    [_appController storeAccountToUserDefault:acc];
                    [_appDelegate checkAccountLogin];
         }];
    }
}
-(void)autoLogin{
    HidezoAccount *account = [_appController getAccountFromUserDefault];
    [_appController parseLoginHidezoWithId:account.userId completion:^(BOOL success, NSString *status) {
        [self dismissProgress];
        [self pushToFriendViewController];
    }];
}
- (void)checkAccountLogin
{
    HidezoAccount *account = [[AppController sharedInstance] getAccountFromUserDefault];
    if (account) {
    
        [self autoLogin];
    }else{
        self.lblTitle.hidden=NO;
        self.txtUUID.hidden=NO;
        self.btnLogin.hidden=NO;
    }
}
-(void) pushToFriendViewController{
    UIStoryboard*mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FriendListViewController*friendViewController=[mainStoryBoard instantiateViewControllerWithIdentifier:@"FriendListViewController"];
    [self.navigationController pushViewController:friendViewController animated:YES];
}
@end
