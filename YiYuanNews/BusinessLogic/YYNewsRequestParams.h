//
//  YYNewsRequestParams.h
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYNewsRequestParams : NSObject

/**
 *  channelId
    string	否	urlParam
    新闻频道id，必须精确匹配
    5572a109b3cdc86cf39001db
 */
@property (nonatomic, copy) NSString *channelId;

/**
 *  channelName
    string	否	urlParam
    新闻频道名称，可模糊匹配
    国内最新
 */
@property (nonatomic, copy) NSString *channelName;

/**
 *  title
    string	否	urlParam
    新闻标题，模糊匹配
    上市
 */
@property (nonatomic, copy) NSString *title;

/**
 *  page
    number	否	urlParam
    页数，默认1。每页最多20条记录。
    1
 */
@property (nonatomic, assign) NSInteger page;

@end
