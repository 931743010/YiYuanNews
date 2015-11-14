//
//  YYNetworking.h
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYNetworking : NSObject

/**
 *  GET方法
 *
 *  @param url        获取数据url
 *  @param parameters 传递的参数
 *  @param success    请求成功
 *  @param failure    请求失败
 */
+ (void)get:(NSString *)url parameters:(id)parameters success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;


/**
 *  POST方法
 *
 *  @param url        获取数据url
 *  @param parameters 传递的参数
 *  @param success    请求成功
 *  @param failure    请求失败
 */
+ (void)post:(NSString *)url parameters:(id)parameters success:(void (^)(id response))success failure:(void (^)(NSError *error))failure;


@end
