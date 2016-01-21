//
//  AppController.m
//  hidezo
//
//  Created by Tung Dao on 9/7/15.
//  Copyright (c) 2015 Tung Dao. All rights reserved.
//

#import "AppController.h"
#import "Utils.h"

static AppController *sharedInstance = nil;

@implementation AppController

+ (AppController *)sharedInstance
{
    if (nil != sharedInstance) {
        return sharedInstance;
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppController alloc] init];
    });
    
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
        _uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
        CFRelease(uuid);
    }
    
    return self;
}

#pragma mark - Account

- (void)storeAccountToUserDefault:(HidezoAccount *)account
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:account];
    [userDefault setObject:myEncodedObject forKey:hidezoAccount];
    [userDefault synchronize];
}

- (HidezoAccount *)getAccountFromUserDefault
{
    NSData *myDecodedObject = [userDefault objectForKey:hidezoAccount];
    HidezoAccount *account = [NSKeyedUnarchiver unarchiveObjectWithData:myDecodedObject];
    return account;
}

#pragma mark - API Service

- (void)parseLoginHidezoWithId:(NSString *)userId completion:(void (^) (BOOL success, NSString *status))block
{
    [[APIService sharedInstance] loginHidezoWithUuid:_uuidString andId:userId completion:^(NSDictionary *responseDict) {
        BOOL success = NO;
        NSString *status = [NSString string];
        if (responseDict) {
            success = YES;
            status = [[responseDict valueForKey:API_RES_CODE] lowercaseString];
        }
        
        if (block) {
            block (success, status);
        }
    }];
}

- (void)parseCheckLoginHidezoWithId:(NSString *)userId completion:(void (^)(BOOL, NSString *))block
{
    [[APIService sharedInstance] checkLoginHidezoWithUuid:_uuidString andId:userId completion:^(NSDictionary *responseDict) {
        BOOL success = NO;
        NSString *status = [NSString string];
        if (responseDict) {
            success = YES;
            status = [[responseDict valueForKey:API_RES_CODE] lowercaseString];
        }
        
        if (block) {
            block (success, status);
        }
    }];
}

- (void)parseGetFriendsWithUuid:(NSString *)uuidKey andId:(NSString *)userId completion:(void (^) (BOOL success, NSArray *arrFriends))block
{
    [[APIService sharedInstance] getFriendsWithUuid:_uuidString andId:userId completion:^(NSDictionary *responseDict) {
        BOOL success = NO;
        NSArray *arrFriends = [NSArray array];
        if (responseDict) {
            success = YES;
            arrFriends = (NSArray *)[responseDict objectForKey:API_RES_FRIEND];
        }
        
        if (block) {
            block (success, arrFriends);
        }
    }];
}
-(void)parseGetProductWithSupplierID:(NSString *)supplierID andUuid:(NSString *)uuidKey andId:(NSString *)userId completion:(void (^)(BOOL, NSDictionary *))block{
    [[APIService sharedInstance] getProductWithSupplierID:supplierID andUuid:_uuidString andId:userId completion:^(NSDictionary *responseDict) {
        BOOL success = NO;
       
        if (responseDict) {
            success = YES;
           
        }
        
        if (block) {
            block (success, responseDict);
        }
    }];
}
@end
