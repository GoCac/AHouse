//
//  ALHouseCell.m
//  House
//
//  Created by dlut on 15/11/23.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "ALHouseCell.h"
#import "View+MASAdditions.h"
#import "House.h"
#import "NSString+Height.h"
#import "UILabel+ContentSize.h"

#define kPaddingCommon 2
#define kPaddingTopAndBottom 3
#define kWidthAndHeightRate 1.618
#define FONT_NAME @"Avenir-Book"
#define FONT_NAME_SIZE 17.0f
#define FONT_INTRO_SIZE 15.0f
#define FONT_PHONE_SIZE 16.0f
#define FONT_LABEL_SIZE 12.0f
#define kRatingViewHeight 10
#define kRatingViewSpacing 2
#define kPaddingLabelAndPhoneSpacing 3

@implementation ALHouseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat height = [self imageHeight];
        UIFont *fontName = [UIFont fontWithName:FONT_NAME size:FONT_NAME_SIZE];
        self.name = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.name setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.name setFont:fontName];
        [self.contentView addSubview:self.name];
        
        UIFont *fontIntro = [UIFont fontWithName:FONT_NAME size:FONT_INTRO_SIZE];
        self.intro = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.intro setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.intro setLineBreakMode:NSLineBreakByWordWrapping];
        [self.intro setNumberOfLines:2];
//        [self.intro setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:self.intro];
        
        UIFont *fontPhone = [UIFont fontWithName:FONT_NAME size:FONT_PHONE_SIZE];
        self.phone = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.phone setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.phone setFont:fontPhone];
        [self.contentView addSubview:self.phone];
        
        CGFloat imageWidth = kWidthAndHeightRate * height;
        self.picture = [[UIImageView alloc] initWithFrame:CGRectMake(kPaddingCommon, kPaddingCommon, imageWidth,  height)];
        [self.contentView addSubview:self.picture];
        
        self.ratingView = [[RatingView alloc] initWithFrame:CGRectMake(0, 0, [RatingView getWidth:kRatingViewHeight spacing:kRatingViewSpacing], kRatingViewHeight) spacing:kRatingViewSpacing];
        [self.ratingView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.ratingView];
        
        self.labelFirst = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.labelFirst setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.labelFirst setLineBreakMode:NSLineBreakByWordWrapping];
        [self.labelFirst setNumberOfLines:0];
        [self.labelFirst setFont:fontIntro];
        [self.contentView addSubview:self.labelFirst];
        
        UIFont *fontLabel = [UIFont fontWithName:FONT_NAME size:FONT_LABEL_SIZE];
        self.labelOthers = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.labelOthers setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.labelOthers setLineBreakMode:NSLineBreakByWordWrapping];
        [self.labelOthers setFont:fontLabel];
        [self.labelOthers setNumberOfLines:0];
        [self.contentView addSubview:self.labelOthers];

        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(2 * kPaddingCommon + imageWidth);
            make.top.equalTo(self.contentView.mas_top).with.offset(kPaddingTopAndBottom);
        }];
        [self.ratingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(2 * kPaddingCommon + imageWidth);
            make.top.equalTo(self.name.mas_bottom).with.offset(0);
            make.bottom.equalTo(self.intro.mas_top).with.offset(0);
        }];
        [self.intro mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(2 * kPaddingCommon + imageWidth);
//            make.top.equalTo(self.ratingView.mas_bottom).with.offset(0);
            make.right.equalTo(self.contentView.mas_right).with.offset(-kPaddingCommon);
//            make.center.equalTo(self.contentView).centerOffset(CGPointMake(0.5 * (kPaddingCommon + imageWidth), 0.5 * (kRatingViewHeight - [NSString heightSingle:[UIFont fontWithName:FONT_NAME size:FONT_PHONE_SIZE]])));
//            make.bottom.equalTo(self.phone.mas_top).with.offset(0);
        }];
        [self.phone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.intro.mas_bottom).with.offset(0);
            make.left.equalTo(self.contentView.mas_left).with.offset(2 * kPaddingCommon + imageWidth);
//            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-(kPaddingCommon));
        }];
//        [self.phone setBackgroundColor:[UIColor orangeColor]];
        [self.labelFirst mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-kPaddingCommon);
            make.left.equalTo(self.contentView.mas_left).with.offset(2 * kPaddingCommon);
            make.top.equalTo(self.phone.mas_bottom).with.offset(kPaddingLabelAndPhoneSpacing);
        }];
        [self.labelOthers mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.phone.mas_bottom).with.offset(kPaddingLabelAndPhoneSpacing);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-kPaddingCommon);
            make.left.equalTo(self.labelFirst.mas_right).with.offset(kPaddingCommon * 3);
            make.right.equalTo(self.contentView.mas_right).with.offset(-kPaddingCommon);
        }];
    }
    return self;
}

- (void)layoutCellWithBaseModel:(BaseModel *)baseModel {
    House *house = (House *)baseModel;
    if (PRODUCT) {
        [self.picture setImage:PLACE_HOLDER_IMAGE];
    } else {
        [self.picture pin_setImageFromURL:[NSURL URLWithString:[IMAGE_SERVER_THUMBNAIL_URL stringByAppendingString:house.url]] placeholderImage:PLACE_HOLDER_IMAGE];
    }
    [self.labelFirst setText:[house.labelResult objectAtIndex:0]];
    [self.labelOthers setText:[house.labelResult objectAtIndex:1]];
    [self.name setText:house.name];
    [self.ratingView setRatingRedNumber:house.stars width:kRatingViewHeight];
    [self.intro setText:house.intro];
    [self.intro setBackgroundColor:[UIColor orangeColor]];
    [self.phone setText:house.phone];
    NSLog(@"url is %@", house.url);
    NSLog(@"hxUrl is %@", house.hxUrl);
    NSLog(@"videoUrl is %@", house.videoUrl);
    NSLog(@"otherUrl is %@", house.otherUrl);
    NSLog(@"circleUrl is %@, circleUrls is %@", house.circleUrl, house.circleUrls);
    NSLog(@"labelContent is %@, labelResult is %@", house.labelContent, house.labelResult);
}

+ (CGFloat)height {
    static CGFloat height = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        height += [NSString heightSingle:[UIFont fontWithName:FONT_NAME size:FONT_NAME_SIZE]];
        //1是下面label的高度
        height += (2 + 1) * [NSString heightSingle:[UIFont fontWithName:FONT_NAME size:FONT_INTRO_SIZE]];
        height += [NSString heightSingle:[UIFont fontWithName:FONT_NAME size:FONT_PHONE_SIZE]];
        height += kRatingViewHeight;
        height += 2 * kPaddingTopAndBottom + kPaddingLabelAndPhoneSpacing;
    });
    return height;
}

- (CGFloat)imageHeight {
    return [ALHouseCell height] - [NSString heightSingle:[UIFont fontWithName:FONT_NAME size:FONT_NAME_SIZE]] - 2 * kPaddingCommon - kPaddingLabelAndPhoneSpacing;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
