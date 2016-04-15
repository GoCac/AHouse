//
//  FetchServer.h
//  House
//
//  Created by dlut on 16/3/5.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseModel;
typedef void (^successModelsBlock)(NSArray *models);
typedef void (^successModelBlock)(BaseModel *model);
typedef void (^success)();
typedef void (^failureBlock)(NSInteger code);
typedef void (^errorBlock)();

@interface FetchServer : NSObject
+ (void)postModelsFromUrl:(NSString *)url params:(NSDictionary *)params mClass:(Class)mClass success:(successModelsBlock)success failure:(failureBlock)failure error:(errorBlock)error;
+ (void)postModelFromUrl:(NSString *)url params:(NSDictionary *)params mClass:(Class)mClass success:(successModelsBlock)success failure:(failureBlock)failure error:(errorBlock)error;
+ (void)getModelsFromUrl:(NSString *)url params:(NSDictionary *)params mClass:(Class)mClass success:(successModelBlock)success failure:(failureBlock)failure error:(errorBlock)error;
+ (void)getModelFromUrl:(NSString *)url params:(NSDictionary *)params mClass:(Class)mClass success:(successModelBlock)success failure:(failureBlock)failure error:(errorBlock)error;
//+ (void)testBlock:(BOOL (^)(NSString *name, NSString *psw))info;
@end
