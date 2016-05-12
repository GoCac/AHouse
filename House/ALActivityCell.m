//
//  ALActivityCell.m
//  House
//
//  Created by dlut on 15/11/25.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "ALActivityCell.h"
#import "JCPrefixHeader.pch"
#import "View+MASAdditions.h"
#import "Activity.h"
#import "NSString+Height.h"
#import "UILabel+ContentSize.h"

#define kPaddingCommon 20
#define kWidthAndHeightRate 0.618
#define ACTIVITYCELL_PIC_WIDTH (SCREEN_WIDTH - 2 * kPaddingCommon)
#define ACTIVITYCELL_PIC_HEIGHT ACTIVITYCELL_PIC_WIDTH * kWidthAndHeightRate
#define ACTIVITY_FONT_NAME @"Avenir-Book"
#define ACTIVITY_FONT_TITLE_SIZE 18.0f
#define ACTIVITY_FONT_DETAIL_SIZE 16.0f

@interface ALActivityCell ()
@property(nonatomic, strong) UILabel *detail;
@end

@implementation ALActivityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIFont *fontTitle = [UIFont fontWithName:ACTIVITY_FONT_NAME size:ACTIVITY_FONT_TITLE_SIZE];
        self.title = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.title setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.title setFont:fontTitle];
        [self.contentView addSubview:self.title];
        
        self.picture = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.picture.layer setCornerRadius:5.0f];
        [self.picture.layer setMasksToBounds:YES];
        [self.picture setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.picture];
        self.time = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.time setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.time setFont:fontTitle];
        [self.time setTextColor:[UIColor grayColor]];
        [self.contentView addSubview:self.time];
        
        self.detail = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.detail setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.detail setFont:[UIFont fontWithName:ACTIVITY_FONT_NAME size:ACTIVITY_FONT_DETAIL_SIZE]];
        [self.detail setText:@"查看详情"];
        [self.detail setTextColor:[UIColor grayColor]];
        [self.contentView addSubview:self.detail];
        
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(8);
            make.left.equalTo(self.contentView.mas_left).with.offset(kPaddingCommon);
        }];
        
        [self.picture mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom).with.offset(8);
            make.left.equalTo(self.contentView.mas_left).with.offset(kPaddingCommon);
            make.right.equalTo(self.contentView.mas_right).with.offset(-kPaddingCommon);
            //make.bottom.equalTo(self.title.mas_bottom).with.offset(ACTIVITYCELL_PIC_HEIGHT);
        }];
        
        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.picture.mas_bottom).with.offset(8);
            make.left.equalTo(self.contentView.mas_left).with.offset(kPaddingCommon);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-kPaddingCommon);
        }];
        [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.picture.mas_bottom).with.offset(8);
            make.left.equalTo(self.time.mas_right).with.offset(kPaddingCommon);
            make.right.equalTo(self.contentView.mas_right).with.offset(-kPaddingCommon);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-kPaddingCommon);
        }];
//        [self.layer setMasksToBounds:YES];
//        [self.layer setCornerRadius:5.0f];
//        [self.contentView setBackgroundColor:[UIColor redColor]];
    }
    return self;
}

- (void)layoutCellWithBaseModel:(BaseModel *)baseModel {
    Activity *activity = (Activity *)baseModel;
    [self.title setText:activity.title];
    if (PRODUCT) {
        [self.picture setImage:PLACE_HOLDER_IMAGE];
    } else {
        [self.picture pin_setImageFromURL:[NSURL URLWithString:[IMAGE_SERVER_ORIGIN_URL stringByAppendingString:activity.picUrl]] placeholderImage:PLACE_HOLDER_IMAGE];
        
    }
    [self.time setText:activity.time];
    if ([activity isFirst]) {
        NSLog(@"This cell is first.");
    }
}

+ (CGFloat)height {
    static CGFloat height = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        height += 2 * [NSString heightSingle:[UIFont fontWithName:ACTIVITY_FONT_NAME size:ACTIVITY_FONT_TITLE_SIZE]];
        height += ACTIVITYCELL_PIC_HEIGHT + kPaddingCommon + 3 * 8;
    });
    return height;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
