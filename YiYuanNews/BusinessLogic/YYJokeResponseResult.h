//
//  YYJokeResponseResult.h
//  YiYuanNews
//
//  Created by fun on 15/11/14.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYJokeBodyModel.h"

@interface YYJokeResponseResult : NSObject

@property (nonatomic, assign) NSInteger res_code;

@property (nonatomic, copy) NSString *res_error;

@property (nonatomic, strong) YYJokeBodyModel *res_body;

@end
