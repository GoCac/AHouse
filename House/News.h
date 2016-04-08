//
//  News.h
//  News
//
//  Created by dlut on 15/11/5.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "BaseModel.h"

@interface News : BaseModel
@property(nonatomic, copy) NSString *picUrl;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *author;
@property(nonatomic, copy) NSString *time;
- (instancetype)initWithID:(NSUInteger)ID picUrl:(NSString *)picUrl title:(NSString *)title author:(NSString *)author time:(NSString *)time;
@end
