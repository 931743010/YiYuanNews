//
//  YYPublic.h
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#ifndef YYPublic_h
#define YYPublic_h

/**
 *  频道新闻API_易源
 */

//apikey
#define kYYAppKey @"6a653e4c2c2bd2c253af3a0d1252d92f"

//新闻频道查询
#define kYYGetNewsChannelURL @"http://apis.baidu.com/showapi_open_bus/channel_news/channel_news"

//根据频道或者关键词查询新闻
#define kYYGetNewsInfoURL @"http://apis.baidu.com/showapi_open_bus/channel_news/search_news"


/**
 *  易源 笑话
 */

//文本笑话
#define kYYGetJokeURL @"http://apis.baidu.com/showapi_open_bus/showapi_joke/joke_text"

//获取搞笑图片
#define kYYGetJokePicturesURL @"http://apis.baidu.com/showapi_open_bus/showapi_joke/joke_pic"

/**
 *  中国笑话
 */

//文本笑话
#define kYYGetChinaJokeURL @"http://apis.baidu.com/hihelpsme/chinajoke/getjokelist"

#endif /* YYPublic_h */
