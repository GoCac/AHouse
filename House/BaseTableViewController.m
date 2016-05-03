//
//  BaseTableViewController.m
//  House
//
//  Created by dlut on 15/11/4.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseModel.h"
#import "ServerUtils.h"
#import "ParseJson.h"
#import "NetWorkManager.h"

@interface BaseTableViewController ()
@property(nonatomic, strong) UIAlertView *alertView;
@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _manger = [NetWorkManager shareRM];
    [self.tableView setMj_header:[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)]];
    [self.tableView setMj_footer:[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)]];
    _datas = [[NSMutableArray alloc] init];
    self.alertView = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
    [self.tableView setSeparatorColor:[UIColor orangeColor]];
    [self.tableView setAllowsMultipleSelection:NO];
}

- (void)refresh {
    [self fetchModelsFromServerRefresh:YES];
}

- (void)loadMore {
    [self fetchModelsFromServerRefresh:NO];
}

- (BOOL)isOver:(BOOL)isRefresh {
    return (!isRefresh && self.isOver);
}

- (void)fetchModelsFromServerRefresh:(BOOL)isRefresh {
    if ([self isOver:isRefresh]) {
        [self resetTableView];
        return;
    }
    [FetchServer postModelsFromUrl:self.url params:[self getParams:isRefresh] mClass:[self getModelClass] success:^(NSArray *models) {
        [self refreshViewWithModels:models isRefresh:isRefresh];
    } failure:^(NSInteger code) {
        [self handleCode:code];
    } error:^{
        [self handleFailure];
    }];
}

- (void)handleCode:(NSInteger)code {
    switch (code) {
        case CODE_SUCCESS:
            break;
        case CODE_FAILURE:
            [self.alertView setMessage:ERROR_MESSAGE];
            [self.alertView show];
            break;
        default:
            break;
    }
    [self resetTableView];
}

- (void)handleFailure {
    [self.alertView setMessage:ERROR_MESSAGE];
    [self.alertView show];
    [self resetTableView];
}

- (void)resetTableView {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

- (Class)getModelClass {
    return [BaseModel class];
}

- (void)refreshViewWithModels:(NSArray *)result isRefresh:(BOOL)isRefresh {
    if ([result count] == 0) {
        return;
    }
    if (isRefresh) {
        [self.datas removeAllObjects];
        self.isOver = NO;
    } else {
        if ([result count] < self.pageSize) {
            self.isOver = YES;
        }
    }
    [self.datas addObjectsFromArray:result];
    [self.tableView reloadData];
    [self resetTableView];
    if (isRefresh) {
        [SaveModelUtils saveBaseModels:result cls:[self getModelClass]];
    }
}

- (NSMutableDictionary *)getParams:(BOOL)isRefresh {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:[NSNumber numberWithInteger:self.pageSize] forKey:@"pageSize"];
    if (!isRefresh) {
        if([self.datas count] > 0) {
            [params setObject:[NSNumber numberWithInteger:[((BaseModel *)[self.datas lastObject]) ID]] forKey:@"id"];
        }
    }
    return params;
}

- (void)loadLocalData {
    NSArray *datas = [SaveModelUtils getBaseModels:[self getModelClass]];
    [self refreshViewWithModels:datas isRefresh:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas count];
}

#pragma UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WebViewController *webViewController = [[WebViewController alloc] init];
    NSUInteger ID = [[self.datas objectAtIndex:[indexPath row]] ID];
    webViewController.url = [self.mobileUrl stringByAppendingString:[NSString stringWithFormat:@"%lu", ID]];
    NSLog(@"mobile url is %@", webViewController.url);
    [self.tabBarController.navigationController pushViewController:webViewController animated:YES];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
