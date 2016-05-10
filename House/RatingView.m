//
//  RatingView.m
//  House
//
//  Created by dlut on 15/12/30.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import "RatingView.h"

#define ALL_NUMBER 5

@implementation RatingView

- (instancetype)initWithFrame:(CGRect)frame spacing:(CGFloat)spacing {
    if (self = [super initWithFrame:frame]) {
        self.spacing = spacing;
        NSAssert(self.spacing >= 0, @"spacing should be >= 0");
    }
    return self;
}

- (void)setRatingRedNumber:(NSUInteger)ratingRedNumber width:(CGFloat)width {
    NSAssert((ratingRedNumber <= ALL_NUMBER && ratingRedNumber >= 0), @"ratingredNumber should be >= 0 and <= 5");
    if (_ratingRedNumber == ratingRedNumber && ratingRedNumber > 0) {
        return;
    }
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
    for (NSUInteger i = 0; i < ALL_NUMBER; i++) {
        UIImageView *imageView;
        if (i < ratingRedNumber) {
            imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star.png"]];
            
        } else {
            imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home.png"]];
        }
        [imageView setFrame:CGRectMake((width + self.spacing) * i, 0, width, width)];
        [self addSubview:imageView];
    }
    _ratingRedNumber = ratingRedNumber;
}

+ (CGFloat)getWidth:(CGFloat)width spacing:(CGFloat)spacing {
    return (spacing + width) * ALL_NUMBER;
}

+ (CGFloat)height {
    UIImage *image = [UIImage imageNamed:@"star.png"];
    return image.size.height;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
