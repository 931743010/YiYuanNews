//
//  YYJokeModule.m
//  YiYuanNews
//
//  Created by fun on 15/11/14.
//  Copyright © 2015年 fun. All rights reserved.
//

#import "YYJokeModule.h"
#import "YYNetworking.h"
#import "YYPublic.h"
#import "MJExtension.h"

@implementation YYJokeModule

- (NSInteger)getJoke:(YYJokeRequestParams *)params result:(void (^)(YYJokeResponseResult *))result
{
    [YYNetworking get:kYYGetChinaJokeURL parameters:params success:^(id response) {
        YYJokeResponseResult *responseResult = [YYJokeResponseResult mj_objectWithKeyValues:response];
        if (result) {
            result(responseResult);
        }
    } failure:^(NSError *error) {
        NSLog(@"error:%@", error.description);
    }];
    return 0;
}

- (NSInteger)getJokePicture:(YYJokePicturesRequestParams *)params result:(void (^)(YYJokePicturesResponseResult *))result
{
    [YYNetworking get:kYYGetJokePicturesURL parameters:params success:^(id response) {
        YYJokePicturesResponseResult *responseResult = [YYJokePicturesResponseResult mj_objectWithKeyValues:response];
        if (result) {
            result(responseResult);
        }
    } failure:^(NSError *error) {
        NSLog(@"error:%@", error.description);
    }];
    return 0;
}

@end
