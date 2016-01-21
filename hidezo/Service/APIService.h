//
//  APIService.h
//  hidezo
//
//  Created by Tung Dao on 9/7/15.
//  Copyright (c) 2015 Tung Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIConfig.h"
#import "AFHTTPRequestOperationManager.h"

typedef void (^APICompletion)(NSDictionary *responseDict);

typedef enum {
    HidezoSupplierType = 0,
    HidezoStoreType = 1
} HidezoType;

@interface APIService : AFHTTPRequestOperationManager

+ (APIService *)sharedInstance;

- (void)checkLoginHidezoWithUuid:(NSString *)uuidKey andId:(NSString *)userId completion:(APICompletion)block;
- (void)loginHidezoWithUuid:(NSString *)uuidKey andId:(NSString *)userId completion:(APICompletion)block;
- (void)getFriendsWithUuid:(NSString *)uuidKey andId:(NSString *)userId completion:(APICompletion)block;
- (void)getProductWithSupplierID:(NSString*)supplierID andUuid:(NSString *)uuidKey andId:(NSString *)userId completion:(APICompletion)block;

@end
