//
//  ServerUtils.h
//  House
//
//  Created by dlut on 15/12/14.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerArrayResult.h"
#import "ServerObjResult.h"

@interface ServerUtils : NSObject
+ (ServerArrayResult *)parseServerArrayResponse:(id)response;
+ (ServerObjResult *)parseServerObjResponse:(id)response;
@end
