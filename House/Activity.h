//
//  Activity.h
//  House
//
//  Created by dlut on 15/11/5.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "BaseModel.h"

@interface Activity : BaseModel
@property(nonatomic, copy) NSString *picUrl;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, assign) NSString* isTop;
@property(nonatomic, assign, readonly) BOOL isFirst;

- (instancetype)initWithID:(NSUInteger)ID picUrl:(NSString *)picUrl title:(NSString *)title time:(NSString *)time;

@end
