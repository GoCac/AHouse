//
//  DateUtil.m
//  House
//
//  Created by dlut on 16/5/7.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil
+ (NSString *)convertTimeStampToString:(double)timeStamp {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [dateFormat stringFromDate:date];
}
@end
