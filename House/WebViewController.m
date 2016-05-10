//
//  WebViewController.m
//  House
//
//  Created by dlut on 16/1/7.
//  Copyright © 2016年 dlut. All rights reserved.
//

#import "WebViewController.h"
#import "JCPrefixHeader.pch"

@interface WebViewController () <UIWebViewDelegate>
@property(nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property(nonatomic, strong) UIWebView *webView;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarBtnClick)];
    [self.navigationItem setLeftBarButtonItem:leftBarBtn animated:YES];
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:self.webView];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
    [view addSubview:self.indicatorView];
    [self.indicatorView setCenter:view.center];
    [view setTag:108];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    [view setAlpha:0.5];
    [self.view addSubview:view];
    [self.webView setDelegate:self];
    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5]];
}

- (void)leftBarBtnClick {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.indicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.indicatorView stopAnimating];
    [self removeMView];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self.indicatorView stopAnimating];
    [self removeMView];
}

- (void)removeMView {
    UIView *view = [self.view viewWithTag:108];
    [view removeFromSuperview];
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
