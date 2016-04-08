//
//  ServerUtils.h
//  House
//
//  Created by dlut on 15/12/14.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerResult.h"

@interface ServerUtils : NSObject
+ (ServerResult *)parseServerResponse:(id)response resultType:(ServerResultType)resultType;
@end
