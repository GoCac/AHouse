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

//- (void)parseLabelContent {
//    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:2];
//    NSArray *result = [self.labelContent componentsSeparatedByString:@";"];
//    NSUInteger num = [result count];
//    if (num > 0) {
//        [array addObject:[result objectAtIndex:0]];
//    }
//    NSMutableString *mStr = [[NSMutableString alloc] init];
//    for (NSUInteger i = 1; i < num; i++) {
//        [mStr appendString:[result objectAtIndex:i]];
//    }
//    [array addObject:mStr];
//    _labelResult = array;
//}

- (NSArray *)labelResult {
    if (nil == _labelResult) {
        _labelResult = [StringUtils parseSemContent:self.labelContent];
    }
    return _labelResult;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.url forKey:@"url"];
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
