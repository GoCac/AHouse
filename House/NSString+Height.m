//
//  NSString+Height.m
//  House
//
//  Created by dlut on 15/11/24.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "NSString+Height.h"

@implementation NSString (Height)
+ (CGFloat)heightSingle:(UIFont *)font {
    static NSString *content = @"hello world";
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentLeft;
    style.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize size = [content sizeWithAttributes:@{NSFontAttributeName : font, NSParagraphStyleAttributeName : style}];
    return size.height;
}
@end
