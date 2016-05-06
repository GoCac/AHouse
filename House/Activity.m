//
//  Activity.m
//  House
//
//  Created by dlut on 15/11/5.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "Activity.h"

@implementation Activity

- (instancetype)initWithID:(NSUInteger)ID picUrl:(NSString *)picUrl title:(NSString *)title time:(NSString *)time {
    if(self = [super initWithID:ID]) {
        self.picUrl = picUrl;
        self.title = title;
        self.time = time;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.picUrl forKey:@"picUrl"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeObject:self.isTop forKey:@"isTop"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.picUrl = [aDecoder decodeObjectForKey:@"picUrl"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.time = [aDecoder decodeObjectForKey:@"time"];
        self.isTop = [aDecoder decodeObjectForKey:@"isTop"];
    }
    return self;
}

@end
