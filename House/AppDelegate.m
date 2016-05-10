//
//  AppDelegate.m
//  House
//
//  Created by dlut on 15/11/3.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsTableViewController.h"
#import "HouseTableViewController.h"
#import "ActivityTableViewController.h"
#import "AboutViewController.h"
#import <QMapKit/QMapKit.h>

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.isNetAvailable = NO;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabBarController  = [[UITabBarController alloc] init];
    NewsTableViewController *newsController = [[NewsTableViewController alloc] init];
    [newsController.tabBarItem setImage:[[UIImage imageNamed:@"tab_home_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [newsController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_home_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [newsController.tabBarItem setTitle:@"首页"];
    UINavigationController *newsNavigationController = [[UINavigationController alloc] initWithRootViewController:newsController];
    
    HouseTableViewController *houseController = [[HouseTableViewController alloc] init];
    [houseController.tabBarItem setImage:[[UIImage imageNamed:@"tab_building_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [houseController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_building_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [houseController.tabBarItem setTitle:@"楼盘"];
    UINavigationController *houseNavigationController = [[UINavigationController alloc] initWithRootViewController:houseController];
    
    ActivityTableViewController *activityTableViewController = [[ActivityTableViewController alloc] init];
    [activityTableViewController.tabBarItem setImage:[[UIImage imageNamed:@"tab_activity_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [activityTableViewController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_activity_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [activityTableViewController.tabBarItem setTitle:@"活动"];
    UINavigationController *activityNavigationController = [[UINavigationController alloc] initWithRootViewController:activityTableViewController];
    
    AboutViewController *aboutViewController = [[AboutViewController alloc] init];
    [aboutViewController.tabBarItem setImage:[[UIImage imageNamed:@"tab_about_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [aboutViewController.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tab_about_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [aboutViewController.tabBarItem setTitle:@"关于"];
    UINavigationController *aboutNavigaitionController = [[UINavigationController alloc] initWithRootViewController:aboutViewController];
    
    NSArray *array = @[newsNavigationController, houseNavigationController, activityNavigationController, aboutNavigaitionController];
    [tabBarController setViewControllers:array];
    [tabBarController.tabBar setTintColor:[UIColor colorWithRed:255 / 255 green:0 blue:0 alpha:1.0]];
    UINavigationController *tabNavigationController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
    [self.window setRootViewController:tabNavigationController];
    [self.window makeKeyAndVisible];
    [QMapServices sharedServices].apiKey = @"XV2BZ-XMIKS-CZBOI-62IYY-6PTE2-74B2J";
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
