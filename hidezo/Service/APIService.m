//
//  APIService.m
//  hidezo
//
//  Created by Tung Dao on 9/7/15.
//  Copyright (c) 2015 Tung Dao. All rights reserved.
//

#import "APIService.h"

static APIService *sharedInstance = nil;
static HidezoType hidezoType;

@implementation APIService

+ (APIService *)sharedInstance
{
    if (nil != sharedInstance) {
        return sharedInstance;
    }
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        sharedInstance = [[APIService alloc] initWithBaseURL:[NSURL URLWithString:API_BASE_URL]];
        hidezoType = HidezoStoreType;
    });
    
    return sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    return self;
}

#pragma  mark - Private method

- (void)requestPostPath:(NSString *)path
      parameters:(NSDictionary *)parameters
         completion:(APICompletion)block
{
    [self POST:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self completeRequestOperation:operation withData:responseObject error:nil completion:block];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self completeRequestOperation:operation withData:nil error:error completion:block];
    }];
}

- (void)requestGetPath:(NSString *)path
                params:(NSDictionary *)parameters
            completion:(APICompletion)block
{
    [self GET:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self completeRequestOperation:operation withData:responseObject error:nil completion:block];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self completeRequestOperation:operation withData:nil error:error completion:block];
    }];
}

- (void)completeRequestOperation:(AFHTTPRequestOperation *)operation
                        withData:(id)responseData
                           error:(NSError *)err
                      completion:(void(^)(NSDictionary *))completion
{
    if (!err) {
        id responseDict ;
        if (responseData) {
            responseDict = [self dictionaryByReplacingNullsWithBlanks:responseData];
        }
        completion(responseDict);
    } else {
        [self handleRequestError:err completion:completion];
    }
}

- (NSDictionary *)dictionaryByReplacingNullsWithBlanks:(NSDictionary *)sourceDictionary
{
    NSMutableDictionary *replaced = [NSMutableDictionary dictionaryWithDictionary:sourceDictionary];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    [sourceDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
        object = [sourceDictionary objectForKey:key];
        if([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *innerDict = object;
            [replaced setObject:[self dictionaryByReplacingNullsWithBlanks:innerDict] forKey:key];
            
        } else if([object isKindOfClass:[NSArray class]]){
            NSMutableArray *nullFreeRecords = [NSMutableArray array];
            for (id record in object) {
                if([record isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *nullFreeRecord = [self dictionaryByReplacingNullsWithBlanks:record];
                    [nullFreeRecords addObject:nullFreeRecord];
                }
            }
            [replaced setObject:nullFreeRecords forKey:key];
        } else {
            if(object == nul) {
                [replaced setObject:blank forKey:key];
            }
        }
    }];
    
    return [NSDictionary dictionaryWithDictionary:replaced];
}

- (void)handleRequestError:(NSError *)error completion:(APICompletion)block
{
    if (block) {
        
        NSString *errorRecoverySuggestion = [[error userInfo] valueForKey:NSLocalizedRecoverySuggestionErrorKey] ;
        
        NSDictionary *recoverySuggestionDict = nil;
        
        if (errorRecoverySuggestion) {
            recoverySuggestionDict = [NSJSONSerialization JSONObjectWithData: [errorRecoverySuggestion dataUsingEncoding:NSUTF8StringEncoding]
                                                                     options: NSJSONReadingMutableContainers
                                                                       error: nil];
        }
        
        if (recoverySuggestionDict) {
            block (recoverySuggestionDict);
        } else {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setObject:[NSString stringWithFormat:@"%ld",(long)[error code]] forKey:API_RES_CODE];
            [dict setObject:[error localizedDescription] forKey:API_RES_MESSAGE];
            block (dict);
        }
    }
}

#pragma  mark - Public method

- (void)checkLoginHidezoWithUuid:(NSString *)uuidKey andId:(NSString *)userId completion:(APICompletion)block
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:uuidKey forKey:API_PARA_UUID];
    [params setObject:userId forKey:API_PARA_ID];
    if (hidezoType == HidezoSupplierType) {
        [self requestPostPath:API_SUPPLIER_CHECK_LOGIN parameters:params completion:block];
    }
    else {
        [self requestPostPath:API_STORE_CHECK_LOGIN parameters:params completion:block];
    }
}

- (void)loginHidezoWithUuid:(NSString *)uuidKey andId:(NSString *)userId completion:(APICompletion)block
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:uuidKey forKey:API_PARA_UUID];
    [params setObject:userId forKey:API_PARA_ID];
    if (hidezoType == HidezoSupplierType) {
        [self requestPostPath:API_SUPPLIER_LOGIN parameters:params completion:block];
    }
    else {
        [self requestPostPath:API_STORE_LOGIN parameters:params completion:block];
    }
}

- (void)getFriendsWithUuid:(NSString *)uuidKey andId:(NSString *)userId completion:(APICompletion)block
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:uuidKey forKey:API_PARA_UUID];
    [params setObject:userId forKey:API_PARA_ID];
    if (hidezoType == HidezoSupplierType) {
        [self requestPostPath:API_SUPPLIER_FRIENDS parameters:params completion:block];
    }
    else {
        [self requestPostPath:API_STORE_FRIENDS parameters:params completion:block];
    }
}
-(void)getProductWithSupplierID:(NSString *)supplierID andUuid:(NSString *)uuidKey andId:(NSString *)userId completion:(APICompletion)block{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:uuidKey forKey:API_PARA_UUID];
    [params setObject:userId forKey:API_PARA_ID];
    [params setObject:supplierID forKey:API_PARA_SUPPLIER_ID];
    if (hidezoType == HidezoSupplierType) {
        
    }
    else {
        [self requestPostPath:API_SUPPLIER_ITEMS parameters:params completion:block];
    }
}
@end
