//
//  ImageUtil.m
//  House
//
//  Created by dlut on 16/5/12.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "ImageUtil.h"
@implementation ImageUtil
+ (UIImage *)placeholderImage {
    static UIImage *image;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        image = [UIImage imageNamed:@"failure_image_red.png"];
    });
    return image;
}
@end
