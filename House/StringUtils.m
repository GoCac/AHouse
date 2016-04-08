//
//  StringUtils.m
//  House
//
//  Created by dlut on 16/1/11.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "StringUtils.h"

@implementation StringUtils
+ (Boolean)isEmpty:(NSString *)str {
    if (nil == str || [str isEqualToString:@""]) {
        return true;
    }
    return false;
}
+ (NSArray *)parseLabelContent:(NSString *)labelContent {
    if (nil != labelContent) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:2];
        NSArray *result = [labelContent componentsSeparatedByString:@";"];
        NSUInteger num = [result count];
        if (num > 0) {
            [array addObject:[result objectAtIndex:0]];
        }
        NSMutableString *mStr = [[NSMutableString alloc] init];
        for (NSUInteger i = 1; i < num; i++) {
            [mStr appendString:[result objectAtIndex:i]];
            [mStr appendString:@"\t"];
        }
        [array addObject:mStr];
        return array;
    }
    return nil;
}
@end
