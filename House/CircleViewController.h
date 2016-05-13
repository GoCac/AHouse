//
//  CircleViewController.h
//  House
//
//  Created by dlut on 16/5/9.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "BaseViewController.h"
@class HouseDetail;
@interface CircleViewController : BaseViewController
@property(nonatomic, copy) NSArray *urls;
@property(nonatomic, strong) HouseDetail *house;
@end
