//
//  FriendObject.m
//  hidezo
//
//  Created by codelover2 on 12/10/2015.
//  Copyright © Năm 2015 Tung Dao. All rights reserved.
//

#import "FriendObject.h"

@implementation FriendObject
-(id)initWithDictionary:(NSDictionary *)dictionary{
    if (self) {
        self.friendID=[dictionary objectForKey:@"id"];
        self.friendName=[dictionary objectForKey:@"name"];
        self.friendAddress=[dictionary objectForKey:@"address"];
        self.friendTel=[dictionary objectForKey:@"tel"];
        self.friendMinister=[dictionary objectForKey:@"minister"];
        self.friendCharge=[dictionary objectForKey:@"charge"];
        self.friendMobile=[dictionary objectForKey:@"mobile"];
        self.friendDeliver=[dictionary objectForKey:@"deliver_to"];
        self.friendEmail=[dictionary objectForKey:@"mail_addr"];
    }
    return self;
}
@end
