//
//  NSString+Height.h
//  House
//
//  Created by dlut on 15/11/24.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CGGeometry.h>

@interface NSString (Height)
+ (CGFloat)heightSingle:(UIFont*)font;
+ (CGSize)heightMultip:(UIFont*) font withString:(NSString*) str withWidth:(CGFloat) width;
+ (CGSize)heightMultip:(UIFont*) font withString:(NSString*) str;
@end
