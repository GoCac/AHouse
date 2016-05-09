//
//  House.m
//  House
//
//  Created by dlut on 15/11/5.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "House.h"

@implementation House

- (instancetype)initWithID:(NSUInteger)ID url:(NSString *)url name:(NSString *)name intro:(NSString *)intro phone:(NSString *)phone lat:(NSNumber *)lat lng:(NSNumber *)lng stars:(NSUInteger)stars labelContent:(NSString *)labelContent {
    if(self = [self initWithID:ID url:url name:name intro:intro phone:phone lat:lat lng:lng]) {
        self.stars = stars;
        self.labelContent = labelContent;
    }
    return self;
}

- (instancetype)initWithID:(NSUInteger)ID url:(NSString *)url name:(NSString *)name intro:(NSString *)intro phone:(NSString *)phone lat:(NSNumber *)lat lng:(NSNumber *)lng {
    if(self = [super initWithID:ID]) {
        self.url = url;
        self.name = name;
        self.intro = intro;
        self.phone = phone;
        self.lat = lat;
        self.lng = lng;
    }
    return self;
}

- (NSArray *)labelResult {
    if (nil == _labelResult) {
        _labelResult = [StringUtils parseLabelContent:self.labelContent];
    }
    return _labelResult;
}

- (NSArray *)circleUrls {
    if (nil == _circleUrls) {
        _circleUrls = [StringUtils parseSemContent:self.circleUrl];
    }
    return _circleUrls;
}

- (NSArray *)imageUrls {
    if (nil == _imageUrls) {
        NSMutableArray *result = [[NSMutableArray alloc] init];
        if (![StringUtils isEmpty:self.url]) {
            [result addObject:[StringUtils originImageUrl:self.url]];
        }
        if (![StringUtils isEmpty:self.hxUrl]) {
            [result addObject:[StringUtils originImageUrl:self.hxUrl]];
        }
        if (![StringUtils isEmpty:self.otherUrl]) {
            NSArray *others = [StringUtils parseSemContent:self.otherUrl];
            for (NSString *item in others) {
                [result addObject:[StringUtils originImageUrl:item]];
            }
        }
        _imageUrls = result;
        return _imageUrls;
    }
    return nil;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.url forKey:@"url"];
    [aCoder encodeObject:self.hxUrl forKey:@"hxUrl"];
    [aCoder encodeObject:self.videoUrl forKey:@"videoUrl"];
    [aCoder encodeObject:self.otherUrl forKey:@"otherUrl"];
    [aCoder encodeObject:self.circleUrl forKey:@"circleUrl"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.intro forKey:@"intro"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.lat forKey:@"lat"];
    [aCoder encodeObject:self.lng forKey:@"lng"];
    [aCoder encodeInteger:self.stars forKey:@"stars"];
    [aCoder encodeObject:self.labelContent forKey:@"labelContent"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.url = [aDecoder decodeObjectForKey:@"url"];
        self.hxUrl = [aDecoder decodeObjectForKey:@"hxUrl"];
        self.videoUrl = [aDecoder decodeObjectForKey:@"videoUrl"];
        self.otherUrl = [aDecoder decodeObjectForKey:@"otherUrl"];
        self.circleUrl = [aDecoder decodeObjectForKey:@"circleUrl"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.intro = [aDecoder decodeObjectForKey:@"intro"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.lat = [aDecoder decodeObjectForKey:@"lat"];
        self.lng = [aDecoder decodeObjectForKey:@"lng"];
        self.stars = [aDecoder decodeIntegerForKey:@"stars"];
        self.labelContent = [aDecoder decodeObjectForKey:@"labelContent"];
    }
    return self;
}

@end
