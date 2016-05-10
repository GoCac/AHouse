//
//  CustomerHelper.h
//  House
//
//  Created by dlut on 15/12/26.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import "BaseModel.h"

@interface CustomerHelper : BaseModel
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *hxID;
- (instancetype)initWithID:(NSUInteger)ID name:(NSString *)name hxID:(NSString *)hxID;
@end
