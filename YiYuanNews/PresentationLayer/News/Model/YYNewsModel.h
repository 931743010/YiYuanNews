//
//  YYNewsModel.h
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYNewsModel : NSObject

/**
 *  新闻所在频道id
 */
@property (nonatomic, copy) NSString *channelId;

/**
 *  新闻所在频道名字
 */
@property (nonatomic, copy) NSString *channelName;

/**
 *  新闻描述
 */
@property (nonatomic, copy) NSString *desc;

/**
 *  新闻配图信息
 */
@property (nonatomic, copy) NSArray *imageurls;

/**
 *  新闻url
 */
@property (nonatomic, copy) NSString *link;

/**
 *  nid
 */
@property (nonatomic, copy) NSString *nid;

/**
 *  新闻发布日期
 */
@property (nonatomic, copy) NSString *pubDate;

/**
 *  新闻来源
 */
@property (nonatomic, copy) NSString *source;

/**
 *  新闻标题
 */
@property (nonatomic, copy) NSString *title;

@end
