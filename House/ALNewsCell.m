//
//  ALNewsCell.m
//  House
//
//  Created by dlut on 15/11/23.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "ALNewsCell.h"
#import "PINImageView+PINRemoteImage.h"
#import "News.h"
#import "View+MASAdditions.h"
#import "UILabel+ContentSize.h"
#import "NSString+Height.h"


#define kNewsPaddingCommon 9
#define kNewsPaddingTopAndBottom 15

#define kNewsWidthAndHeightRate 1.618
#define NEWS_FONT_NAME @"Avenir-Book"
#define NEWS_FONT_NAME_SIZE 16.0f
#define NEWS_FONT_AUTHOR_SIZE 12.0f
#define NEWS_FONT_DATE_SIZE 12.0f

@implementation ALNewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIFont *fontName = [UIFont fontWithName:NEWS_FONT_NAME size:NEWS_FONT_NAME_SIZE];
        self.title = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.title setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.title setLineBreakMode:NSLineBreakByWordWrapping];
        [self.title setNumberOfLines:2];
        [self.title setFont:fontName];
        [self.contentView addSubview:self.title];
        CGFloat height = [self imageHeight];
        
        self.author = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.author setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.author setFont:[UIFont fontWithName:NEWS_FONT_NAME size:NEWS_FONT_AUTHOR_SIZE]];
        [self.author setTextColor:[UIColor grayColor]];
        [self.contentView addSubview:self.author];
        
        self.time = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.time setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.time setFont:[UIFont fontWithName:NEWS_FONT_NAME size:NEWS_FONT_DATE_SIZE]];
        [self.time setTextColor:[UIColor grayColor]];
        [self.contentView addSubview:self.time];
        
        CGFloat imageWidth = height * kNewsWidthAndHeightRate;
        self.mImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.mImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.mImageView];
        
        [self.mImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(kNewsPaddingTopAndBottom);
            make.left.equalTo(self.contentView.mas_left).with.offset(kNewsPaddingCommon);
            make.right.equalTo(self.contentView.mas_left).with.offset(kNewsPaddingCommon + imageWidth);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-kNewsPaddingTopAndBottom);
        }];
        
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(kNewsPaddingCommon);
            make.left.equalTo(self.mImageView.mas_right).with.offset(kNewsPaddingCommon);
            make.right.equalTo(self.contentView.mas_right).with.offset(-kNewsPaddingCommon);
        }];
        [self.author mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mImageView.mas_right).with.offset(kNewsPaddingCommon);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-kNewsPaddingCommon);
        }];
        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-kNewsPaddingCommon);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-kNewsPaddingCommon);
        }];
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
        [self.selectedBackgroundView setBackgroundColor:[UIColor orangeColor]];
    }
    return self;
}

+ (CGFloat)height {
    static CGFloat height = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        height += 2 * [NSString heightSingle:[UIFont fontWithName:NEWS_FONT_NAME size:NEWS_FONT_NAME_SIZE]];
        height += [NSString heightSingle:[UIFont fontWithName:NEWS_FONT_NAME size:NEWS_FONT_AUTHOR_SIZE]];
        height += 2 * kNewsPaddingCommon + 5;
    });
    return height;
}

- (CGFloat)imageHeight {
    return [ALNewsCell height] - 2 * kNewsPaddingTopAndBottom;
}

- (void)layoutCellWithBaseModel:(BaseModel *)baseModel {
    News *news = (News *)baseModel;
    if (PRODUCT) {
        [self.mImageView setImage:PLACE_HOLDER_IMAGE];
    } else {
        [self.mImageView pin_setImageFromURL:[NSURL URLWithString:[IMAGE_SERVER_THUMBNAIL_URL stringByAppendingString:[news picUrl]]] placeholderImage:PLACE_HOLDER_IMAGE];
    }
    [self.title setText:news.title];
    [self.author setText:news.author];
    [self.time setText:news.time];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
