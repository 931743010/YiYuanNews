//
//  YYJokeModule.h
//  YiYuanNews
//
//  Created by fun on 15/11/14.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YYJokePicturesRequestParams.h"
#import "YYJokePicturesResponseResult.h"

#import "YYJokeRequestParams.h"
#import "YYJokeResponseResult.h"

@interface YYJokeModule : NSObject

/**
 *  获取文本笑话
 *
 *  @param params params description
 *  @param result result description
 *
 *  @return return value description
 */
- (NSInteger)getJoke:(YYJokeRequestParams *)params result:(void (^)(YYJokeResponseResult *responseResult))result;

/**
 *  获取搞笑图片
 *
 *  @param params params description
 *  @param result result description
 *
 *  @return return value description
 */
- (NSInteger)getJokePicture:(YYJokePicturesRequestParams *)params result:(void (^)(YYJokePicturesResponseResult *responseResult))result;

@end
