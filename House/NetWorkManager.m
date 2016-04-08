//
//  NetWorkManager.m
//  House
//
//  Created by dlut on 16/3/4.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "NetWorkManager.h"
@implementation NetWorkManager

+ (AFHTTPSessionManager *)shareSM {
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
//        manager.responseSerializer = [AFJSONResponseSerializer serializer];默认方式
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    });
    return manager;
}

+ (AFHTTPRequestOperationManager *)shareRM {
    static AFHTTPRequestOperationManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPRequestOperationManager manager];
//        manager.responseSerializer = [AFJSONResponseSerializer serializer];默认方式
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    });
    return manager;
}

@end
