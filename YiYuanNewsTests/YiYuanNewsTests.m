//
//  YiYuanNewsTests.m
//  YiYuanNewsTests
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YYPublic.h"
#import "YYNetworking.h"

@interface YiYuanNewsTests : XCTestCase

@end

@implementation YiYuanNewsTests

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
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [[YYNetworking shareNetworking] get:kYYGetNewsChannelURL parameters:nil success:^(id response) {
        NSLog(@"DDDD");
    } failure:^(NSError *error) {
        NSLog(@"dfasdfa");
    }];
    
//    [[YYNetworking shareNetworking] get:kYYGetNewsInfoURL parameters:<#(id)#> success:<#^(id response)success#> failure:<#^(NSError *error)failure#>]
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


@end
