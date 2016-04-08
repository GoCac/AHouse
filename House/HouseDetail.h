//
//  HouseDetail.h
//  House
//
//  Created by dlut on 15/11/25.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "House.h"

@class CustomerHelper;
@interface HouseDetail : House
@property(nonatomic, copy) NSString *houseType;
@property(nonatomic, copy) NSString *forceType;
@property(nonatomic, copy) NSString *avgPrice;
@property(nonatomic, copy) NSString *address;
@property(nonatomic, copy) NSString *recReason;
@property(nonatomic, copy) NSString *trafficLines;
@property(nonatomic, copy) NSString *designIdea;
@property(nonatomic, strong) CustomerHelper *helper;

- (instancetype)initWithID:(NSUInteger)ID url:(NSString *)url name:(NSString *)name intro:(NSString *)intro phone:(NSString *)phone lat:(NSNumber *)lat lng:(NSNumber *)lng houseType:(NSString *)houseType forceType:(NSString *)forceType avgprice:(NSString *)avgPrice address:(NSString *)address recReason:(NSString *)recReason trafficLines:(NSString *)trafficLines designIdea:(NSString *)designIdea;
@end
