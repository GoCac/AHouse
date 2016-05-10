//
//  BaseModel.m
//  House
//
//  Created by dlut on 15/11/5.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (instancetype)initWithID:(NSUInteger)ID {
    if(self = [super init]) {
        self.ID = ID;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.ID forKey:@"ID"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.ID = [aDecoder decodeIntegerForKey:@"ID"];
    }
    return self;
}

@end
