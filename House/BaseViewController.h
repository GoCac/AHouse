//
//  BaseViewController.h
//  House
//
//  Created by dlut on 16/3/4.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "JCPrefixHeader.pch"

@interface BaseViewController : UIViewController
@property(nonatomic, strong, readonly) AFHTTPSessionManager *manager;
- (void)handleFailure:(NSString *)msg;
- (void)handleError:(NSString *)msg;
- (void)handleSuccess:(NSString *)msg;
- (void)showAlertView:(NSString *)msg;
@end
