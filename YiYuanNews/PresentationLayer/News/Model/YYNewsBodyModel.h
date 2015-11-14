//
//  YYNewsBodyModel.h
//  YiYuanNews
//
//  Created by fun on 15/11/12.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYNewsPageBeanModel.h"

@interface YYNewsBodyModel : NSObject

@property (nonatomic, strong) YYNewsPageBeanModel *pagebean;

@property (nonatomic, assign) NSInteger ret_code;

@end
