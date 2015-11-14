//
//  YYJokePicBodyModel.h
//  YiYuanNews
//
//  Created by fun on 15/11/14.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYJokePicModel.h"

@interface YYJokePicBodyModel : NSObject

@property (nonatomic, assign) NSInteger allNum;

@property (nonatomic, assign) NSInteger allPages;

@property (nonatomic, copy) NSArray *contentlist;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) NSInteger maxResult;

@end
