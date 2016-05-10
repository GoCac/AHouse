//
//  AboutUsViewController.m
//  House
//
//  Created by DUT_WuJie on 16/5/9.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "AboutUsViewController.h"
#import "NSString+Height.h"

#define FONT_NAME @"Avenir-Book"
#define APPNAME_FONT_SIZE 17.0f
#define APPVERSION_FONT_SIZE 14.0f
#define APPINTRO_FONT_SIZE 15.0f

@interface AboutUsViewController ()
@property(nonatomic, strong) UIImageView *logoImageView;
@property(nonatomic, strong) UILabel *appNameLabl;
@property(nonatomic, strong) UILabel *appVersionLabel;
@property(nonatomic, strong) UILabel *appAboutLabel;

@property(nonatomic, strong) UILabel *appCopyRightTopLabel;
@property(nonatomic, strong) UILabel *appCopyRightBottomLabel;

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat startY = 0;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"关于我们";
    self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 32, 64 + 32, 64, 64)];
    [self.logoImageView setImage:[UIImage imageNamed:@"app_icon.png"]];
    startY += 64 + 32 + 64;

    UIFont *font = [UIFont fontWithName:FONT_NAME size:APPNAME_FONT_SIZE];
    NSString *str = @"金宸集团App";
    CGFloat height = [NSString heightSingle:font];
    self.appNameLabl = [[UILabel alloc] initWithFrame:CGRectMake(0, startY += 10, SCREEN_WIDTH, height)];
    [self.appNameLabl setText:str];
    [self.appNameLabl setFont:font];
    [self.appNameLabl setTextAlignment:NSTextAlignmentCenter];
    startY += height;
    
    font = [UIFont fontWithName:FONT_NAME size:APPVERSION_FONT_SIZE];
    str = @"版本:2.0.1";
    height = [NSString heightSingle:font];
    self.appVersionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, startY += 10, SCREEN_WIDTH, height)];
    [self.appVersionLabel setText:str];
    [self.appVersionLabel setFont:font];
    [self.appVersionLabel setTextAlignment:NSTextAlignmentCenter];
    startY += height;
    
    font = [UIFont fontWithName:FONT_NAME size:APPINTRO_FONT_SIZE];
    str = @"    金宸集团App是一款金宸集团出品的房产应用，主要是用来展示公司动态信息，楼盘信息以及最新的活动信息，同时可以提供用户咨询等服务，以此来提高我们的服务水平。";
    CGSize size =[NSString heightMultip:font withString:str withWidth:(SCREEN_WIDTH - 32 * 2)];
    height = size.height;
    self.appAboutLabel = [[UILabel alloc] initWithFrame:CGRectMake(32, startY += 25, SCREEN_WIDTH - 32 * 2, height)];
    self.appAboutLabel.numberOfLines = 0;
    [self.appAboutLabel setText:str];
    [self.appAboutLabel setFont:font];
    [self.appAboutLabel setTextAlignment:NSTextAlignmentLeft];
    startY += height;
    
    font = [UIFont fontWithName:FONT_NAME size:14.0f];
    str = @"CopyRight©2015 金宸集团";
    height = [NSString heightSingle:font];
    self.appCopyRightTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, startY += (SCREEN_HEIGHT - startY - 100), SCREEN_WIDTH, height)];
    [self.appCopyRightTopLabel setText:str];
    [self.appCopyRightTopLabel setFont:font];
    [self.appCopyRightTopLabel setTextAlignment:NSTextAlignmentCenter];
    startY += height;
    
    
    font = [UIFont fontWithName:FONT_NAME size:12.0f];
    str = @"All Rights Reserved";
    self.appCopyRightBottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, startY += 25, SCREEN_WIDTH, height)];
    [self.appCopyRightBottomLabel setText:str];
    [self.appCopyRightBottomLabel setFont:font];
    [self.appCopyRightBottomLabel setTextAlignment:NSTextAlignmentCenter];
    startY += height;
                                                                 
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.appNameLabl];
    [self.view addSubview:self.appVersionLabel];
    [self.view addSubview:self.appAboutLabel];
    [self.view addSubview:self.appCopyRightTopLabel];
    [self.view addSubview:self.appCopyRightBottomLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
