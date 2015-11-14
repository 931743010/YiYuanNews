//
//  YYNewsCell.h
//  YiYuanNews
//
//  Created by fun on 15/11/13.
//  Copyright © 2015年 fun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYNewsCellLayout.h"

@interface YYNewsCell : UITableViewCell

@property (nonatomic, strong) YYNewsModel *newsModel;

@property (nonatomic, assign, readonly) CGFloat cellHeight;

@end
