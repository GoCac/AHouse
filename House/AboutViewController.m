//
//  AboutViewController.m
//  House
//
//  Created by dlut on 15/11/27.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "AboutViewController.h"
#import "JCPrefixHeader.pch"
#import "AppDelegate.h"
#import "FeedbackViewController.h"
#import "TestViewController.h"
#import "View+MASAdditions.h"
#import "WebViewController.h"
#import "MapViewController.h"
#import "CircleViewController.h"

@interface AboutViewController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) UIButton *button;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *datas;
@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    self.datas = [NSArray arrayWithObjects:[NSArray arrayWithObjects:@"公司简介", nil], [NSArray arrayWithObjects:@"意见反馈", @"版本测试", @"关于我们", nil], nil];
}

#pragma UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.datas count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"aboutviewcell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"aboutviewcell"];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"%@", [self.datas[indexPath.section] objectAtIndex:indexPath.row]]];
    [cell.imageView setImage:[UIImage imageNamed:@"home.png"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (1 == [indexPath section]) {
        if (0 == [indexPath row]) {
            FeedbackViewController *feedbackController = [[FeedbackViewController alloc] init];
            [self.tabBarController.navigationController pushViewController:feedbackController animated:YES];
        } else if (1 == [indexPath row]) {
//            TestViewController *testViewController = [[TestViewController alloc] init];
//            [self.tabBarController.navigationController pushViewController:testViewController animated:YES];
            MapViewController *mapViewController = [[MapViewController alloc] init];
            [self.tabBarController.navigationController pushViewController:mapViewController animated:YES];
        } else if (2 == [indexPath row]) {
            CircleViewController *circleViewController = [[CircleViewController alloc] init];
            [self.tabBarController.navigationController pushViewController:circleViewController animated:YES];
        }
    } else {
        if (0 == [indexPath row]) {
            WebViewController *webViewController = [[WebViewController alloc] init];
            [webViewController setUrl:COMPANY_URL];
            [self.tabBarController.navigationController pushViewController:webViewController animated:YES];
        }
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
