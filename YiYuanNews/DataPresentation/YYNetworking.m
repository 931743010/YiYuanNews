//
//  YYNetworking.m
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import "YYNetworking.h"
#import "AFNetworking.h"
#import "YYPublic.h"
#import "MJExtension.h"

@interface YYNetworking ()

@end

@implementation YYNetworking

static YYNetworking *_instance = nil;


- (instancetype)init
{
    if (self = [super init]) {
        
        
        //self.manager.requestSerializer.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    }
    
    return self;
}


+ (void)get:(NSString *)url parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSMutableSet *acceptableSet = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
    [acceptableSet addObject:@"text/html"];
    manager.responseSerializer.acceptableContentTypes = acceptableSet;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:kYYAppKey forHTTPHeaderField:@"apikey"];
    
    NSLog(@"***************** 网络测试 *****************");
    NSLog(@"parameters:%@", [parameters mj_JSONString]);
    NSLog(@"*******************************************");
    [manager GET:url parameters:[parameters mj_JSONObject] success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}


+ (void)post:(NSString *)url parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSMutableSet *acceptableSet = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
    [acceptableSet addObject:@"text/html"];
    manager.responseSerializer.acceptableContentTypes = acceptableSet;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:kYYAppKey forHTTPHeaderField:@"apikey"];
    
    [manager POST:url parameters:[parameters mj_JSONObject] success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
