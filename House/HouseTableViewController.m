//
//  HouseTableViewController.m
//  House
//
//  Created by dlut on 15/11/5.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "HouseTableViewController.h"
#import "ALHouseCell.h"
#import "HouseDetail.h"
#import "ParseJson.h"
#import "HouseDetailViewController.h"

#define PAGE_SIZE_HOUSE 8

@interface HouseTableViewController ()
@end

@implementation HouseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageSize = PAGE_SIZE_HOUSE;
    self.url = HOUSE_SERVER_URL;
    [self.navigationItem setTitle:@"楼盘"];
    // Do any additional setup after loading the view.
    if (PRODUCT) {
        for (NSUInteger i = 0; i < 20; i++) {
            [self.datas addObject:[[House alloc] initWithID:i url:PLACE_HOLDER_IAMGE_URL name:@"大连理工大学" intro:@"还不错啊，哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" phone:@"13699297633" lat:@116 lng:@121 stars:(3 + i % 3) labelContent:@"一室一厅;别墅;90万起"]];
        }
    } else {
//        [self loadLocalData];
        [self fetchModelsFromServerRefresh:YES];
    }
    _height = [ALHouseCell height];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"house_cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[ALHouseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [(ALHouseCell*)cell layoutCellWithBaseModel:[self.datas objectAtIndex:[indexPath row]]];
    return cell;
}

- (Class)getModelClass {
    return [HouseDetail class];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HouseDetailViewController *hvController = [[HouseDetailViewController alloc] init];
    [self.tabBarController.navigationController pushViewController:hvController animated:YES];
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
