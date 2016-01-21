//
//  AppController.h
//  hidezo
//
//  Created by Tung Dao on 9/7/15.
//  Copyright (c) 2015 Tung Dao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIService.h"
#import "HidezoAccount.h"

@interface AppController : NSObject

@property (nonatomic, retain) NSString *uuidString;

+ (AppController *)sharedInstance;

- (void)storeAccountToUserDefault:(HidezoAccount *)account;
- (HidezoAccount *)getAccountFromUserDefault;

#pragma mark - API Service

- (void)parseCheckLoginHidezoWithId:(NSString *)userId completion:(void (^) (BOOL success, NSString *status))block;
- (void)parseLoginHidezoWithId:(NSString *)userId completion:(void (^) (BOOL success, NSString *status))block;
- (void)parseGetFriendsWithUuid:(NSString *)uuidKey andId:(NSString *)userId completion:(void (^) (BOOL success, NSArray *arrFriends))block;
- (void)parseGetProductWithSupplierID:(NSString*)supplierID andUuid:(NSString *)uuidKey andId:(NSString *)userId completion:(void(^) (BOOL success, NSDictionary* response))block;

@end
