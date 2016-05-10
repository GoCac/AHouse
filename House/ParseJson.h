//
//  ParseJson.h
//  House
//
//  Created by dlut on 15/11/24.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseModel;
@interface ParseJson : NSObject
+ (NSArray *)parseJsonArray:(NSArray *)array mClass:(Class)mClass;
+ (id)parseJsonObj:(NSDictionary *)dic mClass:(Class)mClass;
+ (NSArray *)parseHouseHelpers:(NSArray *)array;
@end
