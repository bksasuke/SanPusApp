//
//  OrderListTableViewCell.m
//  hidezo
//
//  Created by codelover2 on 12/10/2015.
//  Copyright © Năm 2015 Tung Dao. All rights reserved.
//

#import "OrderListTableViewCell.h"

@implementation OrderListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)actionChoose:(id)sender {
    if (self) {
        [self.delegate actionChoose:self];
    }
}

- (IBAction)actionIncrease:(id)sender {
    if (self) {
        [self.delegate actionIncrease:self];
    }

}

- (IBAction)actionDecrease:(id)sender {
    if (self) {
        [self.delegate actionDecrease:self];
    }

}
@end
