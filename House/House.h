//
//  House.h
//  House
//
//  Created by dlut on 15/11/5.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "BaseModel.h"
#import "StringUtils.h"

@interface House : BaseModel

@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *hxUrl;
@property(nonatomic, copy) NSString *videoUrl;
@property(nonatomic, copy) NSString *otherUrl;
@property(nonatomic, copy) NSString *circleUrl;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *intro;
@property(nonatomic, copy) NSString *phone;
@property(nonatomic, strong) NSNumber *lat;
@property(nonatomic, strong) NSNumber *lng;
@property(nonatomic, assign) NSUInteger stars;
@property(nonatomic, copy) NSString *labelContent;
@property(nonatomic, copy) NSArray *labelResult;
@property(nonatomic, copy) NSArray *imageUrls;
@property(nonatomic, copy) NSString *circleUrls;

- (instancetype)initWithID:(NSUInteger)ID url:(NSString *)url name:(NSString *)name intro:(NSString *)intro phone:(NSString *)phone lat:(NSNumber *)lat lng:(NSNumber *)lng stars:(NSUInteger)stars labelContent:(NSString *)labelContent;

- (instancetype)initWithID:(NSUInteger)ID url:(NSString *)url name:(NSString *)name intro:(NSString *)intro phone:(NSString *)phone lat:(NSNumber *)lat lng:(NSNumber *)lng;

@end
