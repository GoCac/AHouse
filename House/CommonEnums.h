//
//  CommonEnums.h
//  House
//
//  Created by dlut on 15/12/14.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HTTPMethodType) {
    HTTPMethodTypeGet,
    HTTPMethodTypePost,
};

typedef NS_ENUM(NSUInteger, ServerResultType) {
    ServerResultTypeArray,
    ServerResultTypeModel,
};

@interface CommonEnums : NSObject

@end
