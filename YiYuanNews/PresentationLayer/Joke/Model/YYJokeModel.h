//
//  YYJokeModel.h
//  YiYuanNews
//
//  Created by fun on 15/11/14.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYJokeModel : NSObject

/**
 *  发布时间
 */
@property (nonatomic, copy) NSString *BillNo;

/**
 *  笑话标题
 */
@property (nonatomic, copy) NSString *JokeTitle;

/**
 *  笑话内容
 */
@property (nonatomic, copy) NSString *JokeContent;


/**
 *  笑话类型  1:文本笑话
 */
@property (nonatomic, assign) NSInteger Type;

@end
