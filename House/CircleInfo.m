//
//  CircleInfo.m
//  House
//
//  Created by dlut on 15/12/13.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import "CircleInfo.h"

@implementation CircleInfo

- (instancetype)initWithID:(NSUInteger)ID url:(NSString *)url {
    if (self = [super initWithID:ID]) {
        self.url = url;
    }
    return self;
}

@end
