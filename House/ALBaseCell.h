//
//  ALBaseCell.h
//  House
//
//  Created by dlut on 15/12/11.
//  Copyright © 2015年 dlut. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "PINImageView+PINRemoteImage.h"

@class BaseModel;
@interface ALBaseCell : UITableViewCell
+ (CGFloat)height;
- (void)layoutCellWithBaseModel:(BaseModel *)baseModel;
@end
