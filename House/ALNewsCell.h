//
//  ALNewsCell.h
//  House
//
//  Created by dlut on 15/11/23.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCPrefixHeader.pch"
#import "ALBaseCell.h"

@interface ALNewsCell : ALBaseCell
@property(nonatomic, strong) UIImageView *mImageView;
@property(nonatomic, strong) UILabel *title;
@property(nonatomic, strong) UILabel *author;
@property(nonatomic, strong) UILabel *time;
@end
