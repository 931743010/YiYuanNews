//
//  YYNewsCellLayout.m
//  YiYuanNews
//
//  Created by fun on 15/11/13.
//  Copyright © 2015年 fun. All rights reserved.
//

#import "YYNewsCellLayout.h"
#import "YYNewsCellNoImageLayout.h"
#import "YYNewsCellSingleImageLayout.h"
#import "YYNewsCellMultipleImagesLayout.h"

@interface YYNewsCellLayout ()

@end

@implementation YYNewsCellLayout

+ (YYNewsCellLayout *)createNewsCellLayout:(YYNewsModel *)newsModel
{
    NSInteger imageCount = newsModel.imageurls.count;
    YYNewsCellLayout *layout = nil;
    switch (imageCount) {
        case 0:{
            layout = [[YYNewsCellNoImageLayout alloc] initWithNewsModel:newsModel];
        }break;
        case 1:{
            layout = [[YYNewsCellSingleImageLayout alloc] initWithNewsModel:newsModel];
        }break;
        default:{
            layout = [[YYNewsCellMultipleImagesLayout alloc] initWithNewsModel:newsModel];
        }break;
    }
    return layout;
}

- (instancetype)initWithNewsModel:(YYNewsModel *)newsModel
{
    if (self = [super init]) {
        
    }
    
    return self;
}

@end
