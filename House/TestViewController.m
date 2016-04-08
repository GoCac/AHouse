//
//  TestViewController.m
//  House
//
//  Created by dlut on 15/12/30.
//  Copyright © 2015年 dlut. All rights reserved.
//

#import "TestViewController.h"
#import "JCPrefixHeader.pch"
@interface TestViewController () <NSURLSessionDownloadDelegate>

@end
//I changed this file.
@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableURLRequest *quest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:NEWS_SERVER_URL]];
    [quest setHTTPMethod:@"POST"];
//    [quest setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    [dic setObject:@"3" forKey:@"pageSize"];
//    NSData *postDatas = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
//    [quest setHTTPBody:postDatas];
    NSString *params = [NSString stringWithFormat:@"pageSize=3"];
    [quest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [NSURLConnection sendAsynchronousRequest:quest queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        NSDictionary *mDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"responseA is %@, data is %@, error is %@", response, mDic, connectionError);
//    }];
//    NSLog(@"hello world");
//    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:quest];
    [task resume];
     /*
    //SEL是根据方法名标示一个方法
    SEL sel = @selector(hello);
    //http://blog.csdn.net/majiakun1/article/details/46424925
    //IMP是一个方法的具体实现，相当于一个函数指针
    IMP imp = [self methodForSelector:sel];
//    [self performSelector:sel withObject:nil];
    //函数指针
    void (*func)(id, SEL) = (void *)imp;
    func(self, sel);
     
    NSURL *qqurl = [NSURL URLWithString:@"http://202.118.67.200:10717/house/images/qq.png"];
    NSURLRequest *qqRequest = [NSURLRequest requestWithURL:qqurl];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDownloadTask *task2 = [session downloadTaskWithRequest:qqRequest completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"url is %@,error is %@", location, error);
    }];
    //handler 和 delegate至少提供一种，如果有handler，则优先使用handler方式。
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:qqRequest];
    [task resume];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hello {
    NSLog(@"hello world");
}

#pragma NSURLSessionDataDelegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    NSLog(@"responseC is %@", response);
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    NSLog(@"I send data");
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session {
    NSLog(@"URLSessionDidFinishEventsForBackgroundURLSession");
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSDictionary *mDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"data is %@", mDic);
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"I am completed. error is %@", error);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSLog(@"didFinishDownloadingToURL %@", location);
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
