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
    return [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] <= 0;
}
+ (NSArray *)parseSemContent:(NSString *)semContent {
    if (![StringUtils isEmpty:semContent]) {
        NSMutableCharacterSet *set = [NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
        [set addCharactersInString:@";"];
        NSString *segTem = [semContent stringByTrimmingCharactersInSet:set];
        NSArray *result = [segTem componentsSeparatedByString:@";"];
        return result;
    }
    return nil;
}

+ (NSArray *)parseLabelContent:(NSString *)labelContent {
    if (![StringUtils isEmpty:labelContent]) {
        NSMutableCharacterSet *set = [NSMutableCharacterSet whitespaceCharacterSet];
        [set addCharactersInString:@";"];
        NSString *labelTem = [labelContent stringByTrimmingCharactersInSet:set];
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:2];
        NSArray *result = [labelTem componentsSeparatedByString:@";"];
        NSLog(@"result is %@", result);
        NSUInteger num = [result count];
        if (num > 0) {
            [array addObject:[result objectAtIndex:0]];
        }
        if (num > 1) {
            NSMutableString *mStr = [[NSMutableString alloc] init];
            for (NSUInteger i = 1; i < num; i++) {
                [mStr appendString:[result objectAtIndex:i]];
                [mStr appendString:@"  "];
            }
            [array addObject:mStr];
        }
        return array;
    }
    return nil;
}

+ (NSString *)originImageUrl:(NSString *)url {
    return [IMAGE_SERVER_ORIGIN_URL stringByAppendingString:url];
}

+ (NSArray *)parseImageOriginUrls:(NSString *)url {
    if (![StringUtils isEmpty:url]) {
        NSMutableCharacterSet *set = [NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
        [set addCharactersInString:@";"];
    }
    return nil;
}

@end
