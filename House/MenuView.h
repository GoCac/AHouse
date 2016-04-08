//
//  MenuView.h
//  House
//
//  Created by dlut on 16/3/11.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuView;
@protocol MenuViewDelegate <NSObject>
- (void)menuViewDidClicked:(MenuView *)menuView;
@end

@interface MenuView : UILabel
@property(nonatomic, weak) id<MenuViewDelegate> delegate;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) UIColor *normalColor;
@property(nonatomic, strong) UIColor *selectedColor;
@property(nonatomic, assign) NSUInteger index;
@property(nonatomic, assign, getter=isSelected) Boolean selected;
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;
@end
