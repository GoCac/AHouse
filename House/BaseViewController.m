//
//  BaseViewController.m
//  House
//
//  Created by dlut on 16/3/4.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "BaseViewController.h"
#import "NetWorkManager.h"

@interface BaseViewController ()
@property(nonatomic, strong) UIAlertView *alertView;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _manager = [NetWorkManager shareSM];
    self.alertView = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
}

- (void)handleFailure:(NSString *)msg {
    [self showAlertView:msg];
}

- (void)handleError:(NSString *)msg {
    [self showAlertView:msg];
}

- (void)handleSuccess:(NSString *)msg {
    [self.alertView setMessage:msg];
    [self.alertView show];
}

- (void)showAlertView:(NSString *)msg {
    [self.alertView setMessage:msg];
    [self.alertView show];
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
