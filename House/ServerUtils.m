//
//  ServerUtils.m
//  House
//
//  Created by dlut on 15/12/14.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import "ServerUtils.h"

@implementation ServerUtils
+ (ServerArrayResult *)parseServerArrayResponse:(id)response {
    ServerArrayResult *result = [[ServerArrayResult alloc] init];
    NSInteger code = [response[CODE] integerValue];
    [result setCode:code];
    [result setSuccess:(CODE_SUCCESS == code)];
    [result setArray:response[RESULT]];
    return result;
}

+ (ServerObjResult *)parseServerObjResponse:(id)response {
    ServerObjResult *result = [[ServerObjResult alloc] init];
    NSInteger code = [response[CODE] integerValue];
    [result setCode:code];
    [result setSuccess:(CODE_SUCCESS == code)];
    [result setObj:response[RESULT]];
    return result;
}

@end
