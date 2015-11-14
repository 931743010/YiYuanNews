//
//  YYNewsModule.h
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYNewsChannelModel.h"

#import "YYNewsChannelRequestParams.h"
#import "YYNewsChannelsResponseResult.h"

#import "YYNewsRequestParams.h"
#import "YYNewsResponseResult.h"


@interface YYNewsModule : NSObject

/**
 *  获取焦点新闻频道列表
 *
 *  @param params params description
 *  @param result result description
 *
 *  @return return value description
 */
- (NSInteger)getFoucuseChannels:(YYNewsChannelRequestParams *)params result:(void (^)(YYNewsChannelsResponseResult *result))result;

/**
 *  获取最新新闻频道列表
 *
 *  @param params params description
 *  @param result result description
 *
 *  @return return value description
 */
- (NSInteger)getLastestChannels:(YYNewsChannelRequestParams *)params result:(void (^)(YYNewsChannelsResponseResult *result))result;

/**
 *  获取全部新闻频道列表
 *
 *  @param params params description
 *  @param result result description
 *
 *  @return return value description
 */
- (NSInteger)getNewsChannels:(YYNewsChannelRequestParams *)params result:(void (^)(YYNewsChannelsResponseResult *result))result;

/**
 *  获取新闻列表
 *
 *  @param params params description
 *  @param result result description
 *
 *  @return return value description
 */
- (NSInteger)getNewsList:(YYNewsRequestParams *)params result:(void (^)(YYNewsResponseResult *result))result;


@end
