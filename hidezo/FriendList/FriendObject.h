//
//  FriendObject.h
//  hidezo
//
//  Created by codelover2 on 12/10/2015.
//  Copyright © Năm 2015 Tung Dao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendObject : NSObject
@property (nonatomic , strong) NSString* friendID;
@property (nonatomic , strong) NSString* friendName;
@property (nonatomic , strong) NSString* friendAddress;
@property (nonatomic , strong) NSString* friendTel;
@property (nonatomic , strong) NSString* friendMinister;
@property (nonatomic , strong) NSString* friendCharge;
@property (nonatomic , strong) NSString* friendMobile;
@property (nonatomic , strong) NSString* friendDeliver;
@property (nonatomic , strong) NSString* friendEmail;
-(id) initWithDictionary:(NSDictionary*) dictionary;
@end
