//
//  NetWorkManager.h
//  House
//
//  Created by dlut on 16/3/4.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface NetWorkManager : NSObject
+ (AFHTTPSessionManager *)shareSM;
+ (AFHTTPRequestOperationManager * )shareRM;
@end
