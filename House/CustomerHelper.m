//
//  CustomerHelper.m
//  House
//
//  Created by dlut on 15/12/26.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import "CustomerHelper.h"

@implementation CustomerHelper
- (instancetype)initWithID:(NSUInteger)ID name:(NSString *)name hxID:(NSString *)hxID {
    if (self = [super initWithID:ID]) {
        self.name = name;
        self.hxID = hxID;
    }
    return self;
}
@end
