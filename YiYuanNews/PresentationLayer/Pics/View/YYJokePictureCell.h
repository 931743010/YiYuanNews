//
//  YYJokePictureCell.h
//  YiYuanNews
//
//  Created by fun on 15/11/14.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYJokePicModel.h"

@interface YYJokePictureCell : UITableViewCell

@property (nonatomic, strong) YYJokePicModel *jokePicModel;

@property (nonatomic, assign, readonly) CGFloat cellHeight;

@end
