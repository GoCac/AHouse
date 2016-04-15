//
//  FetchServer.m
//  House
//
//  Created by dlut on 16/3/5.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "FetchServer.h"
#import "NetWorkManager.h"
#import "ServerUtils.h"
#import "ParseJson.h"

@implementation FetchServer
+ (void)postModelFromUrl:(NSString *)url params:(NSDictionary *)params mClass:(Class)mClass success:(successModelsBlock)success failure:(failureBlock)failure error:(errorBlock)error {
    [[NetWorkManager shareSM] POST:url parameters:params success:^(NSURLSessionDataTask * task, id responseObject) {

    } failure:^(NSURLSessionDataTask * task, NSError * error) {
        
    }];
}

+ (void)postModelsFromUrl:(NSString *)url params:(NSDictionary *)params mClass:(Class)mClass success:(successModelsBlock)success failure:(failureBlock)failure error:(errorBlock)error {
    [[NetWorkManager shareSM] POST:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        [self handleModelsResponse:responseObject mClass:mClass success:^(NSArray *models) {
            success(models);
        } failure:^(NSInteger code) {
            failure(code);
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *err) {
        error();
    }];
}

+ (void)handleModelsResponse:(id)response mClass:(Class)mClass success:(successModelsBlock)success failure:(failureBlock)failure {
    ServerArrayResult *result = [ServerUtils parseServerArrayResponse:response];
    if (result.isSuccess) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSArray *models = [ParseJson parseJsonArray:result.array mClass:mClass];
            dispatch_async(dispatch_get_main_queue(), ^{
                success(models);
            });
        });
    } else {
        failure(result.code);
    }
}

+ (void)getModelFromUrl:(NSString *)url params:(NSDictionary *)params mClass:(Class)mClass success:(successModelBlock)success failure:(failureBlock)failure error:(errorBlock)error {
    
}

+ (void)getModelsFromUrl:(NSString *)url params:(NSDictionary *)params mClass:(Class)mClass success:(successModelBlock)success failure:(failureBlock)failure error:(errorBlock)error {
    
}
@end
