//
//  HouseDetail.m
//  House
//
//  Created by dlut on 15/11/25.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "HouseDetail.h"

@implementation HouseDetail
- (instancetype)initWithID:(NSUInteger)ID url:(NSString *)url name:(NSString *)name intro:(NSString *)intro phone:(NSString *)phone lat:(NSNumber *)lat lng:(NSNumber *)lng houseType:(NSString *)houseType forceType:(NSString *)forceType avgprice:(NSString *)avgPrice address:(NSString *)address recReason:(NSString *)recReason trafficLines:(NSString *)trafficLines designIdea:(NSString *)designIdea {
    if (self = [super initWithID:ID url:url name:name intro:intro phone:phone lat:lat lng:lng]) {
        self.houseType = houseType;
        self.avgPrice = avgPrice;
        self.address = address;
        self.recReason = recReason;
        self.trafficLines = trafficLines;
        self.designIdea = designIdea;
    }
    return self;
}
@end
