//
//  ProductOBJ.m
//  hidezo
//
//  Created by codelover2 on 12/10/2015.
//  Copyright © Năm 2015 Tung Dao. All rights reserved.
//

#import "ProductOBJ.h"

@implementation ProductOBJ
-(id)initWithDictionary:(NSDictionary *)dictionary{
    if (self) {
        self.productType=[dictionary objectForKey:@"type"];
        self.productID=[dictionary objectForKey:@"id"];
        self.productName=[dictionary objectForKey:@"item_name"];
        self.productPrice=[dictionary objectForKey:@"price"];
        self.scaleArray=[NSMutableArray array];
        self.scaleChoose=@"0";
        NSArray*array=(NSArray*)[dictionary objectForKey:@"num_scale"];
        for (NSString * strScale in array) {
            [self.scaleArray addObject:strScale];
        }
    }
    
    return self;
}
@end
