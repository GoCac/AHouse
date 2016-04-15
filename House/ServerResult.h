//
//  ServerResult.h
//  House
//
//  Created by dlut on 15/12/14.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCPrefixHeader.pch"

typedef NS_ENUM(NSUInteger, ServerResultType) {
    ServerResultTypeArray,
    ServerResultTypeObj,
};

@class BaseModel;
@interface ServerResult : NSObject
@property(nonatomic, assign) NSInteger code;
@property(nonatomic, assign, getter=isSuccess) BOOL success;
@property(nonatomic, assign) ServerResultType resultType;
@end
