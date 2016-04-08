//
//  HouseTests.m
//  HouseTests
//
//  Created by dlut on 15/11/3.
//  Copyright (c) 2015年 dlut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ParseJson.h"
#import "StringUtils.h"

@interface HouseTests : XCTestCase

@end

@implementation HouseTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testAdd {
    NSInteger result = [ParseJson add:10 AndB:20];
    NSAssert(result == 30, @"result should be 30");
}

- (void)testParseLabelContent {
    NSArray *result = [StringUtils parseLabelContent:@"hello;hahah;apple;yes;"];
    NSLog(@"%@", result);
    NSAssert(2 == [result count], @"result array count should be 2");
}

@end