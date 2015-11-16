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

@property (nonatomic, weak) UIView *operationBar;

@property (nonatomic, weak) UILabel *contentLabel;

@property (nonatomic, weak) UILabel *dateLabel;

@end

@implementation YYJokeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        UIView *jokeContentView = [[UIView alloc] init];
        jokeContentView.layer.cornerRadius = 5;
        jokeContentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:jokeContentView];
        [jokeContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(0);
            make.top.equalTo(self.contentView.mas_top).with.offset(5);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-60);
            make.right.equalTo(self.contentView.mas_right).with.offset(0);
        }];
        self.jokeContentView = jokeContentView;
        
        UIView *operationBar = [[UIView alloc] init];
        [self.contentView addSubview:operationBar];
        operationBar.backgroundColor = [UIColor whiteColor];
        [operationBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(jokeContentView.mas_bottom).with.offset(5);
            make.left.mas_equalTo(jokeContentView.mas_left);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-5);
            make.right.mas_equalTo(jokeContentView.mas_right);
        }];
        
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.numberOfLines = -1;
        [self.jokeContentView addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.jokeContentView.mas_top).with.offset(5);
            make.left.equalTo(self.jokeContentView.mas_left).with.offset(5);
            make.right.equalTo(self.jokeContentView.mas_right).with.offset(-5);
            make.bottom.equalTo(self.jokeContentView.mas_bottom).with.offset(0);
        }];
        
        
        //发布时间
        
        //分享
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        shareBtn.layer.borderWidth = 1;
        shareBtn.layer.borderColor = [UIColor grayColor].CGColor;
        [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
        [operationBar addSubview:shareBtn];
        [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(operationBar.mas_top).with.offset(5);
            make.left.equalTo(operationBar.mas_left).with.offset(5);
            make.bottom.equalTo(operationBar.mas_bottom).with.offset(-5);
            make.width.mas_equalTo(@100);
        }];
        
        //收藏
        UIButton *collectionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [collectionBtn setTitle:@"收藏" forState:UIControlStateNormal];
        collectionBtn.layer.borderWidth = 1;
        collectionBtn.layer.borderColor = [UIColor grayColor].CGColor;
        [operationBar addSubview:collectionBtn];
        [collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(shareBtn.mas_top);
            make.left.equalTo(shareBtn.mas_right).with.offset(5);
            make.bottom.mas_equalTo(shareBtn.mas_bottom);
            make.width.mas_equalTo(shareBtn.mas_width);
        }];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //CGSize titleSize = [_titleLabel.text sizeWithAttributes:@{NSFontAttributeName : _titleLabel.font}];
    self.contentLabel.text = _jokeModel.JokeContent;
    
    
}



@end
