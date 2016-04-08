//
//  ServerResult.h
//  House
//
//  Created by dlut on 15/12/14.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonEnums.h"
#import "JCPrefixHeader.pch"
@class BaseModel;
@interface ServerResult : NSObject
@property(nonatomic, assign) NSInteger code;
@property(nonatomic, strong) NSArray *array;
@property(nonatomic, strong) BaseModel *model;
@property(nonatomic, assign, getter=isSuccess) BOOL success;
@property(nonatomic, assign, getter=isArrayType, readonly) BOOL arrayType;
@property(nonatomic, assign) ServerResultType resultType;
- (instancetype)initWithCode:(NSInteger)code array:(NSArray *)array isSuccess:(BOOL)isSuccess;
- (instancetype)initWithCode:(NSInteger)code model:(BaseModel *)model isSuccess:(BOOL)isSuccess;
@end
