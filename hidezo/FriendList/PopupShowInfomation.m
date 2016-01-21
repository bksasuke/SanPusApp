//
//  PopupShowInfomation.m
//  hidezo
//
//  Created by codelover2 on 12/10/2015.
//  Copyright © Năm 2015 Tung Dao. All rights reserved.
//

#import "PopupShowInfomation.h"

@interface PopupShowInfomation ()

@end

@implementation PopupShowInfomation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.cornerRadius=5;
    self.lblName.text=self.strName;
    self.lblAddress.text=self.strAddress;
    self.lblTel.text=self.strTel;
    self.lblEmail.text=self.strEmail;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionDismiss:(id)sender {
    [self.vcParent dismissPopupViewControllerAnimated:YES completion:nil];
}
@end
