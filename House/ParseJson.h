//
//  ParseJson.h
//  House
//
//  Created by dlut on 15/11/24.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseJson : NSObject
+ (NSArray *)parseNewsJson:(NSArray *)array;
+ (NSArray *)parseHousesJson:(NSArray *)array;
+ (NSArray *)parseJsonArray:(NSArray *)arrar mClass:(Class)mClass;
+ (NSInteger)add:(NSInteger)A AndB:(NSInteger)B;
@end
