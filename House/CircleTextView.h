//
//  CircleTextView.h
//  House
//
//  Created by dlut on 16/3/11.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"

@class CircleTextView;
@protocol CircleTextViewDelegate <NSObject>
- (void)circleTextView:(CircleTextView *)circleTextView didSelectedAtIndex:(NSUInteger)index;
@end

@interface CircleTextView : UIView<MenuViewDelegate>
@property(nonatomic, weak) id<CircleTextViewDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;
- (void)selectedAtIndex:(NSUInteger)index;
@end
