//
//  RatingView.h
//  House
//
//  Created by dlut on 15/12/30.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingView : UIView
@property(nonatomic, assign) NSUInteger ratingRedNumber;
@property(nonatomic, assign) CGFloat spacing;
- (instancetype)initWithFrame:(CGRect)frame spacing:(CGFloat)spacing;
- (void)setRatingRedNumber:(NSUInteger)ratingRedNumber width:(CGFloat)width;
+ (CGFloat)getWidth:(CGFloat)width spacing:(CGFloat)spacing;
+ (CGFloat)height;
@end
