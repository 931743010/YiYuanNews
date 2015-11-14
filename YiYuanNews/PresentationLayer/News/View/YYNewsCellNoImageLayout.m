//
//  YYNewsCellNoImageLayout.m
//  YiYuanNews
//
//  Created by fun on 15/11/13.
//  Copyright © 2015年 fun. All rights reserved.
//

#import "YYNewsCellNoImageLayout.h"

@interface YYNewsCellNoImageLayout ()

/**
 *  新闻标题
 */
@property (nonatomic, weak) UILabel *titleLabel;


/**
 *  新闻描述
 */
@property (nonatomic, weak) UILabel *descLabel;

/**
 *  发布时间
 */
@property (nonatomic, weak) UILabel *dateLabel;


/**
 *  新闻来源
 */
@property (nonatomic, weak) UILabel * sourceLabel;

@end

@implementation YYNewsCellNoImageLayout

- (instancetype)initWithNewsModel:(YYNewsModel *)newsModel
{
    if (self = [super initWithNewsModel:newsModel]) {
        
        UILabel *titleLabel = [[UILabel alloc] init];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        
        UILabel *descLabel = [[UILabel alloc] init];
        [self addSubview:descLabel];
        self.descLabel = descLabel;
        
        
        UILabel *dateLabel = [[UILabel alloc] init];
        [self addSubview:dateLabel];
        self.dateLabel = dateLabel;
        
        
        UILabel *sourceLabel = [[UILabel alloc] init];
        [self addSubview:sourceLabel];
        self.sourceLabel = sourceLabel;
        
        
        self.titleLabel.text = newsModel.title;
        self.descLabel.text = newsModel.desc;
        self.dateLabel.text = newsModel.pubDate;
        self.sourceLabel.text = newsModel.source;
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left);
            make.top.mas_equalTo(self.mas_top);
            make.right.mas_equalTo(self.mas_right);
        }];
        
    }
    
    return self;
}

@end
