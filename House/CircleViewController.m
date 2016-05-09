//
//  CircleViewController.m
//  House
//
//  Created by dlut on 16/5/9.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "CircleViewController.h"
#import "CircleView.h"

@interface CircleViewController ()

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:view];
    NSArray *images = [NSArray arrayWithObjects:@"zoro.jpg", @"three.jpg", @"onepiece.jpg", nil];
    CircleView *circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) autoPlay:YES images:images timeInterval:4.3f];
    [self.view addSubview:circleView];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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
