//
//  CircleInfo.h
//  House
//
//  Created by dlut on 15/12/13.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import "BaseModel.h"

@interface CircleInfo : BaseModel
@property(nonatomic, copy) NSString *url;
- (instancetype)initWithID:(NSUInteger)ID url:(NSString *)url;
@end
