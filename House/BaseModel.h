//
//  BaseModel.h
//  House
//
//  Created by dlut on 15/11/5.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCPrefixHeader.pch"

@interface BaseModel : NSObject <NSCoding>
@property(nonatomic, assign) NSUInteger ID;
- (instancetype)initWithID:(NSUInteger)ID;
@end
