//
//  HouseDetailView.h
//  House
//
//  Created by dlut on 16/3/10.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HouseDetail;
@interface HouseDetailView : UIView
+ (CGFloat)height;
- (void)updateWithHouse:(HouseDetail *)houseDetail;
@end
