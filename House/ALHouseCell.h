//
//  ALHouseCell.h
//  House
//
//  Created by dlut on 15/11/23.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCPrefixHeader.pch"
#import "ALBaseCell.h"
#import "RatingView.h"

@interface ALHouseCell : ALBaseCell
@property(nonatomic, strong) UIImageView *picture;
@property(nonatomic, strong) UILabel *name;
@property(nonatomic, strong) UILabel *intro;
@property(nonatomic, strong) UILabel *phone;
@property(nonatomic, strong) RatingView *ratingView;
@property(nonatomic, strong) UILabel *labelFirst;
@property(nonatomic, strong) UILabel *labelOthers;
@end
