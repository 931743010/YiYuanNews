//
//  YYNewsCell.m
//  YiYuanNews
//
//  Created by fun on 15/11/13.
//  Copyright © 2015年 fun. All rights reserved.
//

#import "YYNewsCell.h"
#import "Masonry.h"
#import <UIImageView+WebCache.h>
#import "YYNewsImageURLsModel.h"

@interface YYNewsCell ()

@property (nonatomic, weak) UIView *newsContentView;

@property (nonatomic, copy) NSArray *newsImagesArray;

@end

@implementation YYNewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        UIView *newsContentView = [[UIView alloc] init];
        [self.contentView addSubview:newsContentView];
        [newsContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(5);
            make.left.equalTo(self.mas_left).with.offset(5);
            make.bottom.equalTo(self.mas_bottom).with.offset(-5);
            make.right.equalTo(self.mas_right).with.offset(-5);
        }];
        //newsContentView.backgroundColor = [UIColor redColor];
        self.newsContentView = newsContentView;
        
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor lightGrayColor];
        line.alpha = 0.2;
        [self.contentView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(newsContentView.mas_left);
            make.right.mas_equalTo(newsContentView.mas_right);
            make.bottom.mas_equalTo(self.contentView.mas_bottom);
            make.height.mas_equalTo(@1);
        }];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIView *view in self.newsContentView.subviews) {
        [view removeFromSuperview];
    }
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.newsContentView addSubview:titleLabel];
    titleLabel.text = _newsModel.title;
    //titleLabel.backgroundColor = [UIColor blueColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    
    UILabel *descLabel = [[UILabel alloc] init];
    [self.newsContentView addSubview:descLabel];
    descLabel.numberOfLines = 2;
    descLabel.text = _newsModel.desc;
    descLabel.textColor = [UIColor grayColor];
    descLabel.font = [UIFont systemFontOfSize:13];
    //descLabel.backgroundColor = [UIColor greenColor];
    //来源
    UILabel *sourceLabel = [[UILabel alloc] init];
    [self.newsContentView addSubview:sourceLabel];
    sourceLabel.text = _newsModel.source;
    sourceLabel.textColor = [UIColor grayColor];
    sourceLabel.font = [UIFont systemFontOfSize:10];
    
    //日期
    UILabel *dateLabel = [[UILabel alloc] init];
    [self.newsContentView addSubview:dateLabel];
    dateLabel.text = _newsModel.pubDate;
    dateLabel.font = [UIFont systemFontOfSize:10];
    dateLabel.textColor = [UIColor grayColor];
    
    switch (_newsModel.imageurls.count) {
        case 0:{
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.newsContentView.mas_top).with.offset(10);
                make.left.mas_equalTo(self.newsContentView.mas_left);
                make.right.mas_equalTo(self.newsContentView.mas_right);
            }];
            [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(titleLabel.mas_bottom).with.offset(10);
                make.left.mas_equalTo(titleLabel.mas_left);
                make.right.mas_equalTo(titleLabel.mas_right);
            }];
            [sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(titleLabel.mas_left);
                make.bottom.equalTo(self.newsContentView.mas_bottom).with.offset(-1);
            }];
            [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(sourceLabel.mas_top);
                make.right.mas_equalTo(descLabel.mas_right);
            }];
        }break;
        case 1:{
            YYNewsImageURLsModel *imagesURLsModel = _newsModel.imageurls.firstObject;
            NSURL *URL = [NSURL URLWithString:imagesURLsModel.url];
            UIImageView *imageView = [[UIImageView alloc] init];
            [imageView sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"contentview_image_default"]];
            [self.newsContentView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.newsContentView.mas_top);
                make.left.mas_equalTo(self.newsContentView.mas_left);
                make.bottom.mas_equalTo(self.newsContentView.mas_bottom);
                make.width.mas_equalTo(imageView.mas_height);
            }];
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(imageView.mas_top).with.offset(5);
                make.left.equalTo(imageView.mas_right).with.offset(5);
                make.right.mas_equalTo(self.newsContentView.mas_right);
            }];
            [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(titleLabel.mas_bottom).with.offset(10);
                make.left.mas_equalTo(titleLabel.mas_left);
                make.right.mas_equalTo(titleLabel.mas_right);
            }];
            
            [sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(titleLabel.mas_left);
                make.bottom.equalTo(self.newsContentView.mas_bottom).with.offset(-1);
            }];
            [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(sourceLabel.mas_top);
                make.right.mas_equalTo(descLabel.mas_right);
            }];
        }break;
        default:{
            CGSize textSize = [titleLabel.text sizeWithAttributes:@{NSFontAttributeName:titleLabel.font}];
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.newsContentView.mas_top);
                make.left.mas_equalTo(self.newsContentView.mas_left);
                make.right.mas_equalTo(self.newsContentView.mas_right);
                make.height.mas_equalTo(textSize.height);
            }];
            
            CGFloat maxWidth = CGRectGetWidth(self.frame);
            CGFloat areaWidth = (maxWidth - 10*2 - 5*2)/3;
            UIView *view = nil;
            for (YYNewsImageURLsModel *imagesURLsModel in _newsModel.imageurls) {
                NSURL *URL = [NSURL URLWithString:imagesURLsModel.url];
                UIImageView *imageView = [[UIImageView alloc] init];
                [self.newsContentView addSubview:imageView];
                [imageView sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"contentview_image_default"]];
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(titleLabel.mas_bottom).with.offset(10);
                    make.bottom.equalTo(self.newsContentView.mas_bottom).with.offset(-20);
                    make.width.mas_equalTo(areaWidth);
                    if (view == nil) {
                        make.left.mas_equalTo(self.newsContentView.mas_left);
                    }else {
                        make.left.equalTo(view.mas_right).with.offset(5);
                    }
                }];
                
                view = imageView;
            }
            
            [sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(titleLabel.mas_left);
                make.bottom.equalTo(self.newsContentView.mas_bottom).with.offset(-1);
            }];
            [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(sourceLabel.mas_top);
                make.right.mas_equalTo(titleLabel.mas_right);
            }];
        }break;
    }
    
    
    _cellHeight = CGRectGetMaxY(self.imageView.frame);
    
}

@end
