//
//  ServerObjResult.m
//  House
//
//  Created by dlut on 16/4/15.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "ServerObjResult.h"

@implementation ServerObjResult
- (instancetype)init {
    if (self = [super init]) {
        self.code = -1;
        self.resultType = ServerResultTypeObj;
    }
    return self;
}
@end
