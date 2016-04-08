//
//  ALActivityCell.h
//  House
//
//  Created by dlut on 15/11/25.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALBaseCell.h"

@interface ALActivityCell : ALBaseCell
@property(nonatomic, strong) UIImageView *picture;
@property(nonatomic, strong) UILabel *title;
@property(nonatomic, strong) UILabel *time;
@end
