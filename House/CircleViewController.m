//
//  CircleViewController.m
//  House
//
//  Created by dlut on 16/5/9.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "CircleViewController.h"
#import "CircleView.h"
#import "HouseDetail.h"
#import "HouseDetailViewController.h"

@interface CircleViewController () <CircleViewDelegate>
@property(nonatomic, strong) CircleView *circleView;
@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:view];
    self.circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) autoPlay:YES timeInterval:4.6f];
    [self.circleView setImageUrls:self.urls];
    [self.circleView setDelegate:self];
    [self.view addSubview:self.circleView];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)circleViewDidSelectImage:(CircleView *)circleView atIndex:(NSUInteger)index {
    if (nil != self.house) {
        HouseDetailViewController *hdvController = [[HouseDetailViewController alloc] init];
        [hdvController setHouseDetail:self.house];
//        [self.navigationController popViewControllerAnimated:YES];
        [self.navigationController pushViewController:hdvController animated:YES];
    }
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
