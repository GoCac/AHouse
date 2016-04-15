//
//  HouseDetailViewController.m
//  House
//
//  Created by dlut on 16/3/10.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "HouseDetailViewController.h"
#import "CircleView.h"
#import "JCPrefixHeader.pch"
#import "HouseDetailView.h"
#import "CircleTextView.h"
#import "MapViewController.h"

@interface HouseDetailViewController () <CircleTextViewDelegate>
@property(nonatomic, strong) CircleView *circleView;
@property(nonatomic, strong) CircleTextView *circleTextView;
@end

@implementation HouseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //下面两行代码解决circleview显示的问题。。
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:view];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"地图" style:UIBarButtonItemStylePlain target:self action:@selector(jumpToMap)]];
    NSArray *images = [NSArray arrayWithObjects:@"zoro.jpg", @"three.jpg", @"onepiece.jpg", nil];
    self.circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, CIRCLEVIEW_HEIGHT) autoPlay:YES timeInterval:3.0f];
    [self.circleView setImages:images];
    [self.view addSubview:self.circleView];
    HouseDetailView *detailView = [[HouseDetailView alloc] initWithFrame:CGRectMake(0, 64 + CIRCLEVIEW_HEIGHT, SCREEN_WIDTH, [HouseDetailView height])];
    [self.view addSubview:detailView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    CGFloat curY = 64 + CIRCLEVIEW_HEIGHT + [HouseDetailView height];
    NSArray *titles = [[NSArray alloc] initWithObjects:@"项目介绍", @"综合配套", @"设计理念", nil];
    self.circleTextView = [[CircleTextView alloc] initWithFrame:CGRectMake(0, curY, SCREEN_WIDTH, SCREEN_HEIGHT - curY) titles:titles];
    [self.circleTextView setDelegate:self];
    [self.view addSubview:self.circleTextView];
}

- (void)jumpToMap {
    MapViewController *mapViewController = [[MapViewController alloc] init];
    [self.navigationController pushViewController:mapViewController animated:YES];
}

#pragma CircleTextViewDelegate
- (void)circleTextView:(CircleTextView *)circleTextView didSelectedAtIndex:(NSUInteger)index {
    if (DEBUG) {
        NSLog(@"You clicked circleView at index %lu", index);
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
