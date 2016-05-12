//
//  UIButton+Selector.m
//  House
//
//  Created by DUT_WuJie on 16/5/12.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "UIButton+Selector.h"

@implementation UIButton (Selector)
-(void) setSelector {
    [self addTarget:self action:@selector(pressDown) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(pressUp) forControlEvents:UIControlEventTouchDragOutside];
    [self addTarget:self action:@selector(pressUp) forControlEvents:UIControlEventTouchUpInside];
}

-(void) pressDown {
    [self setBackgroundColor:[UIColor colorWithRed:204.0 / 255 green:0 blue:0 alpha:1.0]];
}

-(void) pressUp {
    [self setBackgroundColor:[UIColor redColor]];
}
@end
