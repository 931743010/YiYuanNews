//
//  YYJokeCell.m
//  YiYuanNews
//
//  Created by fun on 15/11/14.
//  Copyright © 2015年 fun. All rights reserved.
//

#import "YYJokeCell.h"
#import "Masonry.h"

@interface YYJokeCell ()

@property (nonatomic, weak) UIView *jokeContentView;

@property (nonatomic, weak) UILabel *titleLabel;

@property (nonatomic, weak) UILabel *contentLabel;

@property (nonatomic, weak) UILabel *dateLabel;

@end

@implementation YYJokeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView *jokeContentView = [[UIView alloc] init];
        jokeContentView.layer.cornerRadius = 5;
        jokeContentView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:jokeContentView];
        [jokeContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(5);
            make.top.equalTo(self.contentView.mas_top).with.offset(5);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-5);
            make.right.equalTo(self.contentView.mas_right).with.offset(-5);
        }];
        self.jokeContentView = jokeContentView;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        [self.jokeContentView addSubview:titleLabel];
        titleLabel.font = [UIFont systemFontOfSize:20];
        self.titleLabel = titleLabel;
        
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.numberOfLines = -1;
        [self.jokeContentView addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        
        
//        UIView *line = [UIView new];
//        line.backgroundColor = [UIColor lightGrayColor];
//        line.alpha = 0.2;
//        [self.contentView addSubview:line];
//        [line mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(jokeContentView.mas_left);
//            make.right.mas_equalTo(jokeContentView.mas_right);
//            make.bottom.mas_equalTo(jokeContentView.mas_bottom);
//            make.height.mas_equalTo(@1);
//        }];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.text = _jokeModel.JokeTitle;
    CGSize titleSize = [_titleLabel.text sizeWithAttributes:@{NSFontAttributeName : _titleLabel.font}];
    self.contentLabel.text = _jokeModel.JokeContent;
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.jokeContentView.mas_left);
        make.top.mas_equalTo(self.jokeContentView.mas_top);
        make.right.mas_equalTo(self.jokeContentView.mas_right);
        make.height.mas_equalTo(titleSize.height);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(5);
        make.left.mas_equalTo(self.jokeContentView.mas_left);
        make.right.mas_equalTo(self.jokeContentView.mas_right);
        make.bottom.equalTo(self.jokeContentView.mas_bottom).with.offset(-30);
    }];
}



@end