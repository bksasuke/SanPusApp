//
//  PopupShowInfomation.h
//  hidezo
//
//  Created by codelover2 on 12/10/2015.
//  Copyright © Năm 2015 Tung Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+CWPopup.h"
@interface PopupShowInfomation : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblTel;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (strong, nonatomic) NSString* strName;
@property (strong, nonatomic) NSString* strAddress;
@property (strong, nonatomic) NSString* strTel;
@property (strong, nonatomic) NSString*  strEmail;
@property (strong, nonatomic) UIViewController* vcParent;
- (IBAction)actionDismiss:(id)sender;
@end
