//
//  NSString+Height.m
//  House
//
//  Created by dlut on 15/11/24.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "NSString+Height.h"
#import "JCPrefixHeader.pch"

@implementation NSString (Height)
+ (CGFloat)heightSingle:(UIFont *)font {
    static NSString *content = @"hello world";
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentLeft;
    style.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize size = [content sizeWithAttributes:@{NSFontAttributeName : font, NSParagraphStyleAttributeName : style}];
    return size.height;
}

+(CGSize)heightMultip:(UIFont*) font withString:(NSString*) str withWidth:(CGFloat) width {
    CGSize titleSize = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return titleSize;
}

+(CGSize)heightMultip:(UIFont*) font withString:(NSString*) str {
    CGSize titleSize = [str boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return titleSize;
}
@end

