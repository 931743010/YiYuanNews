//
//  YYNewsResponseResult.h
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYNewsBodyModel.h"

@interface YYNewsResponseResult : NSObject

@property (nonatomic, assign) NSInteger showapi_res_code;

@property (nonatomic, copy) NSString *showapi_res_error;

@property (nonatomic, strong) YYNewsBodyModel *showapi_res_body;

@end
