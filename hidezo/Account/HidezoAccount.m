//
//  HidezoAccount.m
//  hidezo
//
//  Created by Tung Dao on 9/22/15.
//  Copyright © 2015 Tung Dao. All rights reserved.
//

#import "HidezoAccount.h"

@implementation HidezoAccount

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_userId forKey:hidezoUserID];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if( self != nil ) {
        _userId = [decoder decodeObjectForKey:hidezoUserID];
    }
    return self;
}

- (id)copyWithZone:(NSZone *) zone
{
    HidezoAccount *accountCopy = [[HidezoAccount allocWithZone: zone] init];
    accountCopy.userId = _userId;
    return accountCopy;
}

@end
