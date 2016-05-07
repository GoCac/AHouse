//
//  Activity.m
//  House
//
//  Created by dlut on 15/11/5.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "Activity.h"
#import "DateUtil.h"

@implementation Activity

- (instancetype)initWithID:(NSUInteger)ID picUrl:(NSString *)picUrl title:(NSString *)title time:(NSNumber *)postTime {
    if(self = [super initWithID:ID]) {
        self.picUrl = picUrl;
        self.title = title;
        self.postTime = postTime;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.picUrl forKey:@"picUrl"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.postTime forKey:@"postTime"];
    [aCoder encodeObject:self.isTop forKey:@"isTop"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.picUrl = [aDecoder decodeObjectForKey:@"picUrl"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.postTime = [aDecoder decodeObjectForKey:@"postTime"];
        self.isTop = [aDecoder decodeObjectForKey:@"isTop"];
    }
    return self;
}

- (BOOL)isFirst {
    return 1 == [self.isTop integerValue];
}

- (NSString *)time {
    if (nil == _time) {
        _time = [DateUtil convertTimeStampToString:[self.postTime doubleValue]];
    }
    return _time;
}

@end
