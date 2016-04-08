//
//  ServerResult.m
//  House
//
//  Created by dlut on 15/12/14.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import "ServerResult.h"

@implementation ServerResult
- (instancetype)initWithCode:(NSInteger)code array:(NSArray *)array isSuccess:(BOOL)isSuccess {
    if (self = [super init]) {
        self.code = code;
        self.array = array;
        self.success = isSuccess;
    }
    return self;
}

- (instancetype)initWithCode:(NSInteger)code model:(BaseModel *)model isSuccess:(BOOL)isSuccess {
    if (self = [super init]) {
        self.code = code;
        self.model = model;
        self.success = isSuccess;
    }
    return self;
}

- (BOOL)isArrayType {
    return _resultType == ServerResultTypeArray;
}

@end
