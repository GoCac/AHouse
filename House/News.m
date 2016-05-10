//
//  News.m
//  News
//
//  Created by dlut on 15/11/5.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "News.h"

@implementation News

- (instancetype)initWithID:(NSUInteger)ID picUrl:(NSString *)picUrl title:(NSString *)title author:(NSString *)author time:(NSString *)time {
    if (self = [super initWithID:ID]) {
        self.picUrl = picUrl;
        self.title = title;
        self.author = author;
        self.time = time;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.picUrl = [aDecoder decodeObjectForKey:@"picUrl"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.author = [aDecoder decodeObjectForKey:@"author"];
        self.time = [aDecoder decodeObjectForKey:@"time"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.picUrl forKey:@"picUrl"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.author forKey:@"author"];
    [aCoder encodeObject:self.time forKey:@"time"];
}

@end
