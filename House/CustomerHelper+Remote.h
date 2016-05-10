//
//  CustomerHelper+Remote.h
//  House
//
//  Created by dlut on 16/3/4.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "CustomerHelper.h"

@interface CustomerHelper (Remote)
+ (void)fetchCustomers:(void(^)(NSArray *models))success fail:(void(^)(NSString *msg))fail;
+ (void)fetchHouseHelpers:(void(^)(NSArray *models))success fail:(void(^)(NSString *msg))fail;
@end
