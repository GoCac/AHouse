//
//  Slideshow.m
//  House
//
//  Created by dlut on 16/1/5.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "Slideshow.h"

@implementation Slideshow
- (instancetype)initWithID:(NSUInteger)ID picUrl:(NSString *)picUrl {
    if (self = [super initWithID:ID]) {
        self.picUrl = picUrl;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.picUrl forKey:@"picUrl"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.picUrl = [aDecoder decodeObjectForKey:@"picUrl"];
    }
    return self;
}
@end
