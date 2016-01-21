//
//  ProductOBJ.h
//  hidezo
//
//  Created by codelover2 on 12/10/2015.
//  Copyright © Năm 2015 Tung Dao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductOBJ : NSObject
@property (strong, nonatomic) NSString* productType;
@property (strong, nonatomic) NSString* productID;
@property (strong, nonatomic) NSString* productName;
@property (strong, nonatomic) NSString* productPrice;
@property (strong, nonatomic) NSString* scaleChoose;
@property (strong, nonatomic) NSMutableArray* scaleArray;

-(id) initWithDictionary:(NSDictionary*) dictionary;
@end
