//
//  SaveModelUtils.m
//  House
//
//  Created by dlut on 16/1/19.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "SaveModelUtils.h"
#import <objc/message.h>

@implementation SaveModelUtils
+ (void)saveBaseModels:(NSArray *)models cls:(Class)cls {
    NSString *path = [SaveModelUtils getPath:cls isArray:YES];
    [NSKeyedArchiver archiveRootObject:models toFile:path];
}

+ (void)saveBaseModel:(BaseModel *)model cls:(Class)cls {
    NSString *path = [SaveModelUtils getPath:cls isArray:NO];
    [NSKeyedArchiver archiveRootObject:model toFile:path];
}

+ (NSArray *)getBaseModels:(Class)cls {
    NSString *path = [SaveModelUtils getPath:cls isArray:YES];
    NSArray *result = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return result;
}

+ (BaseModel *)getBaseModel:(Class)cls {
    NSString *path = [SaveModelUtils getPath:cls isArray:NO];
    BaseModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return model;
}

+ (NSString *)getPath:(Class)cls isArray:(BOOL)isArray {
    NSString *clsName = [NSString stringWithUTF8String:class_getName(cls)];
    NSString *dict = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *result;
    if (isArray) {
        result = [[dict stringByAppendingString:clsName] stringByAppendingString:@".models"];
    } else {
        result = [[dict stringByAppendingString:clsName] stringByAppendingString:@".model"];
    }
    return result;
}
@end
