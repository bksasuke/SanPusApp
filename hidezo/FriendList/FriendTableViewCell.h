//
//  FriendTableViewCell.h
//  hidezo
//
//  Created by codelover2 on 12/10/2015.
//  Copyright © Năm 2015 Tung Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendTableViewCell;
@protocol FriendTableViewCellDeleGate <NSObject>
@optional
-(void) actionTransformToChat:(FriendTableViewCell*)cell;
-(void) actionTransformToShop:(FriendTableViewCell*)cell;

@end
@interface FriendTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *chatButton;
@property (weak, nonatomic) IBOutlet UIButton *shopButton;
- (IBAction)actionChat:(id)sender;
- (IBAction)actionShop:(id)sender;
@property (strong, nonatomic) id<FriendTableViewCellDeleGate> delegate;

@end
