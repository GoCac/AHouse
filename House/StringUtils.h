//
//  StringUtils.h
//  House
//
//  Created by dlut on 16/1/11.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCPrefixHeader.pch"

@interface StringUtils : NSObject
+ (Boolean)isEmpty:(NSString *)str;
+ (NSArray *)parseSemContent:(NSString *)semContent;
+ (NSArray *)parseLabelContent:(NSString *)labelContent;
+ (NSString *)originImageUrl:(NSString *)url;
+ (NSArray *)parseImageOriginUrls:(NSString *)url;
@end
