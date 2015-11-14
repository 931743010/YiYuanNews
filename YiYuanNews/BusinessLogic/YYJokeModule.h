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

@interface YYJokeModule : NSObject

/**
 *  获取图片分类
 *
 *  @param params params description
 *  @param result result description
 *
 *  @return return value description
 */
- (NSInteger)getJokePictureTypes:(YYJokePicturesRequestParams *)params result:(void (^)(YYJokePicturesResponseResult *responseResult))result;

@end
