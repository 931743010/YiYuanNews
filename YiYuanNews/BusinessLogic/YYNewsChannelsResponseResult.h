//
//  YYNewsChannelsResponseResult.h
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYNewsChannelBodyModel.h"

@interface YYNewsChannelsResponseResult : NSObject

@property (nonatomic, assign) NSInteger showapi_res_code;

@property (nonatomic, copy) NSString *showapi_res_error;

@property (nonatomic, strong) YYNewsChannelBodyModel *showapi_res_body;

@end
