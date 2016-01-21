//
//  FriendTableViewCell.m
//  hidezo
//
//  Created by codelover2 on 12/10/2015.
//  Copyright © Năm 2015 Tung Dao. All rights reserved.
//

#import "FriendTableViewCell.h"

@implementation FriendTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)actionChat:(id)sender {
    if (self) {
        [self.delegate actionTransformToChat:self];
    }
}

- (IBAction)actionShop:(id)sender {
    if (self) {
        [self.delegate actionTransformToShop:self];
    }
}
@end
