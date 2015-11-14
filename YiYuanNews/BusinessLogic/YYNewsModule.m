//
//  YYNewsModule.m
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import "YYNewsModule.h"
#import "YYNetworking.h"
#import "YYPublic.h"
#import "MJExtension.h"

@implementation YYNewsModule
/*
 1. 获取新闻频道列表的API返回所有新闻频道，包括焦点新闻和最新新闻，焦点新闻0-13共14条，其余的是最新新闻。
 2. 获取指定新闻频道列表的方法是获取到所有新闻频道后将符合条件的频道筛选出来，因为是使用的已给定的API，此处只能使用此种方法进行模块划分。
 3. 此处留有返回值的考虑是尽兴网络环境的判断或者其他请求前的错误，0：请求发送成功。
 */

- (NSInteger)getFoucuseChannels:(YYNewsChannelRequestParams *)params result:(void (^)(YYNewsChannelsResponseResult *))result
{
    [YYNetworking get:kYYGetNewsChannelURL parameters:params success:^(id response) {
        YYNewsChannelsResponseResult *responseResult = [YYNewsChannelsResponseResult mj_objectWithKeyValues:response];
        //[0,13]为焦点新闻频道
        NSRange range = NSMakeRange(0, 14);
        NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
        NSArray *focuseNewsChannelList = [responseResult.showapi_res_body.channelList objectsAtIndexes:set];
        responseResult.showapi_res_body.channelList = focuseNewsChannelList;
        if (result) {
            result(responseResult);
        }
    } failure:^(NSError *error) {
        
    }];
    return 0;
}

- (NSInteger)getLastestChannels:(YYNewsChannelRequestParams *)params result:(void (^)(YYNewsChannelsResponseResult *))result
{
    [YYNetworking get:kYYGetNewsChannelURL parameters:params success:^(id response) {
        YYNewsChannelsResponseResult *responseResult = [YYNewsChannelsResponseResult mj_objectWithKeyValues:result];
        //[14, ...]为最新新闻频道
        NSRange range = NSMakeRange(14, responseResult.showapi_res_body.channelList.count-14);
        NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
        NSArray *lastestNewsChannelList = [responseResult.showapi_res_body.channelList objectsAtIndexes:set];
        responseResult.showapi_res_body.channelList = lastestNewsChannelList;
        if (result) {
            result(responseResult);
        }
    } failure:^(NSError *error) {
        
    }];
    return 0;
}

- (NSInteger)getNewsChannels:(YYNewsChannelRequestParams *)params result:(void (^)(YYNewsChannelsResponseResult *))result
{
    [YYNetworking get:kYYGetNewsChannelURL parameters:params success:^(id response) {
        YYNewsChannelsResponseResult *responseResult = [YYNewsChannelsResponseResult mj_objectWithKeyValues:response];
        if (result) {
            result(responseResult);
        }
    } failure:^(NSError *error) {
        
    }];
    return 0;
}


- (NSInteger)getNewsList:(YYNewsRequestParams *)params result:(void (^)(YYNewsResponseResult *))result
{
    [YYNetworking get:kYYGetNewsInfoURL parameters:params success:^(id response) {
        YYNewsResponseResult *responseResult = [YYNewsResponseResult mj_objectWithKeyValues:response];
        if (result) {
            result(responseResult);
        }
    } failure:^(NSError *error) {
        NSLog(@"error:%@", error.description);
    }];
    return 0;
}


@end
