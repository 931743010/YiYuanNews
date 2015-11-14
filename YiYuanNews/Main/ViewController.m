//
//  ViewController.m
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import "ViewController.h"
#import "YYNewsModule.h"
#import "MJExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    YYNewsModule *module = [YYNewsModule new];
//    [module getNewsChannels:nil result:^(YYNewsChannelsResponseResult *result) {
//        //NSDictionary *dict = [result mj_keyValues];
//        //NSLog(@"dict:%@", dict);
//    }];
//    
//    YYNewsRequestParams *params = [YYNewsRequestParams new];
//    params.channelId = @"5572a108b3cdc86cf39001cd";
//    params.page = 1;
//    
//    [module getNewsList:params result:^(YYNewsResponseResult *result) {
//        NSDictionary *dict = [result mj_keyValues];
//        NSLog(@"dict:%@", dict);
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
