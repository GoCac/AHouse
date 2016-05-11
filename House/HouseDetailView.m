//
//  HouseDetailView.m
//  House
//
//  Created by dlut on 16/3/10.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "HouseDetailView.h"
#import "JCPrefixHeader.pch"
#import "StringUtils.h"
#import "NSString+Height.h"
#import "HouseDetail.h"
#define TITLE_FONT_NAME_SIZE 17.0f
#define DETAIL_FONT_NAME_SIZE 16.0f
#define TITLE_FONT_NAME @"Avenir-Book"
#define TITLE_PADDING 15
#define TITLE_WIDTH_RATE 0.3
#define TITLE_WIDTH SCREEN_WIDTH * TITLE_WIDTH_RATE
#define PHONE_HEIGHT 56

@interface HouseDetailView ()
@property(nonatomic, strong) UILabel *address;
@property(nonatomic, strong) UILabel *houseType;
@property(nonatomic, strong) UILabel *forceType;
@property(nonatomic, strong) UILabel *avgPrice;
@property(nonatomic, strong) UILabel *phone;
@property(nonatomic, strong) UIButton *chat;
@end

@implementation HouseDetailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGFloat titleHeight = [HouseDetailView titleHeight];
        NSArray *titles = [NSArray arrayWithObjects:@"楼盘地址:", @"物业类型:", @"主力户型:", @"楼盘均价:", @"咨询热线", nil];
        UIFont *titleFont = [UIFont fontWithName:TITLE_FONT_NAME size:TITLE_FONT_NAME_SIZE];
        NSUInteger i = 0;
        for (NSString *title in titles) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, titleHeight * i, TITLE_WIDTH, titleHeight)];
            [label setBackgroundColor:[UIColor yellowColor]];
            [label setText:title];
            [label setTextAlignment:NSTextAlignmentCenter];
            [label setFont:titleFont];
            [self addSubview:label];
            i++;
        }
        i = 0;
        CGFloat detailWidth = SCREEN_WIDTH * (1 - TITLE_WIDTH_RATE);
        UIFont *detailFont = [UIFont fontWithName:TITLE_FONT_NAME size:DETAIL_FONT_NAME_SIZE];
        self.address = [[UILabel alloc] initWithFrame:CGRectMake(TITLE_WIDTH, i * titleHeight, detailWidth, titleHeight)];
//        [self.address setText:@"哈哈哈哈哈哈哈哈哈哈哈"];
        [self.address setBackgroundColor:[UIColor redColor]];
        [self.address setFont:detailFont];
        [self.address setTextColor:[UIColor lightGrayColor]];
        [self addSubview:self.address];
        i++;
        self.houseType = [[UILabel alloc] initWithFrame:CGRectMake(TITLE_WIDTH, titleHeight * i, detailWidth, titleHeight)];
//        [self.houseType setText:@"哈哈哈哈哈哈哈"];
        [self.houseType setBackgroundColor:[UIColor greenColor]];
        [self.houseType setFont:detailFont];
        [self.houseType setTextColor:[UIColor lightGrayColor]];
        [self addSubview:self.houseType];
        i++;
        self.forceType = [[UILabel alloc] initWithFrame:CGRectMake(TITLE_WIDTH, titleHeight * i, detailWidth, titleHeight)];
//        [self.forceType setText:@"物业类型是什么什么"];
        [self.forceType setBackgroundColor:[UIColor redColor]];
        [self.forceType setFont:detailFont];
        [self.forceType setTextColor:[UIColor lightGrayColor]];
        [self addSubview:self.forceType];
        i++;
        self.avgPrice = [[UILabel alloc] initWithFrame:CGRectMake(TITLE_WIDTH, titleHeight * i, detailWidth, titleHeight)];
//        [self.avgPrice setText:@"均价大大大大大大"];
        [self.avgPrice setBackgroundColor:[UIColor greenColor]];
        [self.avgPrice setFont:detailFont];
        [self.avgPrice setTextColor:[UIColor lightGrayColor]];
        [self addSubview:self.avgPrice];
        i++;
        self.phone = [[UILabel alloc] initWithFrame:CGRectMake(TITLE_WIDTH, titleHeight * i, detailWidth, titleHeight)];
//        [self.phone setText:@"13699297633"];
        [self.phone setBackgroundColor:[UIColor redColor]];
        [self.phone setFont:detailFont];
        [self.phone setTextColor:[UIColor grayColor]];
        [self addSubview:self.phone];
        i++;
        self.chat = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.chat setFrame:CGRectMake(0, titleHeight * i, SCREEN_WIDTH, PHONE_HEIGHT)];
//        [self.chat.layer setCornerRadius:5.0f];
        [self.chat setBackgroundColor:[UIColor orangeColor]];
        [self.chat setTitle:@"在线咨询" forState:UIControlStateNormal];
        [self.chat setImage:[UIImage imageNamed:@"star.png"] forState:UIControlStateNormal];
        [self.chat setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self addSubview:self.chat];
    }
    return self;
}

- (void)updateWithHouse:(HouseDetail *)houseDetail {
    [self.address setText:houseDetail.address];
    [self.houseType setText:houseDetail.houseType];
    [self.forceType setText:houseDetail.forceType];
    [self.avgPrice setText:houseDetail.avgPrice];
    [self.phone setText:houseDetail.phone];
}

+ (CGFloat)titleHeight {
    static CGFloat height = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        height = [NSString heightSingle:[UIFont fontWithName:TITLE_FONT_NAME size:TITLE_FONT_NAME_SIZE]] + TITLE_PADDING;
    });
    return height;
}

+ (CGFloat)height {
    static CGFloat height = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        height = [HouseDetailView titleHeight] * 5 + PHONE_HEIGHT;
    });
    return height;
}

@end
