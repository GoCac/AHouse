//
//  StringUtils.h
//  House
//
//  Created by dlut on 16/1/11.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtils : NSObject
+ (Boolean)isEmpty:(NSString *)str;
+ (NSArray *)parseSemContent:(NSString *)semContent;
@end
