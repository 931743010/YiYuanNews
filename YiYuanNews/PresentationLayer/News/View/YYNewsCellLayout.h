//
//  YYNewsCellLayout.h
//  YiYuanNews
//
//  Created by fun on 15/11/13.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYNewsModel.h"
#import "Masonry.h"

@interface YYNewsCellLayout : UIView

/**
 *  根据模型创建对应的布局
 *
 *  @param newsModel newsModel description
 *
 *  @return return value description
 */
+ (YYNewsCellLayout *)createNewsCellLayout:(YYNewsModel *)newsModel;


- (instancetype)initWithNewsModel:(YYNewsModel *)newsModel;
@end
