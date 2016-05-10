//
//  UILabel+ContentSize.m
//  House
//
//  Created by dlut on 15/11/24.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "UILabel+ContentSize.h"
#import "JCPrefixHeader.pch"

@implementation UILabel (ContentSize)
- (CGFloat)contentSingleHeight {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = self.textAlignment;
    NSDictionary *dic = @{NSFontAttributeName : self.font, NSParagraphStyleAttributeName : style};
    static const NSString *content = @"ContentSize";
    CGSize size = [content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}
@end
