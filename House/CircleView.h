//
//  CircleView.h
//  House
//
//  Created by dlut on 15/11/5.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#define CIRCLEVIEW_HEIGHT_RATE 0.25
#define CIRCLEVIEW_HEIGHT (SCREEN_HEIGHT * CIRCLEVIEW_HEIGHT_RATE)

#import <UIKit/UIKit.h>

@class CircleView;
typedef void (^CircleViewClickBlock)(CircleView *circleView, NSUInteger index);

@protocol CircleViewDelegate <NSObject>
@optional
- (void)circleViewDidSelectImage:(CircleView *)circleView atIndex:(NSUInteger)index;
@end

@interface CircleView : UIView
@property(nonatomic, weak) id<CircleViewDelegate> delegate;
@property(nonatomic, copy) CircleViewClickBlock circleViewClickBlock;
@property(nonatomic, assign, getter=isAutoPlay) BOOL autoPlay;
@property(nonatomic, copy) NSArray *images;
@property(nonatomic, copy) NSArray *imageUrls;
@property(nonatomic, assign) NSUInteger timeInterval;

- (instancetype)initWithFrame:(CGRect)frame autoPlay:(BOOL)autoPlay images:(NSArray *) images timeInterval:(NSUInteger)timeInterval;
- (instancetype)initWithFrame:(CGRect)frame autoPlay:(BOOL)autoPlay imageUrls:(NSArray *)imageUrls timeInterval:(NSUInteger)timeInterval;
- (instancetype)initWithFrame:(CGRect)frame autoPlay:(BOOL)autoPlay timeInterval:(NSUInteger)timeInterval;

@end
