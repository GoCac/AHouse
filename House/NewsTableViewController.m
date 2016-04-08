//
//  NewsTableViewController.m
//  House
//
//  Created by dlut on 15/11/4.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "NewsTableViewController.h"
#import "CircleView.h"
#import "ALNewsCell.h"
#import "News.h"
#import "NSString+Height.h"
#import "ParseJson.h"
#import "AppDelegate.h"
#import "ServerUtils.h"
#import "Slideshow.h"

#define PAGE_SIZE_NEWS 8

@interface NewsTableViewController () <CircleViewDelegate> {
    NSString *_slideUrl;
}
@property(nonatomic, strong) Reachability *netConn;
@property(nonatomic, strong) NSString *localFileName;
@property(nonatomic, strong) NSString *localDataName;
@property(nonatomic, strong) CircleView *circleView;
@property(nonatomic, strong) NSArray *slides;
@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageSize = PAGE_SIZE_NEWS;
    self.url = NEWS_SERVER_URL;
    self.mobileUrl = NEWS_MOBILE_URL;
    _slideUrl = SLIDE_SERVER_URL;
    [self.navigationItem setTitle:@"首页"];
    NSArray *images = [NSArray arrayWithObjects:@"zoro.jpg", @"three.jpg", @"onepiece.jpg", nil];
    _height = [ALNewsCell height];
    if (PRODUCT) {
        self.circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CIRCLEVIEW_HEIGHT) autoPlay:YES images:images timeInterval:3.0f];
        for (NSUInteger i = 0; i < 20; i++) {
            [self.datas addObject:[[News alloc] initWithID:i picUrl:PLACE_HOLDER_IAMGE_URL title:@"北京的房价涨了，哈哈哈哈哈哈哈哈哈哈哈哈哈哈,hahhahahahahhahah" author:@"楠楠" time:@"2015/11/07"]];
        }
    } else {
        self.circleView = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CIRCLEVIEW_HEIGHT) autoPlay:YES timeInterval:3.0f];
//        [self loadLocalData];
        [self fetchModelsFromServerRefresh:YES];
        [self fetchSlideshows];
    }
//    [self.circleView setCircleViewClickBlock:^(CircleView *circleView, NSUInteger index) {
//        if (JC_DEBUG) {
//            NSLog(@"You clicked index %lu by block.", index);
//        }
//    }];
    [self.circleView setDelegate:self];
    [self.tableView setTableHeaderView:self.circleView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkState:) name:kReachabilityChangedNotification object:nil];
    self.netConn = [Reachability reachabilityForInternetConnection];
    [self.netConn startNotifier];
}

- (void)dealloc {
    [self.netConn stopNotifier];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

- (void)networkState:(NSNotification *)notification {
    Reachability *reach = [notification object];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            [delegate setIsNetAvailable:NO];
            break;
        case ReachableViaWiFi:
            [delegate setIsNetAvailable:YES];
            break;
        case ReachableViaWWAN:
            [delegate setIsNetAvailable:YES];
            break;
        default:
            break;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationItem setTitle:@"hello world"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)circleViewDidSelectImage:(CircleView *)circleView atIndex:(NSUInteger)index {
    if (PRODUCT) {
        NSLog(@"You clicked index %ld by delegate.", index);
    } else if(nil != self.slides && [self.slides count] > 0) {
        NSUInteger ID = [[self.slides objectAtIndex:index] ID];
        NSString *slideUrl = [SLIDE_MOBILE_URL stringByAppendingString:[NSString stringWithFormat:@"%lu", ID]];
        WebViewController *webViewController = [[WebViewController alloc] init];
        [webViewController setUrl:slideUrl];
        [self.tabBarController.navigationController pushViewController:webViewController animated:YES];
    }
}

- (Class)getModelClass {
    return [News class];
}

#pragma Slideshow
- (void)fetchSlideshows {
    NSDictionary *params = @{@"pageSize" : @"3"};
    [FetchServer postModelsFromUrl:_slideUrl params:params mClass:[Slideshow class] success:^(NSArray *models) {
        if (nil != models && [models count] > 0) {
            [self handleSlideshows:models];
            [SaveModelUtils saveBaseModels:models cls:[Slideshow class]];
        }
    } failure:^(NSInteger code) {
        [self handleCode:code];
    } error:^{
        [self handleFailure];
    }];
}

- (void)handleSlideshows:(NSArray *)slideshows {
    self.slides = slideshows;
    NSMutableArray *slideUrls = [[NSMutableArray alloc] initWithCapacity:[self.slides count]];
    for (Slideshow *slide in self.slides) {
        [slideUrls addObject:[slide picUrl]];
    }
    [self.circleView setImageUrls:slideUrls];
}
 
- (void)loadLocalData {
    [super loadLocalData];
    self.slides = [SaveModelUtils getBaseModels:[Slideshow class]];
    if (nil != self.slides && [self.slides count] > 0) {
        [self handleSlideshows:self.slides];
    }
}

#pragma UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *newsCellIdentifier = @"news_cell";
    UITableViewCell *cell;
    cell = [self.tableView dequeueReusableCellWithIdentifier:newsCellIdentifier];
    if (nil == cell) {
        cell = [[ALNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:newsCellIdentifier];
    }
    [(ALNewsCell *)(cell) layoutCellWithBaseModel:[self.datas objectAtIndex:indexPath.row]];
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