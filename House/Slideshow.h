//
//  Slideshow.h
//  House
//
//  Created by dlut on 16/1/5.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "BaseModel.h"

@interface Slideshow : BaseModel
@property(nonatomic, copy) NSString *picUrl;
- (instancetype)initWithID:(NSUInteger)ID picUrl:(NSString *)picUrl;
@end
