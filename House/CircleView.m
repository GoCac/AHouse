//
//  CircleView.m
//  House
//
//  Created by dlut on 15/11/5.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "CircleView.h"
#import "JCPrefixHeader.pch"
#import "PINImageView+PINRemoteImage.h"
#import "StringUtils.h"
#import "ImageUtil.h"

@interface CircleView () <UIScrollViewDelegate>
@property(nonatomic, assign) BOOL isLocalRes;
@property(nonatomic, assign) NSUInteger num;
@property(nonatomic, strong) NSMutableArray *array;
@property(nonatomic, assign) NSUInteger currentPage;
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UIPageControl *pageControl;
@property(nonatomic, assign) BOOL first;
@end

@implementation CircleView
- (instancetype)initWithFrame:(CGRect)frame autoPlay:(BOOL)autoPlay images:(NSArray *)images timeInterval:(NSUInteger)timeInterval {
    if(self = [super initWithFrame:frame]) {
        [self initWithAutoPlay:autoPlay timeInterval:timeInterval];
        _images = images;
        self.isLocalRes = YES;
        self.num = [self.images count];
        [self initSubiews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame autoPlay:(BOOL)autoPlay imageUrls:(NSArray *)imageUrls timeInterval:(NSUInteger)timeInterval {
    if(self = [super initWithFrame:frame]) {
        [self initWithAutoPlay:autoPlay timeInterval:timeInterval];
        _imageUrls = imageUrls;
        self.isLocalRes = NO;
        self.num = [self.imageUrls count];
        [self initSubiews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame autoPlay:(BOOL)autoPlay timeInterval:(NSUInteger)timeInterval {
    if (self = [super initWithFrame:frame]) {
        [self initWithAutoPlay:autoPlay timeInterval:timeInterval];
        self.num = 0;
        self.first = true;
    }
    return self;
}

- (void)setImages:(NSArray *)images {
    self.isLocalRes = YES;
    if (!self.first) {
        [self stopCircle];
    }
    self.num = [images count];
    _images = images;
    if (self.first) {
        [self initSubiews];
    } else {
        [self reloadDatas];
    }
}

- (void)setImageUrls:(NSArray *)imageUrls {
    self.isLocalRes = NO;
    if (!self.first) {
        [self stopCircle];
    }
    self.num = [imageUrls count];
    _imageUrls = imageUrls;
    if (self.first) {
        [self initSubiews];
    } else {
        [self reloadDatas];
    }
}

- (void)initWithAutoPlay:(BOOL)autoPlay timeInterval:(NSUInteger)timeInterval {
    self.autoPlay = autoPlay;
    self.timeInterval = timeInterval > 0 ? timeInterval : 0;
    self.currentPage = 0;
}

- (void)stopCircle {
    if (self.isAutoPlay) {
        [NSTimer cancelPreviousPerformRequestsWithTarget:self selector:@selector(circle) object:nil];
        [self setAutoPlay:NO];
    }
}

- (void)startCircle {
    if (!self.isAutoPlay && self.timeInterval > 0.f && self.num > 0) {
        [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(circle) userInfo:nil repeats:YES];
        [self setAutoPlay:YES];
    }
}

- (void)initSubiews {
    [self addScrollView];
    [self addPageControl];
    if (self.autoPlay && self.timeInterval > 0.f && self.num > 0) {
        [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(circle) userInfo:nil repeats:YES];
    }
}

- (void)circle {
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 2, 0) animated:YES];
}

- (void)reloadDatas {
    [[self.scrollView subviews] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        [view removeFromSuperview];
    }];
    [self addImageViews];
    [self.pageControl setNumberOfPages:self.num];
    [self startCircle];
}

- (void)addImageViews {
    if (!self.isLocalRes && nil == self.imageUrls) {
        return;
    }
    NSArray *temArray = self.array;
    for (NSUInteger i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, self.bounds.size.height)];
        if (self.isLocalRes) {
            [imageView setImage:[UIImage imageNamed:(NSString *)[temArray objectAtIndex:i]]];
        } else {
            [imageView pin_setImageFromURL:[NSURL URLWithString:[StringUtils originImageUrl:temArray[i]]] placeholderImage:[ImageUtil placeholderImage]];
            NSLog(@"ii = %ld, url is %@", i, temArray[i]);
        }
//        [imageView setContentMode:UIViewContentModeLeft];
        [self.scrollView addSubview:imageView];
    }
}

- (void)addScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addImageViews];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    [self.scrollView setContentSize:CGSizeMake(SCREEN_WIDTH * 3, self.bounds.size.height)];
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0)];
    [self.scrollView setDelegate:self];
    [self.scrollView setPagingEnabled:YES];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidClick)];
    [self.scrollView addGestureRecognizer:tapGesture];
    [self addSubview:self.scrollView];
    self.first = NO;
}

- (void)scrollViewDidClick {
    if ([self.delegate respondsToSelector:@selector(circleViewDidSelectImage:atIndex:)]) {
        [self.delegate circleViewDidSelectImage:self atIndex:self.currentPage];
    } else if (nil != self.circleViewClickBlock) {
        self.circleViewClickBlock(self, self.currentPage);
    }
}

- (void)addPageControl {
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 20, SCREEN_WIDTH, 20)];
    [self.pageControl setNumberOfPages:self.num];
    [self.pageControl setCurrentPage:self.currentPage];
    [self.pageControl setUserInteractionEnabled:NO];
    [self addSubview:self.pageControl];
}

- (NSArray *)array {
    if (nil == _array) {
        self.array = [[NSMutableArray alloc] initWithCapacity:3];
    }
    [_array removeAllObjects];
    NSUInteger left = (self.currentPage - 1 + self.num) % self.num;
    NSUInteger right = (self.currentPage + 1) % self.num;
    if (self.isLocalRes) {
        [_array addObject:self.images[left]];
        [_array addObject:self.images[self.currentPage]];
        [_array addObject:self.images[right]];
    } else {
        [_array addObject:self.imageUrls[left]];
        [_array addObject:self.imageUrls[self.currentPage]];
        [_array addObject:self.imageUrls[right]];
    }
    return _array;
}

//给图片重新赋值，调整pageControl；
- (void)refresh {
    NSArray *subviews = [self.scrollView subviews];
    NSArray *temArray = self.array;
    for (NSUInteger i = 0; i < [subviews count]; i++) {
        UIImageView *imageView = (UIImageView*)[subviews objectAtIndex:i];
        if (self.isLocalRes) {
            [imageView setImage:[UIImage imageNamed:(NSString *)temArray[i]]];
        } else {
            [imageView pin_setImageFromURL:[NSURL URLWithString:[StringUtils originImageUrl:temArray[i]]] placeholderImage:[ImageUtil placeholderImage]];
            NSLog(@"i = %ld, url is %@", i, self.array[i]);
        }
    }
    [self.pageControl setCurrentPage:self.currentPage];
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;
    if (point.x <= 0) {
        self.currentPage = (self.currentPage - 1 + self.num) % self.num;
        [self refresh];
    } else if (point.x >= 2 * SCREEN_WIDTH) {
        self.currentPage = (self.currentPage + 1) % self.num;
        [self refresh];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
