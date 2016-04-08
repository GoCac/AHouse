//
//  ActivityTableViewController.m
//  House
//
//  Created by dlut on 15/11/25.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "ActivityTableViewController.h"
#import "ALActivityCell.h"
#import "Activity.h"

#define ALACTIVITYCELL_IDENTIFIER @"alactivitycell"
#define ACTIVITY_PAGE_SIZE 6

@implementation ActivityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setTitle:@"活动"];
    self.url = ACTIVITY_SERVER_URL;
    self.mobileUrl = ACTIVITY_MOBILE_URL;
    self.pageSize = ACTIVITY_PAGE_SIZE;
    _height = [ALActivityCell height];
    if (PRODUCT) {
        for (int i = 0 ; i < 8; i++) {
            [self.datas addObject:[[Activity alloc] initWithID:i picUrl:PLACE_HOLDER_IAMGE_URL title:@"hello world" time:@"2016 01/12"]];
        }
    } else {
//        [self loadLocalData];
        [self fetchModelsFromServerRefresh:YES];
    }
}

- (Class)getModelClass {
    return [Activity class];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ALActivityCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ALACTIVITYCELL_IDENTIFIER];
    if (nil == cell) {
        cell = [[ALActivityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ALACTIVITYCELL_IDENTIFIER];
    }
    [cell layoutCellWithBaseModel:[self.datas objectAtIndex:[indexPath row]]];
    return cell;
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
