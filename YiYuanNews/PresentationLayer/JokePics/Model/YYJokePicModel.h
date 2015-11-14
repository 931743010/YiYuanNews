//
//  YYJokePicModel.h
//  YiYuanNews
//
//  Created by fun on 15/11/14.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYJokePicModel : NSObject

/**
 *  发布时间
 */
@property (nonatomic, copy) NSString *ct;

/**
 *  图片链接
 */
@property (nonatomic, copy) NSString *img;

/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  类型 2:图片笑话
 */
@property (nonatomic, assign) NSInteger type;

@end
