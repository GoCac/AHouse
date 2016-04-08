//
//  BaseTableViewController.h
//  House
//
//  Created by dlut on 15/11/4.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "MJRefresh.h"
#import "JCPrefixHeader.pch"
#import "CommonEnums.h"
#import "WebViewController.h"
#import "SaveModelUtils.h"
#import "FetchServer.h"

@class BaseModel;
@interface BaseTableViewController : UITableViewController {
    @protected
    CGFloat _height;
}
@property(nonatomic, assign) BOOL isOver;
@property(nonatomic, strong) NSMutableArray *datas;
@property(nonatomic, strong, readonly) AFHTTPRequestOperationManager *manger;
@property(nonatomic, copy) NSString *url;
@property(nonatomic, copy) NSString *mobileUrl;
@property(nonatomic, assign) NSUInteger pageSize;
- (void)fetchModelsFromServerRefresh:(BOOL)isRefresh;
- (void)handleCode:(NSInteger)code;
- (void)handleFailure;
- (NSMutableDictionary *)getParams:(BOOL)isRefresh;
- (Class)getModelClass;
- (void)loadLocalData;
- (void)resetTableView;
- (void)refresh;
- (void)loadMore;
- (BOOL)isOver:(BOOL)isRefresh;
- (void)refreshViewWithModels:(NSArray *)models isRefresh:(BOOL)isRefresh;
@end
