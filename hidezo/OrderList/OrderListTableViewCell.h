//
//  OrderListTableViewCell.h
//  hidezo
//
//  Created by codelover2 on 12/10/2015.
//  Copyright © Năm 2015 Tung Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OrderListTableViewCell;
@protocol OrderListTableViewCellDelegate <NSObject>
@optional
-(void) actionChoose:(OrderListTableViewCell*)cell;
-(void) actionIncrease:(OrderListTableViewCell*)cell;
-(void) actionDecrease:(OrderListTableViewCell*)cell;

@end
@interface OrderListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblQuantity;
@property (weak, nonatomic) IBOutlet UILabel *lblFreshness;

@property (weak, nonatomic) IBOutlet UIButton *btnChoose;
@property (weak, nonatomic) IBOutlet UIButton *btnIncrease;
@property (weak, nonatomic) IBOutlet UIButton *btnDecrease;
- (IBAction)actionChoose:(id)sender;
- (IBAction)actionIncrease:(id)sender;
- (IBAction)actionDecrease:(id)sender;

@property (strong, nonatomic) id<OrderListTableViewCellDelegate> delegate;

@end
