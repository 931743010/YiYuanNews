//
//  YYJokePictureCell.m
//  YiYuanNews
//
//  Created by fun on 15/11/14.
//  Copyright © 2015年 fun. All rights reserved.
//

#import "YYJokePictureCell.h"
#import "Masonry.h"
#import <UIImageView+WebCache.h>

@interface YYJokePictureCell ()

@property (nonatomic, weak) UIView *jokePicContentView;

@property (nonatomic, weak) UIImageView *jokePicImageView;

@end

@implementation YYJokePictureCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.contentView.backgroundColor = [UIColor lightGrayColor];
        
        UIView *jokePicContentView = [[UIView alloc] init];
        [self.contentView addSubview:jokePicContentView];
        jokePicContentView.backgroundColor = [UIColor whiteColor];
        self.jokePicContentView = jokePicContentView;
        [jokePicContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(5);
            make.left.mas_equalTo(self.contentView.mas_left);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-5);
            make.right.mas_equalTo(self.contentView.mas_right);
        }];
        
        UIImageView *jokePicImageView = [[UIImageView alloc] init];
        //jokePicImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.jokePicContentView addSubview:jokePicImageView];
        self.jokePicImageView = jokePicImageView;
        [jokePicImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(jokePicContentView.mas_top).with.offset(5);
            make.left.equalTo(jokePicContentView.mas_left).with.offset(0);
            make.bottom.equalTo(jokePicContentView.mas_bottom).with.offset(-5);
            make.right.equalTo(jokePicContentView.mas_right).with.offset(0);
        }];
        
        
        
        
    }
    
    return self;
}


- (void)setJokePicModel:(YYJokePicModel *)jokePicModel
{
    _jokePicModel = jokePicModel;
    
    NSURL *URL = [NSURL URLWithString:jokePicModel.img];
    [self.jokePicImageView sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"contentview_image_default"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        _cellHeight = image.size.height;
        NSLog(@"cell height:%f", _cellHeight);
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _cellHeight = CGRectGetMaxY(_jokePicImageView.frame);
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
