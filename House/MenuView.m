//
//  MenuView.m
//  House
//
//  Created by dlut on 16/3/11.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "MenuView.h"
#define kNormalColor [UIColor lightGrayColor]
#define kSelectedColor [UIColor whiteColor]

@implementation MenuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title {
    if (self = [super initWithFrame:frame]) {
        self.title = title;
        self.normalColor = kNormalColor;
        self.selectedColor = kSelectedColor;
        [self setText:title];
        [self setTextColor:self.normalColor];
        _selected = NO;
        [self setUserInteractionEnabled:YES];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)]];
    }
    return self;
}

- (void)setSelected:(Boolean)selected {
    if (_selected == selected) {
        return;
    }
    if (selected) {
        [self setTextColor:self.selectedColor];
        [self setBackgroundColor:[UIColor redColor]];
    } else {
        [self setTextColor:self.normalColor];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    _selected = selected;
}

- (void)click:(UITapGestureRecognizer *)gesture {
    if ([self.delegate respondsToSelector:@selector(menuViewDidClicked:)]) {
        [self.delegate menuViewDidClicked:self];
    }
}


@end
