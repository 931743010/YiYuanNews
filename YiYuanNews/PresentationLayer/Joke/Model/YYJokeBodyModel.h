//
//  YYJokeBodyModel.h
//  YiYuanNews
//
//  Created by fun on 15/11/14.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYJokeModel.h"

@interface YYJokeBodyModel : NSObject

@property (nonatomic, assign) NSInteger Count;

@property (nonatomic, assign) NSInteger PageCount;

@property (nonatomic, copy) NSArray *JokeList;

@end
