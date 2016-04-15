//
//  CustomerHelper+Remote.m
//  House
//
//  Created by dlut on 16/3/4.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "CustomerHelper+Remote.h"
#import "NetWorkManager.h"
#import "ParseJson.h"
#import "ServerUtils.h"

@implementation CustomerHelper (Remote)
+ (void)fetchCustomers:(void (^)(NSArray *models))success fail:(void (^)(NSString *))fail {
    [[NetWorkManager shareSM] GET:HELPER_SERVER_URL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        ServerArrayResult *result = [ServerUtils parseServerArrayResponse:responseObject];
        if (result.isSuccess) {
            NSArray *models = [ParseJson parseJsonArray:result.array mClass:[self class]];
            success(models);
        } else {
            fail([NSString stringWithFormat:@"获取数据失败，result code is %lu", result.code]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        fail([NSString stringWithFormat:@"%@", error]);
    }];
}
@end
