//
//  ParseJson.m
//  House
//
//  Created by dlut on 15/11/24.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "ParseJson.h"
#import "News.h"
#import "House.h"
#import "CustomerHelper.h"
#import "objc/runtime.h"
#import "NSDictionary+Validation.h"
#import "Househelpers.h"

#define ID_LOWER_CASE @"id"
#define ID_UPPER_CASE [ID_LOWER_CASE uppercaseString]

@implementation ParseJson
+ (NSArray *)parseNewsJson:(NSArray *)array {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array) {
        NSUInteger ID = [dic[@"id"] intValue];
        NSString *picUrl = [NSString stringWithFormat:@"%@", dic[@"picUrl"]];
        NSString *title = [NSString stringWithFormat:@"%@", dic[@"title"]];
        NSString *author = [NSString stringWithFormat:@"%@", dic[@"author"]];
        NSString *time = [NSString stringWithFormat:@"%@", dic[@"time"]];
        [result addObject:[[News alloc] initWithID:ID picUrl:picUrl title:title author:author time:time]];
    }
    return result;
}

+ (NSArray *)parseJsonArray:(NSArray *)array mClass:(Class)mClass {
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[array count]];
    NSSet *sets = [ParseJson getIvarsFromClass:mClass];
    for (NSDictionary *dic in array) {
        [result addObject:[ParseJson parseJsonObj:dic mClass:mClass sets:sets]];
    }
    return result;
}

+ (NSDictionary *)ivarsDicParams {
    static NSMutableDictionary *dic;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dic = [[NSMutableDictionary alloc] init];
        [dic setValue:ID_UPPER_CASE forKey:ID_LOWER_CASE];
    });
    return dic;
}

+ (NSDictionary *)customerClasses {
    static NSMutableDictionary *dic;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dic = [[NSMutableDictionary alloc] init];
        [dic setValue:[CustomerHelper class] forKey:@"helper"];
    });
    return dic;
}

+ (NSDictionary *)arrayClasses {
    static NSMutableDictionary *dic;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dic = [[NSMutableDictionary alloc] init];
    });
    return dic;
}

+ (id)parseJsonObj:(NSDictionary *)dic mClass:(Class)mClass {
    NSSet *sets = [ParseJson getIvarsFromClass:mClass];
    return [ParseJson parseJsonObj:dic mClass:mClass sets:sets];
}

+ (id)parseJsonObj:(NSDictionary *)dic mClass:(Class)mClass sets:(NSSet *)sets {
    NSObject *result = [[mClass alloc] init];
    NSDictionary *params = [ParseJson ivarsDicParams];
    NSDictionary *customerClasses = [ParseJson customerClasses];
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *keyStr = (NSString *)key;
        if([customerClasses isValidationKey:keyStr]) {
            [result setValue:[ParseJson parseJsonObj:obj mClass:[customerClasses objectForKey:keyStr]] forKey:keyStr];
        } else if ([sets containsObject:keyStr]) {
            [result setValue:obj forKey:keyStr];
        } else if ([params isValidationKey:keyStr]) {
            [result setValue:obj forKey:params[keyStr]];
        }
    }];
    return result;
}

+ (NSSet *)getIvarsFromClass:(Class)mClass {
    NSMutableSet *sets = [[NSMutableSet alloc] init];
    Class currentClass = mClass;
    while (currentClass != [NSObject class]) {
        unsigned int count = 0;
        //不包括父类的属性
        objc_property_t *properties = class_copyPropertyList(currentClass, &count);
        for (int i = 0; i < count; i++) {
            [sets addObject:[NSString stringWithUTF8String:property_getName(properties[i])]];
//            NSString *name = [NSString stringWithUTF8String:property_getAttributes(properties[i])];
        }
        currentClass = [currentClass superclass];
    }
    return sets;
}

+ (NSArray *)parseHouseHelpers:(NSArray *)array {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSDictionary *item in array) {
        NSInteger ID = [item[@"id"] integerValue];
        NSString *name = item[@"name"];
        NSArray *helpers = [ParseJson parseJsonArray:item[@"helpers"] mClass:[CustomerHelper class]];
        Househelpers *hh = [[Househelpers alloc] initWithID:ID];
        [hh setName:name];
        [hh setHelpers:helpers];
        [result addObject:hh];
    }
    return result;
}

@end
