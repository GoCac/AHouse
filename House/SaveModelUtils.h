//
//  SaveModelUtils.h
//  House
//
//  Created by dlut on 16/1/19.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BaseModel;
@interface SaveModelUtils : NSObject
+ (void)saveBaseModels:(NSArray *)models cls:(Class)cls;
+ (void)saveBaseModel:(BaseModel *)model cls:(Class)cls;
+ (NSArray *)getBaseModels:(Class)cls;
+ (BaseModel *)getBaseModel:(Class)cls;
@end
