//
//  ServerUtils.m
//  House
//
//  Created by dlut on 15/12/14.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import "ServerUtils.h"

@implementation ServerUtils
+ (ServerResult *)parseServerResponse:(id)response resultType:(ServerResultType)resultType {
    ServerResult *result = [[ServerResult alloc] init];
    NSInteger code = [response[CODE] integerValue];
    [result setCode:code];
    [result setSuccess:(CODE_SUCCESS == code)];
    [result setResultType:resultType];
    if (CODE_SUCCESS == code) {
        if ([result isArrayType]) {
            [result setArray:response[RESULT]];
        } else {
            [result setModel:response[RESULT]];
        }
    }
    return result;
}
@end
