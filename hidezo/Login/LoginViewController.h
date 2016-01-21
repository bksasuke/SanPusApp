//
//  LoginViewController.h
//  hidezo
//
//  Created by Tung Dao on 9/23/15.
//  Copyright © 2015 Tung Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface LoginViewController : BaseViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UITextField *txtUUID;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
-(void) autoLogin;
@end
