//
//  CircleTextView.m
//  House
//
//  Created by dlut on 16/3/11.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "CircleTextView.h"
#import "JCPrefixHeader.pch"
#define kMenuViewHeight 40

@interface CircleTextView () <UIScrollViewDelegate>
@property(nonatomic, strong) NSArray *titles;
@property(nonatomic, assign) NSUInteger currentIndex;
@property(nonatomic, strong) NSMutableArray *items;
@property(nonatomic, assign) NSUInteger number;
@property(nonatomic, strong) UIScrollView *scrollView;
@end

@implementation CircleTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    if (self = [super initWithFrame:frame]) {
        NSAssert((nil != titles && [titles count] > 0), @"titles should not be nil and empty");
        self.titles = titles;
        self.number = [titles count];
        self.currentIndex = 0;
        self.items = [[NSMutableArray alloc] init];
        [self initMenuViews];
    }
    return self;
}

- (void)initMenuViews {
    NSUInteger number = [self.titles count];
    CGFloat width = SCREEN_WIDTH / number;
    NSUInteger i = 0;
    for (NSString *title in self.titles) {
        MenuView *menuView = [[MenuView alloc] initWithFrame:CGRectMake(i * width, 0, width, kMenuViewHeight) title:title];
        [menuView setSelected:i == self.currentIndex];
        [menuView setIndex:i];
        [menuView setTextAlignment:NSTextAlignmentCenter];
        [menuView setDelegate:self];
        [self addSubview:menuView];
        [self.items addObject:menuView];
        i++;
    }
    CGFloat height = self.frame.size.height - kMenuViewHeight;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kMenuViewHeight, SCREEN_WIDTH, height)];
    [self.scrollView setContentSize:CGSizeMake(SCREEN_WIDTH * number, height)];
    [self.scrollView setContentOffset:CGPointZero animated:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setDelegate:self];
    for (i = 0; i < number; i++) {
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, height)];
        [textView setText:[NSString stringWithFormat:@"hello world %lu", i]];
        [self.scrollView addSubview:textView];
    }
    [self addSubview:self.scrollView];
}

- (void)selectedAtIndex:(NSUInteger)index {
    NSAssert((index >= 0 && index < self.number), @"index should be >=0 and < %ld", self.number);
    if (self.currentIndex == index) {
        return;
    }
    MenuView *preMenuView = [self.items objectAtIndex:self.currentIndex];
    [preMenuView setSelected:NO];
    MenuView *curMenuView = [self.items objectAtIndex:index];
    [curMenuView setSelected:YES];
    self.currentIndex = index;
}

- (void)menuViewDidClicked:(MenuView *)menuView {
    NSUInteger index = [menuView index];
    [self selectedAtIndex:index];
    if ([self.delegate respondsToSelector:@selector(circleTextView:didSelectedAtIndex:)]) {
        [self.delegate circleTextView:self didSelectedAtIndex:index];
    }
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = [scrollView contentOffset];
    if (fmod(point.x, SCREEN_WIDTH) == 0.0f) {
        NSLog(@"point x is %f", point.x);
        [self selectedAtIndex:(point.x / SCREEN_WIDTH)];
    }
}

@end
