//
//  NSDictionary+Validation.m
//  House
//
//  Created by dlut on 15/12/26.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import "NSDictionary+Validation.h"

@implementation NSDictionary (Validation)
- (BOOL)isValidationKey:(NSString *)key {
    if (![self objectForKey:key]) {
        return NO;
    }
    id obj = [self objectForKey:key];
    return ![obj isEqual:[NSNull null]];
}
@end
